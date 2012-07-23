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

    static String        cachePerfix       = "jsexam_oems_";

    // 项目库缓存 Key
    public static String ExamItemPrefix    = cachePerfix + "ExamItem";

    // 项目库考区 Key
    public static String ExamAreaPrefix    = cachePerfix + "ExamArea";

    // 项目库考点 Key
    public static String ExamSitePrefix    = cachePerfix + "ExamSite";

    // 项目库考场 Key
    public static String ExamRoomPrefix    = cachePerfix + "ExamRoom";

    // 项目库考场次 Key
    public static String ExamFieldPrefix   = cachePerfix + "ExamField";

    // 报名流程Key
    public static String ReprotFlowPrefix  = cachePerfix + "ReportFlow";

    // 证书项目Key
    public static String CertProjectPrefix = cachePerfix + "CertProject";

    /**
     * 
     * 生成证书项目key
     * 
     * @since 2011-11-15
     * @author qingang
     * @param prefix
     * @param orderby
     * @param order
     * @return
     */
    public static String buildCertProjectKey(boolean used)
    {
        return CertProjectPrefix + "_" + used;
    }

    /**
     * 
     * 生成key
     * 
     * @since 2011-11-15
     * @author qingang
     * @param prefix
     * @param orderby
     * @param order
     * @return
     */
    public static String buildOemsKey(String prefix, String orderby,
            String order)
    {
        return prefix + "_" + orderby + "_" + order;
    }

    /**
     * 
     * 构造报名流程key
     * 
     * @since 2012-3-21
     * @author fangyong
     * @return
     */
    public static String buildReprotFlowKey()
    {
        return ReprotFlowPrefix;
    }
}
