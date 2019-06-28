package com.justin.reservationsystem.sitemesh;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 下午 5:25
 */
@Configuration
public class WebSiteMeshConfig {
    @Bean
    public FilterRegistrationBean filterRegistrationBean(){
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        WebSiteMeshFilter siteMeshFilter = new WebSiteMeshFilter();
        filterRegistrationBean.setFilter(siteMeshFilter);
        return filterRegistrationBean;
    }

}
