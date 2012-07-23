package com.drcl.yz.account;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.AuthenticationEntryPoint;

public class LoginPageEntryPoint implements AuthenticationEntryPoint
{

    private Properties customTargetUrl;

    private String     defaultTargetUrl;

    @Override
    public void commence(
            HttpServletRequest request,
            HttpServletResponse response,
            org.springframework.security.core.AuthenticationException authException)
            throws IOException, ServletException
    {

        defaultTargetUrl = "/login.action";

        response.sendRedirect(request.getContextPath() + defaultTargetUrl);

    }

    public Properties getCustomTargetUrl()
    {
        return customTargetUrl;
    }

    public void setCustomTargetUrl(Properties customTargetUrl)
    {
        this.customTargetUrl = customTargetUrl;
    }

    public String getDefaultTargetUrl()
    {
        return defaultTargetUrl;
    }

    public void setDefaultTargetUrl(String defaultTargetUrl)
    {
        this.defaultTargetUrl = defaultTargetUrl;
    }

}
