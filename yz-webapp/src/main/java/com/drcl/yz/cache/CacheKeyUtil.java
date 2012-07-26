package com.drcl.yz.cache;

/**
 * 
 * 缓存工具类
 * 
 * @author qingang
 * @version 1.0
 * @since 2011-11-9
 */
public class CacheKeyUtil
{

    static String        cachePerfix    = "yz_";

    /** 基础数据Key **/

    public static String BaseDataPrefix = cachePerfix + "BaseData";

    /** 招商信息Key **/

    public static String BusinessPrefix = cachePerfix + "Business";

    /** 求购、供应Key **/

    public static String BuyPrefix      = cachePerfix + "Buy";

    public static String buildBuyKey(int type)
    {
        return BuyPrefix + "_" + type;
    }

    public static String buildBaseDataKey(int type)
    {
        return BaseDataPrefix + "_" + type;
    }

    public static String buildBusinessKey(int pagesize)
    {
        return BaseDataPrefix + "_" + pagesize;
    }

}
