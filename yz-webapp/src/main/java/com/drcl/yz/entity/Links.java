package com.drcl.yz.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 
 * 友情链接、广告推广
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-24
 */
@Entity
@Table(name = "t_links")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Links extends BaseEntity
{

    /**
     * serialVersionUID long
     */
    private static final long serialVersionUID = 1L;

    private String            title;                // 标题

    private String            picurl;               // 图片路径

    private Date              createdate;           // 创建时间

    private Boolean           ispublish;            // 是否发布

    private Date              publishdate;          // 发布时间

    private String            content;              // 内容

    private String            link;                 // 链接

    private int               type;                 // 0：求购 1：供应

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getLink()
    {
        return link;
    }

    public void setLink(String link)
    {
        this.link = link;
    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
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