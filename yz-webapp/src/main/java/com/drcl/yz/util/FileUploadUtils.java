package com.drcl.yz.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.time.DateFormatUtils;

public class FileUploadUtils
{

    /**
     * 
     * 文件类型判断
     * 
     * @since 2010-12-24
     * @author qingang param fileSize 文件大小 kb
     * @return String
     */
    public static String fileTypeValidate(String uploadFileName, File upload,
            List<String> fileTypes, int fileSize)
    {

        int fsize = getFileSize(upload);// 获取文件大小
        String ext = uploadFileName.substring(
                uploadFileName.lastIndexOf(".") + 1, uploadFileName.length());
        // 获取文件类型，即扩展名,通过String类的substring方法截取字符串，lastIndexOf获取某个字符串最后出现的索引。
        ext = ext.toLowerCase().trim();// 全部转换成小写。

        if (!fileTypes.contains(ext))
        {
            return "不支持该文件类型上传，该文件类型是：" + ext;
        }
        if (fsize > fileSize)
        {

            return "文件太大,上传失败";
        }
        return null;
    }

    /**
     * 
     * 获得文件大小
     * 
     * @since 2010-12-24
     * @return int
     */
    public static int getFileSize(File upload)
    {
        FileInputStream fis = null;
        int size = 0;
        try
        {
            fis = new FileInputStream(upload);
            size = fis.available() / 1024;

        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return size;
    }

    /**
     * 
     * 保存图片
     * 
     * @since 2010-12-23
     * @param pic
     * @param picFileName
     * @return String
     */
    public static String savePicture(File pic, String picFileName,
            String localFilePath)
    {
        try
        {
            // 获得当前年月
            String date = DateFormatUtils.format(new Date(), "yyyyMM");

            // 　存储文件，获得存储后的文件名
            String fileName = cn.common.lib.util.file.FileUtils.saveFile(
                    localFilePath + "/" + date, pic, picFileName, "news");

            // 　重新设置文件名
            fileName = "/" + date + "/" + fileName;

            return fileName;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 
     * 写文件
     * 
     * @since 2012-3-27
     * @author qingang
     * @param filepath
     *            文件目录
     * @param upload
     *            文件
     * @param fileName
     * @throws IOException
     */
    public static void saveFile(String filepath, File upload, String fileName)
            throws IOException
    {
        File pathFile = new File(filepath);
        if (!pathFile.exists())
        {
            pathFile.mkdirs();
        }
        FileOutputStream output = new FileOutputStream(new File(filepath,
                fileName));
        FileInputStream input = new FileInputStream(upload);
        byte[] buffer = new byte[1024];
        int bytesRead = 0;
        while ((bytesRead = input.read(buffer)) > 0)
        {
            output.write(buffer, 0, bytesRead);
        }
        output.flush();
        output.close();
        input.close();
    }

    /**
     * 根据路径删除指定的目录或文件，无论存在与否
     * 
     * @param sPath
     *            要删除的目录或文件
     *@return 删除成功返回 true，否则返回 false。
     */
    public static boolean deleteFolder(String sPath)
    {
        boolean flag = false;
        File file = new File(sPath);
        // 判断目录或文件是否存在
        if (!file.exists())
        { // 不存在返回 false
            return flag;
        }
        else
        {
            // 判断是否为文件
            if (file.isFile())
            { // 为文件时调用删除文件方法
                return deleteFile(sPath);
            }
            else
            { // 为目录时调用删除目录方法
                return deleteDirectory(sPath);
            }
        }
    }

    /**
     * 
     * 删除单个文件
     * 
     * @since 2011-3-8
     * @author qingang
     * @author fangyong
     * @param 被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String fileName)
    {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile())
        {
            if (file.delete())
            {
                System.out.println("删除单个文件" + fileName + "成功！");
                return true;
            }
            else
            {
                System.out.println("删除单个文件" + fileName + "失败！");
                return false;
            }
        }
        else
        {
            System.out.println("删除单个文件失败：" + fileName + "不存在！");
            return false;
        }
    }

    /**
     * 删除目录（文件夹）以及目录下的文件
     * 
     * @param sPath
     *            被删除目录的文件路径
     * @return 目录删除成功返回true，否则返回false
     */
    public static boolean deleteDirectory(String sPath)
    {
        boolean flag = false;
        // 如果sPath不以文件分隔符结尾，自动添加文件分隔符
        if (!sPath.endsWith(File.separator))
        {
            sPath = sPath + File.separator;
        }
        File dirFile = new File(sPath);
        // 如果dir对应的文件不存在，或者不是一个目录，则退出
        if (!dirFile.exists() || !dirFile.isDirectory())
        {
            return false;
        }
        flag = true;
        // 删除文件夹下的所有文件(包括子目录)
        File[] files = dirFile.listFiles();
        for (File file : files)
        {
            // 删除子文件
            if (file.isFile())
            {
                flag = deleteFile(file.getAbsolutePath());
                if (!flag)
                {
                    break;
                }
            } // 删除子目录
            else
            {
                flag = deleteDirectory(file.getAbsolutePath());
                if (!flag)
                {
                    break;
                }
            }
        }
        if (!flag)
        {
            return false;
        }
        // 删除当前目录
        if (dirFile.delete())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static List<Map<String, String>> getDataFromFile(
            String uploadFileName, List<String> keyList, File upload)
    {
        String filetype = uploadFileName.substring(
                uploadFileName.lastIndexOf(".") + 1).toLowerCase();

        if (filetype.equalsIgnoreCase("xlsx"))
        {
            return ExcelUtils.excel2List(keyList, upload, false);
        }
        if (filetype.equalsIgnoreCase("xls"))
        {
            return ExcelUtils.excel2List(keyList, upload, true);
        }
        return null;
    }

    public static String[] getContentType(String filename, String postfox)
    {
        String[] downStrArray = new String[2];

        String contentType = "application/octet-stream";
        if (postfox.equalsIgnoreCase(".PDF"))// pdf
        {
            contentType = "application/pdf";
        }
        else
            if (postfox.equalsIgnoreCase(".ZIP"))// zip
            {
                contentType = "application/zip";
            }
            else
                if (postfox.equalsIgnoreCase(".RAR"))// rar
                {
                    contentType = "application/rar";
                }
                else
                    if (postfox.equalsIgnoreCase(".DOC")// word 2003
                            || postfox.equalsIgnoreCase(".DOCX"))
                    {
                        contentType = "application/msword";
                    }
                    else
                        if (postfox.equalsIgnoreCase(".XLS"))// excel 2003
                        {
                            contentType = "application/vnd.ms-excel";
                            if (filename.length() - 4 > 12)
                            {
                                filename = filename.substring(0, 12) + ".xls";
                            }
                            // file_name =
                            // article_id+".xls";//由于Excel文件名过长的话,无法打开,只能下载,所以覆盖掉原来的文件名
                        }
                        else
                            if (postfox.equalsIgnoreCase(".XLSX"))// excel 2007
                            {
                                contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                if (filename.length() - 5 > 13)
                                {
                                    filename = filename.substring(0, 12)
                                            + ".xlsx";
                                }
                            }
                            else
                                if (postfox.equalsIgnoreCase(".PPT") // ppt
                                        || postfox.equalsIgnoreCase(".PPTX"))
                                {
                                    contentType = "/vnd.ms-powerpoint";
                                }
                                else
                                    if (postfox.equalsIgnoreCase(".JPG"))// jpg
                                    {
                                        contentType = "image/jpeg";
                                    }
                                    else
                                        if (postfox.equalsIgnoreCase(".BMP"))// bmp
                                        {
                                            contentType = "image/x-xbitmap";
                                        }
                                        else
                                            if (postfox
                                                    .equalsIgnoreCase(".GIF"))// gif
                                            {
                                                contentType = "image/gif";
                                            }
                                            else
                                                if (postfox
                                                        .equalsIgnoreCase(".TXT")) // txt
                                                {
                                                    contentType = "application/txt";
                                                }
        downStrArray[0] = contentType;
        downStrArray[1] = filename;

        return downStrArray;
    }

    public static void main(String[] args) throws Exception
    {
        FileUploadUtils.saveFile("D:/aa", new File("D:/Recycle_0008.zip"),
                "0008.zip");

    }

}
