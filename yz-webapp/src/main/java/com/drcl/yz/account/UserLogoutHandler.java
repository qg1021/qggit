package com.drcl.yz.account;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

public class UserLogoutHandler extends SimpleUrlLogoutSuccessHandler
{

    private Properties customTargetUrl;

    @Override
    public void onLogoutSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException
    {

        String targetUrl = getDefaultTargetUrl();
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }

    public Properties getCustomTargetUrl()
    {
        return customTargetUrl;
    }

    public void setCustomTargetUrl(Properties customTargetUrl)
    {
        this.customTargetUrl = customTargetUrl;
    }
}
