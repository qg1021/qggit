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

import java.awt.Image;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import cn.common.lib.util.file.FileUtils;
import cn.common.lib.util.web.RequestUtils;

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

    /**
     * 上传图片
     * 
     * @return
     * @throws Exception
     */

    @Override
    public String execute() throws Exception
    {
        String date = DateFormatUtils.format(new Date(), "yyyyMM");
        String realPath = RequestUtils.getRealPath(ServletActionContext
                .getServletContext(), "/");

        // 设置文件路径，优先存储在本地，如本地存储失败，则存储至服务器路径上
        String localFilePath = realPath + Global.picpath + "/" + date;

        try
        {
            if (file != null)
            {
                fileName = "";
                List<String> fileTypes = Lists.newArrayList();
                fileTypes.add("jpg");
                fileTypes.add("gif");
                fileTypes.add("png");
                Image img = ImageIO.read(file);
                if (img == null)
                {
                    message = "上传的文件非图片不符合要求";
                    return SUCCESS;
                }

                message = FileUploadUtils.fileTypeValidate(fileFileName, file,
                        fileTypes, 1024);

                if (message == null)
                {
                    fileName = FileUtils.saveFile(localFilePath, file,
                            fileFileName, "im");
                    fileName = "/" + date + "/" + fileName;
                    message = "上传成功";

                }
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
            message = "对不起,文件上传失败了!";
        }

        return SUCCESS;
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
