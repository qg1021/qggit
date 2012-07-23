package com.drcl.yz.contant;

import java.util.ArrayList;
import java.util.List;

import cn.common.lib.vo.LabelValue;

/**
 * 
 * 城市编码
 * 
 * @author fangyong
 * @version 1.0
 * @since 2012-5-5
 */
public class CityCode
{

    public static final String     NANJING     = "A";

    public static final String     WUXI        = "B";

    public static final String     XUZHOU      = "C";

    public static final String     CHANGZHOU   = "D";

    public static final String     SUZHOU      = "E";

    public static final String     NANTONG     = "F";

    public static final String     LIANYUNGNAG = "G";

    public static final String     HUAIAN      = "H";

    public static final String     YANCHENG    = "J";

    public static final String     YANGCHENG   = "K";

    public static final String     ZHENJIANG   = "L";

    public static final String     TAIZHOU     = "M";

    public static final String     SUQIAN      = "N";

    public static List<LabelValue> enumList    = new ArrayList<LabelValue>();

    static
    {
        enumList.add(new LabelValue("南京市", NANJING));
        enumList.add(new LabelValue("无锡市", WUXI));
        enumList.add(new LabelValue("徐州市", XUZHOU));
        enumList.add(new LabelValue("常州市", CHANGZHOU));
        enumList.add(new LabelValue("苏州市", SUZHOU));
        enumList.add(new LabelValue("南通市", NANTONG));
        enumList.add(new LabelValue("连云港市", LIANYUNGNAG));
        enumList.add(new LabelValue("淮安市", HUAIAN));
        enumList.add(new LabelValue("盐城市", YANCHENG));
        enumList.add(new LabelValue("扬州市", YANGCHENG));
        enumList.add(new LabelValue("镇江市", ZHENJIANG));
        enumList.add(new LabelValue("泰州市", TAIZHOU));
        enumList.add(new LabelValue("宿迁市", SUQIAN));
    }

    /**
     * 
     * 取得城市编码描述
     * 
     * @since 2010-12-12
     * @author shanru.wu
     * @param code
     * @return
     */
    public static String getDesc(String code)
    {
        for (LabelValue lv : enumList)
        {
            if (lv.getValue().equals(code))
            {
                return lv.getLabel();
            }
        }
        return "";
    }

    /**
     * 
     * 导入Excel时以字符串形式存储(如已婚以yh存储)
     * 
     * @since 2011-2-3
     * @author shanru.wu
     * @param label
     * @return
     */
    public static String getValue(String label)
    {
        for (LabelValue lv : enumList)
        {
            if (lv.getLabel().equals(label))
            {
                return lv.getValue();
            }
        }
        return "";
    }
}
