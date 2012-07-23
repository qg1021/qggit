package cn.common.lib.cache;

import java.util.Map;
/**
 * key的编制规则要定义一个命名空间，用于避免key在一个大缓存容器中重复。
 * 编制规则为：projectname+"_"+cachetype+"_"+cachecontent+"-"+id
 * "-"分隔符前面用于模拟不同缓存实例，后面为一个缓存实例中的key
 * @author qianhb
 *
 */
public interface CacheManager {
    public static final long DEFAULT_EXPIRATION_TIME = 1000L * 60 * 60 * 24;
    public static final long ONEDAY_TIME = 1000L * 60 * 60 * 24;
    
    /**
     * 默认缓存实例
     */
    public static final String DEFAULTCACHENAME = "default";
	
	/**
	 * 取得key的缓存
	 * @param key Object类型 建议字符串类型
	 * @return
	 */
	public Object get(Object key);
	
	/**
	 * 取得多个对象,key必须是同一类型的对象key
	 * @param keys 建议字符串类型
	 * @return Map<String,Object>
	 */
	public Map<String,Object> getMulti(Object[] keys);
	
	/**
	 * 放置对象到cache
	 * @param key 建议字符串类型
	 * @param value
	 */
	public boolean put(Object key,Object value);
	
	/**
	 * 更新缓存
	 * @param key 建议字符串类型
	 * @param value 成功与否
	 */
	public boolean update(Object key,Object value) ;
	
	/**
	 * 删除对象
	 * @param key 建议字符串类型
	 * @return 成功与否
	 */
	public boolean remove(Object key);
	
	/**
	 * 删除多个对象 建议字符串类型
	 * @param keys
	 */
	public void removeMulti(Object[] keys);
	
	/**
	 * 对象是否存在缓存
	 * @param key 建议字符串类型
	 * @return 成功与否
	 */
	public boolean exist(Object key);

	/**
     * 匹配前缀进行缓存清理<br>
     * 如果
     * 
     * key  编制规则为：projectname+"_"+cachetype+"_"+cachecontent+"-"+id
     * "-"分隔符前面用于模拟不同缓存实例，后面为一个缓存实例中的key 
     * @param keyPrefix 如果参数以"-"结束则清除当前实例的所有缓存
     */
	public void clear(String keyPrefix);
	
	/**
	 * 清理所有缓存
	 */
	public void clear();
	
	/**
	 * 持久化到磁盘，对于ecache和oscache有效
	 */
	public void flush(Object key);
}
