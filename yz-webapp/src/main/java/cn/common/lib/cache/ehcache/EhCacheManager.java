package cn.common.lib.cache.ehcache;

import java.io.File;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import net.sf.ehcache.config.CacheConfiguration;
import net.sf.ehcache.config.ConfigurationFactory;
import cn.common.lib.cache.AbstractCacheManager;
import cn.common.lib.cache.Cache;
/**
 * ehcache 管理器
 * @author qianhb
 *
 */
@Component
public class EhCacheManager extends AbstractCacheManager{
	private static Map<String,Cache> cacheMap = new HashMap<String, Cache>();
	private String configName = "ehcache.xml";
	protected boolean cacheEnable = true;
	private static String diskStorePath = "c://ehcache";

	//
	private net.sf.ehcache.CacheManager cacheManager = null;
	
	public EhCacheManager(){

	}
	
	/**
	 * Create a raw Cache object based on the configuration of this FactoryBean.
	 */
	private net.sf.ehcache.Cache createDefaultCache(String cacheName) {
		URL url = this.getClass().getClassLoader().getResource(configName);
		CacheConfiguration defaultCacheConfiguration = null;
		if(url != null)
			defaultCacheConfiguration = ConfigurationFactory.parseConfiguration(url).getDefaultCacheConfiguration();
		else
			defaultCacheConfiguration = ConfigurationFactory.parseConfiguration(new File(configName)).getDefaultCacheConfiguration();

		return new net.sf.ehcache.Cache(
				cacheName, defaultCacheConfiguration.getMaxElementsInMemory(),defaultCacheConfiguration.getMemoryStoreEvictionPolicy(),
				defaultCacheConfiguration.isOverflowToDisk(), diskStorePath,defaultCacheConfiguration.isEternal(), defaultCacheConfiguration.getTimeToLiveSeconds(),
		
				defaultCacheConfiguration.getTimeToIdleSeconds(), defaultCacheConfiguration.isDiskPersistent(), defaultCacheConfiguration.getDiskExpiryThreadIntervalSeconds(), null);
	}

	/**
	 * 取得指定名称的缓存
	 * 用于诸如oscache，ehcache类型缓存 自己开启不同cache实例
	 * 对于memcache 则将cachename作为key前缀模拟不同cache实例
	 *
	 * @param cacheName
	 * @return cache对象
	 */
	private Cache getCache(String cacheName){
		Cache cache = cacheMap.get(cacheName);
		if(cache == null){
			//存在
			if(!getCacheManager().cacheExists(cacheName)){
				net.sf.ehcache.Cache rawCache = createDefaultCache(cacheName);
				if(!getCacheManager().cacheExists(cacheName)){
					getCacheManager().addCache(rawCache);
				}
				cache = new EhCache(getCacheManager().getCache(cacheName));
				cacheMap.put(cacheName,cache);
			}else{
				cache = new EhCache(getCacheManager().getCache(cacheName));
				cacheMap.put(cacheName,cache);
			}
		}
		return cache;
	}

	public String getConfigName() {
		return configName;
	}
	public void setConfigName(String configName) {
		this.configName = configName;
	}
	
	public net.sf.ehcache.CacheManager getCacheManager() {
		
		if(cacheManager == null){
			URL url = this.getClass().getClassLoader().getResource(configName);
			if(url != null)
				cacheManager = net.sf.ehcache.CacheManager.create(url);
			else{
				cacheManager = net.sf.ehcache.CacheManager.create(configName);
			}
		}
		return cacheManager;
	}
	public void setCacheManager(net.sf.ehcache.CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}
	public boolean isCacheEnable() {
		return cacheEnable;
	}
	public void setCacheEnable(boolean cacheEnable) {
		this.cacheEnable = cacheEnable;
	}	
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#get(java.lang.Object)
	 */
	public Object get(Object key){
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		return cache.get(key);
	}

	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#getMulti(java.lang.String[])
	 */
	public Map<String,Object> getMulti(Object[] keys){
		if(keys.length==0)return new HashMap<String,Object>();
		String key = (String)keys[0];
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		return cache.getMulti(keys);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#put(java.lang.Object, java.lang.Object)
	 */
	public boolean put(Object key,Object value){
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		return cache.put(key, value);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#update(java.lang.Object, java.lang.Object)
	 */
	public boolean update(Object key,Object value) {
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		return cache.update(key, value);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#remove(java.lang.Object)
	 */
	public boolean remove(Object key){
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		return cache.remove(key);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#removeMulti(java.lang.Object[])
	 */
	public void removeMulti(Object[] keys){
		if(keys.length==0)return;
		String key = (String)keys[0];
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		cache.remove(keys);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#exist(java.lang.Object)
	 */
	public boolean exist(Object key){
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		return cache.exist(key);
	}

	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#clear(java.lang.String)
	 */
	public void clear(String keyPrefix){
		String instanceName = super.getInstanceNameFromKey(keyPrefix);
		Cache cache = this.getCache(instanceName);
		if(keyPrefix.endsWith("-")){//清除当前实例的所有缓存
			cache.clear();
		}else{
			cache.clear(keyPrefix);
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#clear()
	 */
	public void clear(){
		for(String key:cacheMap.keySet()){
			Cache cache = cacheMap.get(key);
			cache.clear();
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.CacheManager#flush()
	 */
	public void flush(Object key){
		String instanceName = super.getInstanceNameFromKey(key);
		Cache cache = this.getCache(instanceName);
		cache.flush();
	}
}
