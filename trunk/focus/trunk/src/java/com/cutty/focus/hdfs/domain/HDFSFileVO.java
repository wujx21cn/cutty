/* com.cutty.focus.hdfs.web.domain.HDFSFileVO.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Feb 27, 2014 3:14:39 PM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

*/
package com.cutty.focus.hdfs.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.hadoop.fs.FileStatus;

/**
 *
 * <p>
 * <a href="HDFSFileVO.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */
public class HDFSFileVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4684834184731074459L;
	private String name;
	private String path;
	private long size;
	private short permission;
	private String owner;
	private long accessTime;  
	private long modificationTime;
	private boolean dir;
	private short blockReplication;
	private long blocksize;
	private String group;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}

	public short getPermission() {
		return permission;
	}
	public void setPermission(short permission) {
		this.permission = permission;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public long getAccessTime() {
		return accessTime;
	}
	public void setAccessTime(long accessTime) {
		this.accessTime = accessTime;
	}
	public long getModificationTime() {
		return modificationTime;
	}
	public void setModificationTime(long modificationTime) {
		this.modificationTime = modificationTime;
	}

	public boolean isDir() {
		return dir;
	}
	public void setDir(boolean dir) {
		this.dir = dir;
	}
	public short getBlockReplication() {
		return blockReplication;
	}
	public void setBlockReplication(short blockReplication) {
		this.blockReplication = blockReplication;
	}
	public long getBlocksize() {
		return blocksize;
	}
	public void setBlocksize(long blocksize) {
		this.blocksize = blocksize;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	
	
	public void fillField(FileStatus fileStatus){
		this.setAccessTime(fileStatus.getAccessTime());
		this.setBlockReplication(fileStatus.getReplication());
		this.setBlocksize(fileStatus.getBlockSize());
		this.setGroup(fileStatus.getGroup());
		this.setDir(fileStatus.isDir());
		this.setModificationTime(fileStatus.getModificationTime());
		this.setName(fileStatus.getPath().getName());
		this.setOwner(fileStatus.getOwner());
		this.setPath(fileStatus.getPath().toString());
		this.setPermission(fileStatus.getPermission().toShort());
		this.setSize(fileStatus.getLen());
	}

}
