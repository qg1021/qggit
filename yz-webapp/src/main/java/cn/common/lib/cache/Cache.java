package cn.common.lib.cache;

import java.io.Serializable;
import java.util.Map;
/**
 * 缓存接口
 * key的编制规则要定义一个命名空间，用于避免key在一个大缓存容器中重复。
 * 建议编制规则为：projectname+"_"+cachetype+"_"+cachecontent+"-"+id
 * "-"分隔符前面用于模拟不同缓存实例，后面为一个缓存实例中的key
 * @author qianhb
 *
 */
public interface Cache {

	/**
	 * 取得key的缓存
	 * @param key Object类型
	 * @return
	 */
	public Object get(Object key);
	
	/**
	 * 取得key的缓存
	 * @param key
	 * @return
	 */
	public Object get(Serializable key);
	
	/**
	 * 取得多个对象
	 * @param keys
	 * @return Map<String,Object>
	 */
	public Map<String,Object> getMulti(Object[] keys);
	
	/**
	 * 放置对象到cache
	 * @param key
	 * @param value
	 */
	public boolean put(Object key,Object value);
	
	/**
	 * 更新缓存
	 * @param key
	 * @param value 成功与否
	 */
	public boolean update(Object key,Object value) ;
	
	/**
	 * 删除对象
	 * @param key
	 * @return 成功与否
	 */
	public boolean remove(Object key);
	
	/**
	 * 删除对象
	 * @param key
	 * @return 成功与否
	 */
	public boolean remove(Serializable key);
	
	/**
	 * 删除多个对象
	 * @param keys
	 */
	public void removeMulti(Object[] keys);
	
	/**
	 * 对象是否存在缓存
	 * @param key
	 * @return 成功与否
	 */
	public boolean exist(Object key);

	/**
     * 匹配前缀进行缓存清理
     * key必须是按照"_"+key+"_"生成的
     * @param keyPrefix
     */
	public void clear(String keyPrefix);
	
	/**
	 * 清理缓存
	 */
	public void clear();
	
	/**
	 * cache信息简介
	 * @return String
	 */
	public String toString() ;
	
	/**
	 * 缓存当前容量
	 * @return
	 */
	public int size();
	
	/**
	 * 持久化到磁盘，对于ecache和oscache有效
	 */
	public void flush();

}
