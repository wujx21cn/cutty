/* com.cutty.focus.hdfs.fileHelper.impl.DefaultHDFSHelper.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Feb 27, 2014 3:42:47 PM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

*/
package com.cutty.focus.hdfs.fileHelper.impl;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.stereotype.Service;

import com.cutty.focus.hdfs.domain.HDFSFileVO;
import com.cutty.focus.hdfs.exception.ConnectionException;
import com.cutty.focus.hdfs.fileHelper.HDFSHelper;
import com.cutty.focus.server.domain.HadoopCluster;
import com.cutty.focus.server.domain.HadoopNode;

/**
 *
 * <p>
 * <a href="DefaultHDFSHelper.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */


@Service("defaultHDFSHelper")
public class DefaultHDFSHelper implements HDFSHelper{
	
	public static final String VERSION= "DEFAULT";
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	public String getHadoopVersion() {
		return VERSION;
	}
	
	public List<HDFSFileVO> getSubFiles(HadoopCluster hadoopCluster ,String path) throws ConnectionException {
		List<HDFSFileVO> fileList = new ArrayList<HDFSFileVO>();
		HadoopNode nameNode = hadoopCluster.getNameNode();
		String hdfsServer = "hdfs://" + nameNode.getHostIP();
		String serverFolder = hdfsServer+path;
		FileSystem fs = null;
		Configuration conf =new Configuration();
		try {
			fs = FileSystem.get(URI.create(hdfsServer),conf);
			FileStatus[]  filesStatuses = fs.listStatus(new Path(serverFolder));
			for (FileStatus fileStatus : filesStatuses){
				HDFSFileVO hDFSFileVO = new HDFSFileVO();
				hDFSFileVO.fillField(fileStatus);
				fileList.add(hDFSFileVO);
			}
		} catch (IOException e) {
			logger.error("IOException", e);
			throw new ConnectionException(e.getMessage());
		} finally {
			if (null != fs)  {
				try {
					fs.close();
					fs=null;
				} catch (IOException e) {
					logger.error("close HDFS connection error!", e);
					throw new ConnectionException(e.getMessage());
				}
			}
		}
		return fileList;
	}

	

}
