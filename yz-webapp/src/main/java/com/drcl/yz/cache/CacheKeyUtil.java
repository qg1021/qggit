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

    // 基础数据缓存 Key
    public static String BaseDataPrefix = cachePerfix + "BaseData";

    public static String buildBaseDataKey(int type)
    {
        return BaseDataPrefix + "_" + type;
    }

}
