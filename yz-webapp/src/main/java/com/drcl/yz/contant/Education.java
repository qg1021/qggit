//-------------------------------------------------------------------------
// Copyright (c) 2000-2010 Digital. All Rights Reserved.
//
// This software is the confidential and proprietary information of
// Digital
//
// Original author: Administrator
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

import java.util.ArrayList;
import java.util.List;

import cn.common.lib.vo.LabelValue;

/**
 * 
 * 学历
 * 
 * @author fangyong
 * @version 1.0
 * @since 2012-2-16
 */

public class Education
{

    public static final String     GAOZHONG   = "高中";

    public static final String     JIXIAO     = "技校";

    public static final String     ZHONGZHUAN = "中专";

    public static final String     DAZHUAN    = "大专/高职";

    public static final String     BENKE      = "本科";

    public static final String     SHUOSHI    = "硕士";

    public static final String     BOSHI      = "博士";

    public static final String     QITA       = "其他";

    public static List<LabelValue> enumList   = new ArrayList<LabelValue>();

    static
    {
        enumList.add(new LabelValue(GAOZHONG, GAOZHONG));
        enumList.add(new LabelValue(JIXIAO, JIXIAO));
        enumList.add(new LabelValue(ZHONGZHUAN, ZHONGZHUAN));
        enumList.add(new LabelValue(DAZHUAN, DAZHUAN));
        enumList.add(new LabelValue(BENKE, BENKE));
        enumList.add(new LabelValue(SHUOSHI, SHUOSHI));
        enumList.add(new LabelValue(BOSHI, BOSHI));
        enumList.add(new LabelValue(QITA, QITA));

    }

}
