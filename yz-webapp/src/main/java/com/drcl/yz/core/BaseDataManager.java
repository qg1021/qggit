//-------------------------------------------------------------------------
// Copyright (c) 2000-2010 Digital. All Rights Reserved.
//
// This software is the confidential and proprietary information of
// Digital
//
// Original author: qingang
//
//-------------------------------------------------------------------------
// LOOSOFT MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF
// THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
// TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE, OR NON-INFRINGEMENT. UFINITY SHALL NOT BE
// LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING,
// MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.
//
// THIS SOFTWARE IS NOT DESIGNED OR INTENDED FOR USE OR RESALE AS ON-LINE
// CONTROL EQUIPMENT IN HAZARDOUS ENVIRONMENTS REQUIRING FAIL-SAFE
// PERFORMANCE, SUCH AS IN THE OPERATION OF NUCLEAR FACILITIES, AIRCRAFT
// NAVIGATION OR COMMUNICATION SYSTEMS, AIR TRAFFIC CONTROL, DIRECT LIFE
// SUPPORT MACHINES, OR WEAPONS SYSTEMS, IN WHICH THE FAILURE OF THE
// SOFTWARE COULD LEAD DIRECTLY TO DEATH, PERSONAL INJURY, OR SEVERE
// PHYSICAL OR ENVIRONMENTAL DAMAGE ("HIGH RISK ACTIVITIES"). UFINITY
// SPECIFICALLY DISCLAIMS ANY EXPRESS OR IMPLIED WARRANTY OF FITNESS FOR
// HIGH RISK ACTIVITIES.
//-------------------------------------------------------------------------
package com.drcl.yz.core;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.common.lib.cache.CacheManager;
import cn.common.lib.springside.orm.BaseDao;

import com.drcl.yz.api.BaseDataDao;
import com.drcl.yz.cache.CacheKeyUtil;
import com.drcl.yz.entity.BaseData;

/**
 * 基础数据业务逻辑类
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-25
 */
@Component
@Transactional
public class BaseDataManager extends CacheEntityManager<BaseData, Long>
{
    @Autowired
    private BaseDataDao  baseDataDao;

    @Autowired
    @Qualifier("ehCacheManager")
    private CacheManager cacheManager;

    /**
     * {@inheritDoc}
     * 
     * @since 2012-7-25
     * @see cn.common.lib.springside.service.EntityManager#getEntityDao()
     */
    @Override
    protected BaseDao<BaseData, Long> getEntityDao()
    {
        return baseDataDao;
    }

    @Override
    public void save(BaseData entity)
    {

        baseDataDao.save(entity);
        cacheManager.clear(CacheKeyUtil.BaseDataPrefix);
    }

    /**
     * 
     * 批量删除
     * 
     * @since 2012-7-26
     * @author qingang
     * @param ids
     */
    public void batchDelete(List<Long> ids)
    {
        baseDataDao.batchDelete(ids);
        cacheManager.clear(CacheKeyUtil.BaseDataPrefix);
    }

    @Override
    public void delete(Long id)
    {
        super.delete(id);
        cacheManager.clear(CacheKeyUtil.BaseDataPrefix);
    }

    /**
     * 
     * 通过type查询基础数据列表
     * 
     * @since 2012-7-26
     * @author qingang
     * @param type
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<BaseData> searchByType(int type)
    {

        String cacheKey = CacheKeyUtil.buildBaseDataKey(type);
        Object object = cacheManager.get(cacheKey);
        if (object == null)
        {// get from db
            List<BaseData> list = baseDataDao.searchByType(type);
            // 从对象列表中取得key列表
            cacheManager.put(cacheKey, getIDs(list));
            return list;
        }
        else
        {
            List<Long> idList = (List<Long>) object;
            return super.getObjectsbyIds(idList);
        }
    }

}
