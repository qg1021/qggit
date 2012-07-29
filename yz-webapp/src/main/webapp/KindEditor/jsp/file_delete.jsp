<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="org.json.simple.JSONObject"%>
<%!
	/**
	 * 删除该文件夹下的所有文件
	 * 
	 * @param file
	 */
	private void deleteFile(File folder) {
		// 读取该文件夹下的所有文件对象
		File[] files = folder.listFiles();
		if (files.length > 0) {
			// 删除文件夹下所有文件
			for (File file : files) {
				if (file.isDirectory()) {
					// 如果是文件夹，就自己调用自己
					deleteFile(file);
				} else {
					// 删除该文件
					file.delete();
				}
			}
		}
		// 如果没有内容了，就删除该对象
		folder.delete();
	}
%>
<%

	String deleteFilePath = request.getParameter("file");
	deleteFilePath = new String(deleteFilePath.getBytes("ISO-8859-1"),"UTF-8");
	deleteFilePath = deleteFilePath.substring(deleteFilePath.indexOf("/attached/") + 10);
	// 获得当前真实路径
	//根目录路径，可以指定绝对路径，比如 /var/www/attached/
	deleteFilePath = pageContext.getServletContext().getRealPath("/attached/" + deleteFilePath) ;

	File file = new File(deleteFilePath);
	String message = "";
	if (file.exists()) {
		if (file.isDirectory()) {
			// 如果是文件夹，那么要使用递归删除
			deleteFile(file);
		} else {
			file.delete();
		}
		message = "该文件夹或者文件路径删除成功！";
	} else {
		message = "该文件夹或者文件路径不存在，请检查！";
	}
	JSONObject obj = new JSONObject();
	obj.put("error", 1);
	obj.put("message", message);
	out.println(obj.toJSONString());
%>