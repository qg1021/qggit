package com.drcl.yz.web;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * Description of the class
 *
 * @author            qingang
 * @version           1.0
 * @since             2011-11-7
 */

public class IndexAction extends ActionSupport{

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
