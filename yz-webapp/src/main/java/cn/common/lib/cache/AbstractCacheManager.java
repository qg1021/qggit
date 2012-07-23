package cn.common.lib.cache;

public abstract class AbstractCacheManager implements CacheManager {
	/**
	 * 按照如下规则解析：<br>
	 * projectname+"_"+cachetype+"_"+cachecontent+"-"+id<br>
	 * "-"分隔符前面用于模拟不同缓存实例，后面为一个缓存实例中的key
	 * @param key 建议字符串类型
	 * @return
	 */
	protected String getInstanceNameFromKey(Object key){
		String keyStr = (String)key;
		int pos = keyStr.indexOf("-");
		if(pos>0){
			return keyStr.substring(0,pos);
		}else{
			return CacheManager.DEFAULTCACHENAME;
		}
	}
}
