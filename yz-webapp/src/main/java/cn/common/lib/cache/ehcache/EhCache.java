package cn.common.lib.cache.ehcache;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.ehcache.Element;
import cn.common.lib.cache.Cache;


/**
 * 对ehcache实现cache的封装
 * @author qianhb
 *
 */
public class EhCache implements Cache{
	private net.sf.ehcache.Cache ehcache;
	
	public EhCache(net.sf.ehcache.Cache ehcache){
		this.ehcache = ehcache;

	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#size()
	 */
	public int size(){
		return ehcache.getSize();
	}

	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#get(java.lang.Object)
	 */
	public Object get(Object key){
		Element element = ehcache.get(key);
		return element == null?null:element.getObjectValue();	
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#get(java.io.Serializable)
	 */
	public Object get(Serializable key){
		Element element = ehcache.get(key);
		return element == null?null:element.getObjectValue();			
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#getMulti(java.lang.String[])
	 */
	public Map<String,Object> getMulti(Object[] keys){
		Map<String,Object> map = new HashMap<String,Object>();
    	for(Object object:keys){
    		map.put((String)object, ehcache.get(object));
    	}
		return map;
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#put(java.lang.Object, java.lang.Object)
	 */
	public boolean put(Object key,Object value){
		try {
			Element element = new Element( key, value );
			ehcache.put( element );
		}
		catch (IllegalArgumentException e) {
			return false;
		}
		catch (IllegalStateException e) {
			return false;
		}
		catch (net.sf.ehcache.CacheException e) {
			return false;
		}
		return true;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#update(java.lang.Object, java.lang.Object)
	 */
	public boolean update(Object key,Object value) {
		return put( key, value );
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#remove(java.lang.Object)
	 */
	public boolean remove(Object key){
		return ehcache.remove(key);
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#remove(java.io.Serializable)
	 */
	public boolean remove(Serializable key){
		return ehcache.remove(key);
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#removeMulti(java.lang.Object[])
	 */
	public void removeMulti(Object[] keys){
		for(int i=0;i<keys.length;i++){
			ehcache.remove(keys[i]);
		}
	}
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#isExist(java.lang.Object)
	 */
	public boolean exist(Object key){
		return ehcache.isKeyInCache(key);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.blueheart.cache.IF.Cache#clear(java.lang.String)
	 */
    public void clear(String keyPrefix){
    	List<?> keys = ehcache.getKeys();
    	for(Object object:keys){
    		String key = "_"+(String)object;
    		if(key.indexOf("_"+keyPrefix+"_")>-1){
    			ehcache.remove(object);
    		}
    	}    
    }
    /*
     * (non-Javadoc)
     * @see com.lansin.cache.Cache#clear()
     */
    public void clear(){
    	ehcache.removeAll();
    }
    
	/*
	 * (non-Javadoc)
	 * @see com.lansin.cache.Cache#flush()
	 */
	public void flush(){
		ehcache.flush();
	}
}
