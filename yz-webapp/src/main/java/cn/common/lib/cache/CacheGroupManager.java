package cn.common.lib.cache;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
/**
 * 按照缓存管理器设置的先后顺序处理缓存
 * @author qianhb
 *
 */
public class CacheGroupManager {
    private CacheManager cacheManagers[];
    public void setCacheManagers(CacheManager cacheManagers[])
    {
        this.cacheManagers = cacheManagers;
    }

    /**
     * 取得对象
     * @param key
     * @return
     */
	public Object get(Object key){
		for(CacheManager cm:cacheManagers){
			Object obj = cm.get(key);
			if(obj != null)
				return obj;
		}
		return null;
	}
	
	/**
	 * 取得多个对象
	 * @param keys
	 * @return Map<String,Object> 主键是key
	 */
	public Map<String,Object> getMulti(Object[] keys){
		for(CacheManager cm:cacheManagers){
			Map<String,Object> obj = cm.getMulti(keys);
			if(obj != null)
				return obj;
		}
		return new HashMap<String,Object>();
	}
	
	/**
	 * 放置对象到cache
	 * @param key
	 * @param value
	 */
	public boolean put(Object key,Object value){
		for(CacheManager cm:cacheManagers){
			boolean res = cm.put(key, value);
			if(!res) return res;
		}
		return true;
	}
	
	/**
	 * 更新缓存
	 * @param key
	 * @param value
	 */
	public boolean update(Object key,Object value) {
		for(CacheManager cm:cacheManagers){
			boolean res = cm.update(key, value);
			if(!res) return res;
		}
		return true;
	}
	
	/**
	 * 删除对象
	 * @param key
	 * @return 必须都成功
	 */
	public boolean remove(Object key){
		for(CacheManager cm:cacheManagers){
			boolean res = cm.remove(key);
			if(!res) return res;
		}
		return true;
	}
	
	/**
	 * 删除对象
	 * @param key
	 * @return 成功与否 必须都成功
	 */
	public boolean remove(Serializable key){
		for(CacheManager cm:cacheManagers){
			boolean res = cm.remove(key);
			if(!res) return res;
		}
		return true;
	}
	
	/**
	 * 删除多个对象
	 * @param keys
	 */
	public void removeMulti(Object[] keys){
		for(CacheManager cm:cacheManagers){
			cm.removeMulti(keys);
		}
	}
	
	/**
	 * 对象是否存在缓存
	 * @param key
	 * @return 有一个存在即可
	 */
	public boolean isExist(Object key){
		for(CacheManager cm:cacheManagers){
			if(cm.exist(key)){
				return true;
			}
		}
		return false;
	}
	/**
     * 匹配前缀进行缓存清理
     * key必须是按照"_"+key+"_"生成的
     * @param keyPrefix
     */
	public void clear(String keyPrefix){
		for(CacheManager cm:cacheManagers){
			cm.clear(keyPrefix);
		}
	}
	
	/**
	 * 清理缓存
	 */
	public void clear(){
		for(CacheManager cm:cacheManagers){
			cm.clear();
		}
	}
	
	/**
	 * 持久化到磁盘，对于ecache和oscache有效
	 */
	public void flush(Object key){
		for(CacheManager cm:cacheManagers){
			cm.flush(key);
		}
	}
}




