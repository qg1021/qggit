package com.drcl.yz.core;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.common.lib.springside.orm.BaseDao;
import cn.common.lib.springside.service.EntityManager;

import com.drcl.yz.api.RoleDao;
import com.drcl.yz.entity.Role;

/**
 * 用户角色实体的管理类.
 */
// Spring Bean的标识.
@Component
// 默认将类中的所有函数纳入事务管理.
@Transactional
public class RoleManager extends EntityManager<Role, Long>
{

    @Autowired
    private RoleDao roleDao;

    /**
     * 
     * 根据角色名称查询角色
     * 
     * @since 2012-2-16
     * @author fangyong
     * @param name
     * @return
     */
    public Role findByName(String name)
    {
        if (StringUtils.isBlank(name))
        {
            return null;
        }
        return roleDao.findUniqueBy("name", name);
    }

    @Override
    protected BaseDao<Role, Long> getEntityDao()
    {
        return roleDao;
    }
}
