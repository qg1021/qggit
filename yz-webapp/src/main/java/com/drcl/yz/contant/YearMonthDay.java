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

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import cn.common.lib.vo.LabelValue;

import com.google.common.collect.Lists;

/**
 * 
 * 年、月、日
 * 
 * @author qingang
 * @version 1.0
 * @since 2011-6-8
 */
public class YearMonthDay
{
    public static List<LabelValue> monthList = new ArrayList<LabelValue>();
    static
    {
        monthList.add(new LabelValue("01", "1"));
        monthList.add(new LabelValue("02", "2"));
        monthList.add(new LabelValue("03", "3"));
        monthList.add(new LabelValue("04", "4"));
        monthList.add(new LabelValue("05", "5"));
        monthList.add(new LabelValue("06", "6"));
        monthList.add(new LabelValue("07", "7"));
        monthList.add(new LabelValue("08", "8"));
        monthList.add(new LabelValue("09", "9"));
        monthList.add(new LabelValue("10", "10"));
        monthList.add(new LabelValue("11", "11"));
        monthList.add(new LabelValue("12", "12"));

    }

    /**
     * 
     * 年
     * 
     * @since 2011-6-8
     * @author qingang
     * @param pre
     *            前pre年
     * @param next
     *            后next年
     * @return
     */
    public static List<LabelValue> getYear(int pre, int next)
    {
        List<LabelValue> yearList = Lists.newArrayList();
        Calendar cal = Calendar.getInstance();
        int currentYear = cal.get(Calendar.YEAR);

        for (int i =currentYear - pre;i< currentYear + next; i++)
        {
            yearList.add(new LabelValue(String.valueOf(i), String.valueOf(i)));
        }

        return yearList;

    }
}
