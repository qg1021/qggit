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
package com.drcl.yz.web.manage;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.security.springsecurity.SpringSecurityUtils;

import cn.common.lib.springside.web.CrudActionSupport;

import com.drcl.yz.contant.Global;
import com.drcl.yz.core.AccountManager;
import com.drcl.yz.entity.User;

/**
 * 
 * 修改口令action
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-28
 */
@Namespace("/backend")
public class UserAction extends CrudActionSupport<User>
{

    /**
     * serialVersionUID long
     */
    private static final long serialVersionUID = 1L;

    private Long              id;

    private User              entity;

    @Autowired
    private AccountManager    accountManager;

    @Override
    public String input() throws Exception
    {
        return INPUT;
    }

    @Override
    public String list() throws Exception
    {

        return SUCCESS;
    }

    @Override
    protected void prepareModel() throws Exception
    {
        if (id != null)
        {
            entity = accountManager.getUser(id);
        }
        else
        {
            entity = accountManager.findUserByLoginName(SpringSecurityUtils
                    .getCurrentUserName());
        }

    }

    @Override
    public String save() throws Exception
    {
        try
        {
            accountManager.saveUser(entity);
            this.addActionMessage(Global.SAVE_SUCCESS);
        }
        catch (Exception e)
        {
            this.addActionMessage(Global.SAVE_LOSE);
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @Override
    public User getModel()
    {
        return entity;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

}
