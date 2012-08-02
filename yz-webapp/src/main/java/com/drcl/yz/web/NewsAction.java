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

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;
import org.springside.modules.utils.web.struts2.Struts2Utils;

import cn.common.lib.springside.util.ParamPropertyUtils;
import cn.common.lib.springside.web.CrudActionSupport;

import com.drcl.yz.contant.Global;
import com.drcl.yz.core.NewsManager;
import com.drcl.yz.entity.News;

/**
 * 
 * 前台新闻焦点、热点资讯action
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-28
 */
@Namespace("/web")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "news.action?mtype=${mtype}", type = "redirect") })
public class NewsAction extends BaseAction<News>
{

    /**
     * serialVersionUID long
     */
    private static final long serialVersionUID = 1L;

    private Long              id;

    private News              entity;

    private List<Long>        ids;

    private Page<News>        page             = new Page<News>(10);

    private int               mtype;                                // 0:新闻焦点

    // 1：热点资讯

    public int getMtype()
    {
        return mtype;
    }

    public void setMtype(int mtype)
    {
        this.mtype = mtype;
    }

    public String getTypeName()
    {
        if (mtype == 0)
        {
            return "新闻焦点";
        }
        return "热点资讯";
    }

    @Autowired
    private NewsManager newsManager;

    @Override
    public String input() throws Exception
    {
        return INPUT;
    }

    @Override
    public String delete() throws Exception
    {
        try
        {
            newsManager.delete(id);
            this.addActionMessage(Global.DELETE_SUCCESS);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            this.addActionMessage(Global.DELETE_LOSE);
        }
        return RELOAD;
    }

    /**
     * 
     * 批量删除
     * 
     * @since 2012-7-29
     * @author qingang
     * @return
     * @throws Exception
     */
    public String batchDelete() throws Exception
    {

        try
        {
            newsManager.batchDelete(ids);
            this.addActionMessage(Global.DELETE_SUCCESS);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            this.addActionMessage(Global.DELETE_LOSE);
        }
        return RELOAD;
    }

    @Override
    public String list() throws Exception
    {
        try
        {
            HttpServletRequest request = Struts2Utils.getRequest();
            List<PropertyFilter> filters = PropertyFilter
                    .buildFromHttpRequest(request);
            ParamPropertyUtils.replacePropertyRule(filters);
            filters.add(new PropertyFilter("EQI_type", "" + mtype));
            if (!page.isOrderBySetted())
            {
                page.setOrderBy("id");
                page.setOrder(Page.DESC);
            }
            page = newsManager.search(page, filters);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return SUCCESS;
    }

    @Override
    protected void prepareModel() throws Exception
    {
        if (id != null)
        {
            entity = newsManager.get(id);
        }
        else
        {
            entity = new News();
        }

    }

    @Override
    public String save() throws Exception
    {
        try
        {
            if (id == null)
            {
                entity.setCreatedate(new Date());
                entity.setType(mtype);
                entity.setIspublish(false);
            }
            newsManager.save(entity);
            this.addActionMessage(Global.SAVE_SUCCESS);
        }
        catch (Exception e)
        {
            this.addActionMessage(Global.SAVE_LOSE);
            e.printStackTrace();
        }
        return RELOAD;
    }

    public String publish() throws Exception
    {
        try
        {
            newsManager.publish(ids);
            this.addActionMessage(Global.PUBLISH_SUCCESS);
        }
        catch (Exception e)
        {
            this.addActionMessage(Global.PUBLISH_LOSE);
            e.printStackTrace();
        }
        return RELOAD;
    }

    public String cancelPublish() throws Exception
    {
        try
        {
            newsManager.cancelPublish(ids);
            this.addActionMessage(Global.CANCEL_SUCCESS);
        }
        catch (Exception e)
        {
            this.addActionMessage(Global.CANCEL_LOSE);
            e.printStackTrace();
        }
        return RELOAD;
    }

    @Override
    public News getModel()
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

    public News getEntity()
    {
        return entity;
    }

    public void setEntity(News entity)
    {
        this.entity = entity;
    }

    public List<Long> getIds()
    {
        return ids;
    }

    public void setIds(List<Long> ids)
    {
        this.ids = ids;
    }

    public Page<News> getPage()
    {
        return page;
    }

    public void setPage(Page<News> page)
    {
        this.page = page;
    }

}
