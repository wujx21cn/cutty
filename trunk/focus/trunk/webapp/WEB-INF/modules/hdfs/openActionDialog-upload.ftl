		{

	"dialogtitle": "Showing source of file: testmysql.php",
	"height": 500,
	"autoScroll": true,
	"html": "<pre class=\"php\" style=\"font-family:monospace;\"><ol><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\"><span style=\"color: #000000; font-weight: bold;\">&lt;?php</span> </div></li><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\"><span style=\"color: #000088;\">$link</span> <span style=\"color: #339933;\">=</span> <a href=\"http://www.php.net/mysql_connect\"><span style=\"color: #990000;\">mysql_connect</span></a><span style=\"color: #009900;\">&#40;</span><span style=\"color: #0000ff;\">\'hostname\'</span><span style=\"color: #339933;\">,</span><span style=\"color: #0000ff;\">\'dbuser\'</span><span style=\"color: #339933;\">,</span><span style=\"color: #0000ff;\">\'dbpassword\'</span><span style=\"color: #009900;\">&#41;</span><span style=\"color: #339933;\">;</span> </div></li><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\"><span style=\"color: #b1b100;\">if</span> <span style=\"color: #009900;\">&#40;</span><span style=\"color: #339933;\">!</span><span style=\"color: #000088;\">$link</span><span style=\"color: #009900;\">&#41;</span> <span style=\"color: #009900;\">&#123;</span> </div></li><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\">	<a href=\"http://www.php.net/die\"><span style=\"color: #990000;\">die</span></a><span style=\"color: #009900;\">&#40;</span><span style=\"color: #0000ff;\">\'Could not connect to MySQL: \'</span> <span style=\"color: #339933;\">.</span> <a href=\"http://www.php.net/mysql_error\"><span style=\"color: #990000;\">mysql_error</span></a><span style=\"color: #009900;\">&#40;</span><span style=\"color: #009900;\">&#41;</span><span style=\"color: #009900;\">&#41;</span><span style=\"color: #339933;\">;</span> </div></li><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\"><span style=\"color: #009900;\">&#125;</span> </div></li><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\"><span style=\"color: #b1b100;\">echo</span> <span style=\"color: #0000ff;\">\'Connection OK\'</span><span style=\"color: #339933;\">;</span> <a href=\"http://www.php.net/mysql_close\"><span style=\"color: #990000;\">mysql_close</span></a><span style=\"color: #009900;\">&#40;</span><span style=\"color: #000088;\">$link</span><span style=\"color: #009900;\">&#41;</span><span style=\"color: #339933;\">;</span> </div></li><li style=\"font-weight: normal; vertical-align:top;\"><div style=\"font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;\"><span style=\"color: #000000; font-weight: bold;\">?&gt;</span> </div></li></ol></pre><hr /><div style=\"line-height:25px;vertical-align:middle;text-align:center;\" class=\"small\">Rendering Time: <strong>0.18083310127258 Sec.</strong></div>"

}
		