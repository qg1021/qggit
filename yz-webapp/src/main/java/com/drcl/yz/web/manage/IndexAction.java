package com.drcl.yz.web.manage;

import org.apache.struts2.convention.annotation.Namespace;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 网站后台首页
 * 
 * @author qingang
 * @version 1.0
 * @since 2012-7-21
 */
@Namespace("/backend")
public class IndexAction extends ActionSupport
{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    public String execute() throws Exception
    {
        System.out.println("=-=-=-=-=-=-=-=");
        return "index";
    }

}
