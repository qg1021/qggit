package com.drcl.yz.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 
 * 招商信息
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-24
 */
@Entity
@Table(name = "t_business")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Business extends BaseEntity
{

    /**
     * serialVersionUID long
     */
    private static final long serialVersionUID = 1L;

    private String            title;                // 标题

    private String            content;              // 内容

    private String            picurl;               // 图片路径

    private Date              createdate;           // 创建时间

    private Boolean           ispublish;            // 是否发布

    private Date              publishdate;          // 发布时间

    @Transient
    public String getStatusName()
    {
        if (ispublish)
        {
            return "已发布";
        }
        return "未发布";
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getPicurl()
    {
        return picurl;
    }

    public void setPicurl(String picurl)
    {
        this.picurl = picurl;
    }

    public Date getCreatedate()
    {
        return createdate;
    }

    public void setCreatedate(Date createdate)
    {
        this.createdate = createdate;
    }

    public Boolean getIspublish()
    {
        return ispublish;
    }

    public void setIspublish(Boolean ispublish)
    {
        this.ispublish = ispublish;
    }

    public Date getPublishdate()
    {
        return publishdate;
    }

    public void setPublishdate(Date publishdate)
    {
        this.publishdate = publishdate;
    }

}