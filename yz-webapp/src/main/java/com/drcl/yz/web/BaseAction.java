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
package com.drcl.yz.web;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import cn.common.lib.springside.web.CrudActionSupport;

import com.drcl.yz.core.LinksManager;
import com.drcl.yz.entity.Links;
import com.google.common.collect.Lists;

/**
 * Description of the class
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-8-2
 */
@SuppressWarnings("serial")
public abstract class BaseAction<T> extends CrudActionSupport<T>
{
    @Autowired
    protected LinksManager linksManager;

    public List<Links> getRightLinksList()
    {
        List<Links> list = Lists.newArrayList();
        List<Links> rlist = Lists.newArrayList();
        list = linksManager.search(Links.TYPE_1, 10);
        if (list != null && !list.isEmpty())
        {
            Random ra = new Random();
            if (list.size() > 2)
            {
                rlist.add(list.get(ra.nextInt(list.size() - 1)));
                rlist.add(list.get(ra.nextInt(list.size() - 1)));
            }
            else
            {
                return list;
            }
        }
        return rlist;
    }
}
