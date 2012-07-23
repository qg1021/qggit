package com.drcl.yz.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class UserFailureHandler extends SimpleUrlAuthenticationFailureHandler
{
    public UserFailureHandler()
    {
        super();
    }

    public UserFailureHandler(String defaultFailureUrl)
    {
        super(defaultFailureUrl);
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
            HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException
    {

        String defaultFailureUrl = "/login.action";
        // String uri = request.getHeader("Referer");

        saveException(request, exception);

        getRedirectStrategy()
                .sendRedirect(request, response, defaultFailureUrl);

    }
}
