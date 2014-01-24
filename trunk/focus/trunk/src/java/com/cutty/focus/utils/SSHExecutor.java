/* com.cutty.focus.utils.SSHExecutor.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Jan 23, 2014 8:57:07 PM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

 */
package com.cutty.focus.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.ChannelExec;

/**
 * 
 * <p>
 * <a href="SSHExecutor.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

public class SSHExecutor implements ShellExecutor {

	protected static final Log logger = LogFactory.getLog(SSHExecutor.class);
	protected static final int SSH_PORT = 22;

	private int exitCode;
	private StringBuffer output;
	private String commandString;

	final StringBuffer errorMessage = new StringBuffer();

	public SSHExecutor() throws Exception {
	}

	public void executeCommand(String host, String user, String passwd,String command, int portNumber) throws Exception {
		exitCode=0;output=null;commandString=null;errorMessage.setLength(0);
		commandString = command;
		JSch jsch = new JSch();
		Session session = jsch.getSession(user, host, 22);
		session.setPassword(passwd);
		java.util.Properties config = new java.util.Properties();
		config.put("StrictHostKeyChecking", "no");
		session.setConfig(config);
		session.connect(30000);

		Channel channel = session.openChannel("exec");
		((ChannelExec) channel).setCommand(command);
		channel.setInputStream(null);

		final BufferedReader errReader = new BufferedReader(
				new InputStreamReader(((ChannelExec) channel).getErrStream()));
		BufferedReader inReader = new BufferedReader(new InputStreamReader(
				channel.getInputStream()));

		channel.connect();
		Thread errorThread = new Thread() {
			@Override
			public void run() {
				try {
					String line = errReader.readLine();
					while ((line != null) && !isInterrupted()) {
						errorMessage.append(line);
						errorMessage.append("\n");
						line = errReader.readLine();
					}
				} catch (IOException ioe) {
					logger.warn("Error reading the error stream", ioe);
				}
			}
		};

		try {
			errorThread.start();
		} catch (IllegalStateException e) {
			logger.debug(e);
		}
		try {
			parseExecResult(inReader);
			String line = inReader.readLine();
			while (line != null) {
				line = inReader.readLine();
			}

			if (channel.isClosed()) {
				exitCode = channel.getExitStatus();
				logger.debug("exit-status: " + exitCode);
			}
			try {
				errorThread.join();
			} catch (InterruptedException ie) {
				logger.warn("Interrupted while reading the error stream", ie);
			}
		} catch (Exception ie) {
			throw new IOException(ie.toString());
		} finally {
			try {
				inReader.close();
			} catch (IOException ioe) {
				logger.warn("Error while closing the input stream", ioe);
			}
			try {
				errReader.close();
			} catch (IOException ioe) {
				logger.warn("Error while closing the error stream", ioe);
			}
			channel.disconnect();
			session.disconnect();
		}
	}

	@Override
	public void executeCommand(String host, String user, String passwd,
			String command) throws Exception {
		executeCommand(host, user, passwd, command, SSH_PORT);
	}

	@Override
	public int getExitCode() {
		return exitCode;
	}

	protected void parseExecResult(BufferedReader lines) throws IOException {
		output = new StringBuffer();
		char[] buf = new char[512];
		int nRead;
		while ((nRead = lines.read(buf, 0, buf.length)) > 0) {
			output.append(buf, 0, nRead);
		}
	}

	@Override
	public String getOutput() {
		return (output == null) ? "" : output.toString();
	}

	@Override
	public String getCommandString() {
		return commandString;
	}
	
	public static void main(String[] args) throws Exception{
		ShellExecutor executor = new SSHExecutor();
		executor.executeCommand("192.168.222.129", "hadoop", "hadoop", "cd /home ;ls ;ls -rtl");
		System.out.println(executor.getOutput());
	}
}
