package com.drcl.yz.web;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.drcl.yz.core.BusinessManager;
import com.drcl.yz.core.IntroductionManager;
import com.drcl.yz.core.LinksManager;
import com.drcl.yz.core.LocalfeelingManager;
import com.drcl.yz.core.NewsManager;
import com.drcl.yz.entity.Business;
import com.drcl.yz.entity.Introduction;
import com.drcl.yz.entity.Links;
import com.drcl.yz.entity.Localfeeling;
import com.drcl.yz.entity.News;
import com.google.common.collect.Lists;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 首页
 * 
 * @author qingang
 * @version 1.0
 * @since 2011-11-7
 */
@Namespace("/")
public class IndexAction extends ActionSupport
{

    /**
     * 
     */
    private static final long   serialVersionUID = 1L;

    @Autowired
    private BusinessManager     businessManager;

    @Autowired
    private IntroductionManager introductionManager;

    @Autowired
    private NewsManager         newsManager;

    @Autowired
    private LinksManager        linksManager;

    @Autowired
    private LocalfeelingManager localfeelingManager;

    private List<Business>      businessList     = Lists.newArrayList(); // 域名出售

    private List<News>          focousList       = Lists.newArrayList(); // 焦点新闻

    private List<News>          hotnewsList      = Lists.newArrayList(); // 热点资讯

    private List<Localfeeling>  specialtyList    = Lists.newArrayList(); // 扬州特产

    private List<Localfeeling>  spotsList        = Lists.newArrayList(); // 扬州景点

    private List<Localfeeling>  tourList         = Lists.newArrayList(); // 扬州旅游

    private List<Links>         linksList        = Lists.newArrayList(); // 扬州旅游

    private List<Introduction>  intrList         = Lists.newArrayList();

    public List<Introduction> getIntrList()
    {
        return intrList;
    }

    public void setIntrList(List<Introduction> intrList)
    {
        this.intrList = intrList;
    }

    @Override
    public String execute() throws Exception
    {
        try
        {
            this.businessList = businessManager.search(6);
            this.focousList = newsManager.search(News.TYPE_0, 6);
            this.hotnewsList = newsManager.search(News.TYPE_1, 6);
            this.specialtyList = localfeelingManager.search(
                    Localfeeling.TYPE_0, 6);
            this.spotsList = localfeelingManager.search(Localfeeling.TYPE_1, 6);
            this.tourList = localfeelingManager.search(Localfeeling.TYPE_2, 6);
            this.linksList = linksManager.search(Links.TYPE_0, 6);
            this.intrList = introductionManager.search(Introduction.TYPE_0, 1);
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "index";
    }

    public List<Business> getBusinessList()
    {
        return businessList;
    }

    public void setBusinessList(List<Business> businessList)
    {
        this.businessList = businessList;
    }

    public List<News> getFocousList()
    {
        return focousList;
    }

    public void setFocousList(List<News> focousList)
    {
        this.focousList = focousList;
    }

    public List<News> getHotnewsList()
    {
        return hotnewsList;
    }

    public void setHotnewsList(List<News> hotnewsList)
    {
        this.hotnewsList = hotnewsList;
    }

    public List<Localfeeling> getSpecialtyList()
    {
        return specialtyList;
    }

    public void setSpecialtyList(List<Localfeeling> specialtyList)
    {
        this.specialtyList = specialtyList;
    }

    public List<Localfeeling> getSpotsList()
    {
        return spotsList;
    }

    public void setSpotsList(List<Localfeeling> spotsList)
    {
        this.spotsList = spotsList;
    }

    public List<Localfeeling> getTourList()
    {
        return tourList;
    }

    public void setTourList(List<Localfeeling> tourList)
    {
        this.tourList = tourList;
    }

    public List<Links> getLinksList()
    {
        return linksList;
    }

    public void setLinksList(List<Links> linksList)
    {
        this.linksList = linksList;
    }

}
