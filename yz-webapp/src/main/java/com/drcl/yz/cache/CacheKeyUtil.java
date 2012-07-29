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

    static String        cachePerfix        = "yz_";

    /** 基础数据Key **/

    public static String BaseDataPrefix     = cachePerfix + "BaseData";

    /** 招商信息Key **/

    public static String BusinessPrefix     = cachePerfix + "Business";

    /** 求购、供应Key **/

    public static String BuyPrefix          = cachePerfix + "Buy";

    /** 平台简介、联系我们Key **/

    public static String IntroductionPrefix = cachePerfix + "Introduction";

    /** 友情链接、广告推广Key **/

    public static String LinksPrefix        = cachePerfix + "Links";

    /** 当地特产、户外旅游、名胜古迹信息Key **/
    public static String LocalfeelingPrefix = cachePerfix + "Localfeeling";

    /** 新闻焦点、热点资讯信息Key **/
    public static String NewsPrefix         = cachePerfix + "News";

    public static String buildNewsKey(int type)
    {
        return NewsPrefix + "_" + type;
    }

    public static String buildLocalfeelingKey(int type)
    {
        return LocalfeelingPrefix + "_" + type;
    }

    public static String buildLinksKey(int type)
    {
        return LinksPrefix + "_" + type;
    }

    public static String buildBuyKey(int type)
    {
        return BuyPrefix + "_" + type;
    }

    public static String buildIntroductionKey(int type)
    {
        return IntroductionPrefix + "_" + type;
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
