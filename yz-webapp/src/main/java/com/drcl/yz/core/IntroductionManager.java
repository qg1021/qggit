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
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;

import cn.common.lib.cache.CacheManager;
import cn.common.lib.springside.orm.BaseDao;

import com.drcl.yz.api.IntroductionDao;
import com.drcl.yz.cache.CacheKeyUtil;
import com.drcl.yz.entity.Introduction;
import com.google.common.collect.Lists;

/**
 * 平台简介、联系我们逻辑类
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-25
 */
@Component
@Transactional
public class IntroductionManager extends CacheEntityManager<Introduction, Long>
{
    @Autowired
    private IntroductionDao introductionDao;

    @Autowired
    @Qualifier("ehCacheManager")
    private CacheManager    cacheManager;

    /**
     * {@inheritDoc}
     * 
     * @since 2012-7-25
     * @see cn.common.lib.springside.service.EntityManager#getEntityDao()
     */
    @Override
    protected BaseDao<Introduction, Long> getEntityDao()
    {
        return introductionDao;
    }

    @Override
    public void save(Introduction entity)
    {

        introductionDao.save(entity);
        cacheManager.clear(CacheKeyUtil.IntroductionPrefix);
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
        introductionDao.batchDelete(ids);
        cacheManager.clear(CacheKeyUtil.IntroductionPrefix);
    }

    @Override
    public void delete(Long id)
    {
        super.delete(id);
        cacheManager.clear(CacheKeyUtil.IntroductionPrefix);
    }

    /**
     * 
     * 取一定数量的求购、供应信息数据
     * 
     * @since 2012-7-26
     * @author qingang
     * @param pagesize
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Introduction> search(int type, int pagesize)
    {

        String cacheKey = CacheKeyUtil.buildIntroductionKey(type);
        Object object = cacheManager.get(cacheKey);
        if (object == null)
        {// get from db
            Page<Introduction> page = new Page<Introduction>(pagesize);
            List<PropertyFilter> filters = Lists.newArrayList();
            filters.add(new PropertyFilter("EQI_type", String.valueOf(type)));
            List<Introduction> list = introductionDao.findPage(page, filters)
                    .getResult();
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
