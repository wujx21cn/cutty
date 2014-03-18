package com.cutty.focus.hdfs.fileHelper;

import java.util.List;

import com.cutty.focus.hdfs.domain.HDFSFileVO;
import com.cutty.focus.hdfs.exception.ConnectionException;
import com.cutty.focus.server.domain.HadoopCluster;

public interface HDFSHelper {
	
	public String getHadoopVersion();
	
	public List<HDFSFileVO> getSubFiles(HadoopCluster hadoopCluster ,String path) throws ConnectionException;
}
