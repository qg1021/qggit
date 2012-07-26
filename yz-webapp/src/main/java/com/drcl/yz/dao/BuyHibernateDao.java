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
package com.drcl.yz.dao;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springside.modules.orm.hibernate.HibernateDao;

import com.drcl.yz.api.BuyDao;
import com.drcl.yz.entity.Buy;

/**
 * 
 * 求购、供应数据访问类
 * 
 * @author qingang
 * @version 1.0
 * @since 2011-11-8
 */
@Component
public class BuyHibernateDao extends HibernateDao<Buy, Long> implements BuyDao
{

    /**
     * {@inheritDoc}
     * 
     * @since 2012-7-26
     * @see com.drcl.yz.api.BuyDao#batchDelete(java.util.List)
     */
    @Override
    public void batchDelete(List<Long> ids)
    {
        String hql = "delete from Buy where id in(:ids)";
        Map<String, List<Long>> values = Collections.singletonMap("ids", ids);
        super.batchExecute(hql, values);

    }

    /**
     * {@inheritDoc}
     * 
     * @since 2012-7-26
     * @see com.drcl.yz.api.BuyDao#publish(java.util.List, java.lang.Boolean)
     */
    @Override
    public void publish(List<Long> ids, Boolean isPublish)
    {
        String hql = "update Buy set ispublish = :ispublish , publishdate = :publishdate where id in(:ids)";
        Map<String, Object> values = new HashMap<String, Object>();
        values.put("ispublish", isPublish);
        values.put("publishdate", new Date());
        values.put("ids", ids);
        super.batchExecute(hql, values);

    }

}
