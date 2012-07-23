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
package com.drcl.yz.contant;

import java.util.List;

import cn.common.lib.vo.LabelValue;

import com.google.common.collect.Lists;

/**
 * 
 * 全局静态变量
 * 
 * @author qingang
 * @version 1.0
 * @since 2011-11-15
 */
public class Global
{
    public final static int          MAX_PAGESIZE          = 2000;                 // 最大数据量

    public final static String       STYLE_PATH            = "/style";

    public final static String       SCORE_PATH            = "/score";             // 中心服务上传的分数包

    public final static String       SCORE_NAME            = "Recycle_";

    public final static String       ARRANGE_PATH          = "/arrange";

    public final static String       TEMPLATE_PATH         = "template";

    public final static String       CETTEMPLATE_PATH      = "/certtemplate";      // 保存考生个人照片的路径

    public final static String       STUDENTPIC_PATH       = "/studentpic";        // 保存考生个人照片的路径

    public final static String       IDCARD_PATH           = "/idcardpic";         // 保存考生身份证扫描件的路径

    public final static int          STUDENTPIC_MAXSIZE    = 2 * 1024;             // 保存考生个人照片的文件最大字节

    public final static int          IDCARD_MAXSIZE        = 2 * 1024;             // 保存考生个人照片的文件最大字节

    public final static int          STUDENTPIC_MAXELEMENT = 1200;                 // 保存考生个人照片的照片最大像素

    public final static int          STUDENTPIC_MINELEMENT = 600;                  // 保存考生个人照片的照片最小像素

    public final static String       STUDENTPIC_EXT        = "jpg";                // 保存考生个人照片的允许的格式

    public final static String       STUDENTPIC_PREFIX     = "stupic";             // 保存考生个人照片的照片前缀名

    public final static String       TABLE_DELETE          = "D";                  // jquery

    // table
    // 删除标识位

    public final static String       TABLE_EDIT            = "E";                  // jquery

    // table
    // 编辑标识位

    public final static String       EXPORT_SUCCESS        = "导出成功";

    public final static String       EXPORT_LOSE           = "导出失败";

    public final static String       AUDIT_SUCCESS         = "审核成功";

    public final static String       AUDIT_LOSE            = "审核失败";

    public final static String       UNAUDIT_SUCCESS       = "审核不通过成功";

    public final static String       UNAUDIT_LOSE          = "审核不通过失败";

    public final static String       SAVE_SUCCESS          = "保存成功";

    public final static String       SAVE_LOSE             = "保存失败";

    public final static String       UPLOAD_SUCCESS        = "上传成功";

    public final static String       UPLOAD_LOSE           = "上传失败";

    public final static String       DELETE_SUCCESS        = "上传成功";

    public final static String       DELETE_LOSE           = "上传失败";

    public final static String       FIELD_EXISTED         = "此时间单元已存在";

    public final static String       IMPORT_NO_DATA        = "导入的文件没有数据或者模版不正确";

    public final static String       IMPORT_NO_FILE        = "没有导入文件";

    public static List<LabelValue>   FLOW_TYPES            = Lists
                                                                   .newArrayList();

    public final static double       DEFAULT_PASS          = 60;

    public final static double       DEFAULT_EXCELLENT     = 90;

    public final static String       EV_SUBJECT            = "所有科目";

    public final static String       EV_AREA               = "所有考区";

    public final static String       EV_SITE               = "所有考点";

    public static String[]           LETTER_ARRAY          = { "A", "B", "C",
            "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
            "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
    static
    {
        FLOW_TYPES.add(new LabelValue("0", "省考务设置考次科目和考试配置"));
        FLOW_TYPES.add(new LabelValue("1", "省考务设置和分配时间单元"));
        FLOW_TYPES.add(new LabelValue("2", "省考务设置报名条件和时间表"));
        FLOW_TYPES.add(new LabelValue("3", "省考务下发考试安排至考区"));
        FLOW_TYPES.add(new LabelValue("4", "考区汇总上报考试资源至省考务"));
        FLOW_TYPES.add(new LabelValue("5", "考区审核并上报通过名单"));
        FLOW_TYPES.add(new LabelValue("6", "省考务下发准考名单和未通过名单至考区"));
        FLOW_TYPES.add(new LabelValue("7", "考区汇总上报报名确认名单"));
        FLOW_TYPES.add(new LabelValue("8", "省考务排考"));
        FLOW_TYPES.add(new LabelValue("9", "省考务生成准考证"));
        FLOW_TYPES.add(new LabelValue("10", "省考务下发和导出考务信息"));

    }

    public static String             DEFAULT_WRITE_MAJOR   = "请填写专业";

    public final static String       ATTACH_PATH           = "/newsattach";        // 保存培训资讯和报名流程附件的路径

    public final static String       ATTACH_PREFIX         = "att";                // 保存培训资讯和报名流程附件的前缀名

    public final static int          ATTACH_MAXSIZE        = 5 * 1024;             // 保存培训资讯和报名流程附件时的文件最大字节

    public static final List<String> ATTACHFILETYPES       = Lists
                                                                   .newArrayList(); // 培训资讯和报名流程附件时允许上传的类型

    static
    {
        ATTACHFILETYPES.add("rar");
        ATTACHFILETYPES.add("zip");
        ATTACHFILETYPES.add("doc");
        ATTACHFILETYPES.add("docx");
        ATTACHFILETYPES.add("xls");
        ATTACHFILETYPES.add("xlsx");
        ATTACHFILETYPES.add("txt");
        ATTACHFILETYPES.add("ppt");
        ATTACHFILETYPES.add("pptx");
        ATTACHFILETYPES.add("pdf");

    }

    public static final List<String> CERTTEMIMAGEFILETYPES = Lists
                                                                   .newArrayList(); // 证书模板图片允许上传的类型
    static
    {
        CERTTEMIMAGEFILETYPES.add("jpg");
        CERTTEMIMAGEFILETYPES.add("JPG");
        CERTTEMIMAGEFILETYPES.add("png");
        CERTTEMIMAGEFILETYPES.add("PNG");
        CERTTEMIMAGEFILETYPES.add("gif");
        CERTTEMIMAGEFILETYPES.add("GIF");
    }

    public final static String       CERTTEMPLATE_PREFIX   = "ctemp";              // 保存证书模板图片的前缀名
}
