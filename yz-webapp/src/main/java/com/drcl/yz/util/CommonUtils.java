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
package com.drcl.yz.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class CommonUtils
{
    /**
     * 
     * 计算时间差 结果单位 分钟
     * 
     * @since 2011-12-1
     * @author qingang
     * @param one
     * @param two
     * @return
     */
    public static long getDateTimeBetween(Date one, Date two)
    {
        Calendar cone = Calendar.getInstance();
        Calendar ctwo = Calendar.getInstance();
        cone.setTime(one);
        ctwo.setTime(two);
        return ((ctwo.getTimeInMillis() - cone.getTimeInMillis()) / 1000 / 60);

    }

    public static String convertParam(String s)
    {
        return "%" + s + "%";
    }

    /**
     * 
     * 获取当前时间年
     * 
     * @since 2011-7-20
     * @author qingang
     * @return
     */
    public static int getCurrentYear()
    {
        return Calendar.getInstance().get(Calendar.YEAR);
    }

    /**
     * 
     * 获取当前时间月
     * 
     * @since 2012-4-6
     * @author qingang
     * @return
     */
    public static int getCurrentMonth()
    {
        return Calendar.getInstance().get(Calendar.MONTH);
    }

    /**
     * 生成考次前缀
     * 
     * @since 2012-4-6
     * @author qingang
     * @return
     */
    public static String getExamTimesPrefix(String year, String month)
    {

        return (year + (month.length() < 2 ? "0" + month : month)).substring(2);
    }

    /**
     * 
     * 数字字符串不足len位前面补零 (ns:1,len:2 "1"-->"01")
     * 
     * @since 2012-6-19
     * @author qingang
     * @param ns
     * @param len
     *            预定字符串长度
     * @return
     */
    public static String getNumberString(String ns, int len)
    {
        if (ns.length() >= len)
        {
            return ns;
        }
        else
        {
            int i = 0;
            StringBuffer s = new StringBuffer();
            while (i < (len - ns.length()))
            {
                s.append("0");
                i++;
            }
            s.append(ns);
            return s.toString();
        }
    }

    public static String getrannumber()
    {
        StringBuffer strbufguess = new StringBuffer();
        String strguess = new String();
        int[] nums = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        Random rannum = new Random();
        int count;
        int i = 0, temp_i = 0;
        for (int j = 10; j > 4; j--)
        {
            i = 0;
            temp_i = 0;
            count = rannum.nextInt(j);
            while (i <= count)
            {
                if (nums[temp_i] == -1)
                {
                    temp_i++;
                }
                else
                {
                    i++;
                    temp_i++;
                }
            }
            strbufguess.append(Integer.toString(nums[temp_i - 1]));
            nums[temp_i - 1] = -1;
        }
        strguess = strbufguess.toString();
        rannum = null;
        strbufguess = null;
        nums = null;
        return strguess;
    }

    /**
     * 取小数点后两位四舍五入
     * 
     * @param a
     * @return
     */
    public static double getDecimal(double a)
    {
        BigDecimal bd = new BigDecimal(a);
        bd = bd.setScale(3, BigDecimal.ROUND_HALF_UP);
        return bd.doubleValue();
    }

    /**
     * 计算百分比
     * 
     * @param a
     * @param b
     * @return
     */
    public static String getPercent(long a, long b)
    {
        if (b != 0)
        {
            return getDecimal(((double) a / (double) b)) * 100 + "%";
        }
        else
        {
            return "0%";
        }
    }

    /**
     * 
     * 获取当前时间
     * 
     * @since 2012-7-29
     * @author qingang
     * @param format
     * @return
     */
    public static String getCurrentDate(String format)
    {
        return new SimpleDateFormat(format).format(new Date());

    }

    public static void main(String[] args) throws Exception
    {
        System.err.println("--------------" + getNumberString("1", 2));
        // System.out.println("-----------------"+String.valueOf(getCurrentYear()).substring(String.valueOf(getCurrentYear()).length()-2));
    }
}
