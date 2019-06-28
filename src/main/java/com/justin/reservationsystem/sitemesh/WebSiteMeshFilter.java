package com.justin.reservationsystem.sitemesh;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 5:24
 */
public class WebSiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/*","/layout/default")
                .addExcludedPath("/static/*") //静态资源不拦截
                .addExcludedPath("/auth/login**"); //登录页面不拦截

    }
}
