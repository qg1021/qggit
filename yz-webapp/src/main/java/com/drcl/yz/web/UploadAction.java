//-------------------------------------------------------------------------
// Copyright (c) 2000-2010 Digital. All Rights Reserved.
//
// This software is the confidential and proprietary information of
// Digital
//
// Original author: qingang
//
//-------------------------------------------------------------------------
// LOOSOFT MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF
// THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
// TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE, OR NON-INFRINGEMENT. UFINITY SHALL NOT BE
// LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
// MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
//
// THIS SOFTWARE IS NOT DESIGNED OR INTENDED FOR USE OR RESALE AS ON-LINE
// CONTROL EQUIPMENT IN HAZARDOUS ENVIRONMENTS REQUIRING FAIL-SAFE
// PERFORMANCE, SUCH AS IN THE OPERATION OF NUCLEAR FACILITIES, AIRCRAFT
// NAVIGATION OR COMMUNICATION SYSTEMS, AIR TRAFFIC CONTROL, DIRECT LIFE
// SUPPORT MACHINES, OR WEAPONS SYSTEMS, IN WHICH THE FAILURE OF THE
// SOFTWARE COULD LEAD DIRECTLY TO DEATH, PERSONAL INJURY, OR SEVERE
// PHYSICAL OR ENVIRONMENTAL DAMAGE ("HIGH RISK ACTIVITIES"). UFINITY
// SPECIFICALLY DISCLAIMS ANY EXPRESS OR IMPLIED WARRANTY OF FITNESS FOR
// HIGH RISK ACTIVITIES.
//-------------------------------------------------------------------------
package com.drcl.yz.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springside.modules.utils.web.struts2.Struts2Utils;

import cn.common.lib.util.file.FileUtils;
import cn.common.lib.util.web.ParamUtils;
import cn.common.lib.util.web.PropertyUtils;
import cn.common.lib.util.web.RequestUtils;
import cn.common.lib.vo.LabelValue;

import com.drcl.yz.contant.Global;
import com.drcl.yz.util.FileUploadUtils;
import com.google.common.collect.Lists;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * ajax方式上传文件
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-5-28
 */
@ParentPackage("json-default")
@Namespace("/")
@Results( {
        @Result(name = "success", type = "json", params = { "contentType",
                "text/html" }),
        @Result(name = "error", type = "json", params = { "contentType",
                "text/html" }) })
public class UploadAction extends ActionSupport
{
    private static final long serialVersionUID = 1L;

    private File              file;

    private String            fileFileName;

    private File              idimage;

    private String            idimageFileName;

    private String            fileName;

    private String            message;

    private int               width;

    private int               height;

    @Override
    public String execute() throws Exception
    {
        String date = DateFormatUtils.format(new Date(), "yyyyMM");
        String realPath = RequestUtils.getRealPath(ServletActionContext
                .getServletContext(), "/");

        // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
        String localFilePath = PropertyUtils.getProperty("upload.path",
                realPath)
                + Global.STYLE_PATH + "/" + date;

        try
        {
            if (file != null)
            {
                fileName = "";
                List<String> fileTypes = Lists.newArrayList();
                fileTypes.add("zip");
                fileTypes.add("rar");
                message = FileUploadUtils.fileTypeValidate(fileFileName, file,
                        fileTypes, 1024);

                if (message == null)
                {
                    fileName = FileUtils.saveFile(localFilePath, file,
                            fileFileName, "style");
                    fileName = "/" + date + "/" + fileName;
                    message = Global.UPLOAD_SUCCESS;

                }
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
            message = Global.UPLOAD_LOSE;
        }

        return SUCCESS;
    }

    public String pic() throws Exception
    {
        String date = DateFormatUtils.format(new Date(), "yyyyMM");
        String realPath = RequestUtils.getRealPath(ServletActionContext
                .getServletContext(), "/");

        // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
        String localFilePath = PropertyUtils.getProperty("upload.path",
                realPath)
                + Global.STUDENTPIC_PATH + "/" + date;

        try
        {
            if (file != null)
            {
                fileName = "";
                List<String> fileTypes = Lists.newArrayList();
                fileTypes.add("jpg");
                message = FileUploadUtils.fileTypeValidate(fileFileName, file,
                        fileTypes, Global.STUDENTPIC_MAXSIZE);

                if (message == null)
                {
                    fileName = FileUtils.saveFile(localFilePath, file,
                            fileFileName, Global.STUDENTPIC_PREFIX);
                    fileName = "/" + date + "/" + fileName;
                    message = Global.UPLOAD_SUCCESS;

                }
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
            message = Global.UPLOAD_LOSE;
        }

        return SUCCESS;
    }

    /**
     * 
     * 上传身份证扫描件
     * 
     * @since 2012-5-28
     * @author qingang
     * @return
     * @throws Exception
     */
    public String idcard() throws Exception
    {
        String date = DateFormatUtils.format(new Date(), "yyyyMM");
        String realPath = RequestUtils.getRealPath(ServletActionContext
                .getServletContext(), "/");

        // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
        String localFilePath = PropertyUtils.getProperty("upload.path",
                realPath)
                + Global.IDCARD_PATH + "/" + date;

        try
        {
            if (idimage != null)
            {
                fileName = "";
                List<String> fileTypes = Lists.newArrayList();
                fileTypes.add("jpg");
                fileTypes.add("gif");
                fileTypes.add("png");
                message = FileUploadUtils.fileTypeValidate(idimageFileName,
                        idimage, fileTypes, Global.IDCARD_MAXSIZE);

                if (message == null)
                {
                    fileName = FileUtils.saveFile(localFilePath, idimage,
                            idimageFileName, Global.STUDENTPIC_PREFIX);
                    fileName = "/" + date + "/" + fileName;
                    message = Global.UPLOAD_SUCCESS;

                }
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
            message = Global.UPLOAD_LOSE;
        }

        return SUCCESS;
    }

    // 上传考生照片
    public String uploadStudentPic() throws Exception
    {
        // 允许上传的照片格式
        List<String> fileType = Lists.newArrayList();
        fileType.add(Global.STUDENTPIC_EXT);

        // 验证照片的格式和大小
        message = FileUploadUtils.fileTypeValidate(fileFileName, file,
                fileType, Global.STUDENTPIC_MAXSIZE);

        // 判断照片的像素,读取源图像
        BufferedImage bi = ImageIO.read(file);
        int srcWidth = bi.getWidth(); // 源图宽度
        int srcHeight = bi.getHeight(); // 源图高度
        // if (srcWidth < Global.STUDENTPIC_MINELEMENT
        // || srcWidth > Global.STUDENTPIC_MAXELEMENT
        // || srcHeight < Global.STUDENTPIC_MINELEMENT
        // || srcHeight > Global.STUDENTPIC_MAXELEMENT)
        // {
        // message = "文件尺寸不符合要求,上传失败";
        // }

        if (message == null)
        {
            String date = DateFormatUtils.format(new Date(), "yyyyMM");
            String realPath = RequestUtils.getRealPath(ServletActionContext
                    .getServletContext(), "/");

            // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
            String localFilePath = PropertyUtils.getProperty("upload.path",
                    realPath)
                    + Global.STUDENTPIC_PATH + "/" + date;

            try
            { // 　存储文件，获得存储后的文件名
                fileName = FileUtils.saveFile(localFilePath, file,
                        fileFileName, Global.STUDENTPIC_PREFIX);
                fileName = "/" + date + "/" + fileName;// 附件后加上日期方便保存到数据库中
                this.width = srcWidth;
                this.height = srcHeight;
            }
            catch (Exception e)
            {
                e.printStackTrace();
                message = "对不起,文件上传失败了!";
            }
        }
        return SUCCESS;
    }

    // 上传附件
    public String uploadAttach() throws Exception
    {
        // 验证附件的格式和大小
        message = FileUploadUtils.fileTypeValidate(fileFileName, file,
                Global.ATTACHFILETYPES, Global.ATTACH_MAXSIZE);

        if (message == null)
        {
            String date = DateFormatUtils.format(new Date(), "yyyyMM");
            String realPath = RequestUtils.getRealPath(ServletActionContext
                    .getServletContext(), "/");

            // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
            String localFilePath = PropertyUtils.getProperty("upload.path",
                    realPath)
                    + Global.ATTACH_PATH + "/" + date;

            try
            { // 　存储文件，获得存储后的文件名
                fileName = FileUtils.saveFile(localFilePath, file,
                        fileFileName, Global.ATTACH_PREFIX);
                fileName = "/" + date + "/" + fileName;// 附件后加上日期方便保存到数据库中
            }
            catch (Exception e)
            {
                e.printStackTrace();
                message = "对不起,附件上传失败了!";
            }
        }
        return SUCCESS;
    }

    // 上传证书模板图片
    public String uploadCertTemImage() throws Exception
    {
        // 验证附件的格式和大小
        message = FileUploadUtils.fileTypeValidate(fileFileName, file,
                Global.CERTTEMIMAGEFILETYPES, Global.ATTACH_MAXSIZE);

        if (message == null)
        {
            String date = DateFormatUtils.format(new Date(), "yyyyMM");
            String realPath = RequestUtils.getRealPath(ServletActionContext
                    .getServletContext(), "/");

            // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
            String localFilePath = PropertyUtils.getProperty("upload.path",
                    realPath)
                    + Global.CETTEMPLATE_PATH + File.separator + date;

            try
            { // 　存储文件，获得存储后的文件名
                fileName = FileUtils.saveFile(localFilePath, file,
                        fileFileName, Global.CERTTEMPLATE_PREFIX);
                fileName = File.separator + date + File.separator + fileName;// 附件后加上日期方便保存到数据库中
            }
            catch (Exception e)
            {
                e.printStackTrace();
                message = "对不起,图片上传失败了!";
            }
        }

        return SUCCESS;
    }

    // 删除附件
    public String deleteAttch()
    {
        try
        {
            HttpServletRequest request = Struts2Utils.getRequest();
            String attachmentPath = ParamUtils.getParameter(request,
                    "attachmentPath", null);
            String filePath = PropertyUtils.getProperty("upload.path",
                    RequestUtils.getRealPath(ServletActionContext
                            .getServletContext(), "/"))
                    + Global.ATTACH_PATH + attachmentPath;

            // 判断附件是否已存在,如存在则删除
            if (!FileUploadUtils.deleteFile(filePath))
            {
                Struts2Utils.renderJson(new LabelValue("对不起，附件删除失败", ""));
            }
        }
        catch (Exception e)
        {
            Struts2Utils.renderJson(new LabelValue("系统异常，删除失败", ""));
        }
        return null;
    }

    public File getFile()
    {
        return file;
    }

    public void setFile(File file)
    {
        this.file = file;
    }

    public String getFileFileName()
    {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName)
    {
        this.fileFileName = fileFileName;
    }

    public String getFileName()
    {
        return fileName;
    }

    public void setFileName(String fileName)
    {
        this.fileName = fileName;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public int getWidth()
    {
        return width;
    }

    public int getHeight()
    {
        return height;
    }

    public File getIdimage()
    {
        return idimage;
    }

    public void setIdimage(File idimage)
    {
        this.idimage = idimage;
    }

    public String getIdimageFileName()
    {
        return idimageFileName;
    }

    public void setIdimageFileName(String idimageFileName)
    {
        this.idimageFileName = idimageFileName;
    }
}
