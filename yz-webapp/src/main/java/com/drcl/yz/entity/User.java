package com.drcl.yz.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.google.common.collect.Lists;

/**
 * 用户
 */
@Entity
@Table(name = "acct_user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User extends BaseEntity
{

    /**
     * serialVersionUID long
     */
    private static final long  serialVersionUID = 1L;

    /**
     * 用户名
     */

    private String             loginName;

    /**
     * 姓名
     */

    private String             name;

    /**
     * 密码
     */

    private String             password;

    private Date               createDate;                 // 创建时间

    public static final String DEFAULT_PASSWORD = "123456"; // 用户默认密码

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    // 多对多定义
    @ManyToMany
    // 中间表定义,表名采用默认命名规则
    @JoinTable(name = "acct_user_role", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = { @JoinColumn(name = "role_id") })
    // Fecth策略定义
    @Fetch(FetchMode.SUBSELECT)
    // 集合按id排序.
    @OrderBy("id")
    // 集合中对象id的缓存.
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    private List<Role> roleList = Lists.newArrayList(); // 有序的关联对象集合

    public String getLoginName()
    {
        return loginName;
    }

    public void setLoginName(String loginName)
    {
        this.loginName = loginName;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public List<Role> getRoleList()
    {
        return roleList;
    }

    public void setRoleList(List<Role> roleList)
    {
        this.roleList = roleList;
    }

}
