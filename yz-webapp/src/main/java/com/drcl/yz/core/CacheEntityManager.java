package com.drcl.yz.core;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springside.modules.utils.reflection.ReflectionUtils;

import cn.common.lib.springside.service.EntityManager;

import com.google.common.collect.Lists;

/**
 * 缓存业务基类
 * @author houbing.qian
 *
 * @param <T>
 * @param <PK>
 */
@Component
public abstract class CacheEntityManager<T, PK extends Serializable> extends EntityManager<T, PK>
{
	/**
	 * 从对象列表中取得id列表
	 * @param dataList
	 * @return
	 */
    @SuppressWarnings("unchecked")
	protected List<PK> getIDs(List<T> dataList){
    	List<PK> idList = Lists.newArrayList(); 
    	for(T t : dataList){
    		idList.add((PK)ReflectionUtils.invokeGetterMethod(t, "id"));
    	}
    	return idList;
    }
    
    /**
     * 将id列表转化成对象列表
     * @param idList
     * @return
     */
    @SuppressWarnings("unchecked")
	protected List<T> getObjectsbyIds(List<PK> idList){
    	List<T> dataList = Lists.newArrayList(); 
    	for(PK pk : idList){
    		Object object2 = super.get(pk);
    		if(object2 !=null)dataList.add((T)object2);
    	}
    	return dataList;
    }

}
