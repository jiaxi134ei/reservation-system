package com.justin.reservationsystem.config.shiro;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.crazycake.shiro.RedisCacheManager;
import org.crazycake.shiro.RedisManager;
import org.crazycake.shiro.RedisSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Description TODO
 * Created by JiaBiao on 2019/06/28 上午 10:15
 */
@Configuration
public class ShiroConfig {

    private static Logger logger = LoggerFactory.getLogger(ShiroConfig.class);

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.port}")
    private int port;

    @Value("${spring.redis.timeout}")
    private int timeout;

    @Bean
    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     *
     * @Description: ShiroDialect，为了在thymeleaf里使用shiro的标签的bean
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 11:16
     */
    @Bean
    public ShiroDialect shiroDialect(){
        return new ShiroDialect();
    }
    
    /**
     *
     * @Description: 凭证匹配器
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 11:17
     */
    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher(){
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("md5");//散列算法:这里使用MD5算法;
        hashedCredentialsMatcher.setHashIterations(2);//散列的次数，比如散列两次，相当于 md5(md5(""));
        return hashedCredentialsMatcher;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //没有登录的用户只能访问登录页面
        shiroFilterFactoryBean.setLoginUrl("/auth/login");
        //登录成功后要跳转的页面
        shiroFilterFactoryBean.setSuccessUrl("/auth/index");
        // 未授权界面; ----这个配置了没卵用，具体原因想深入了解的可以自行百度
        shiroFilterFactoryBean.setUnauthorizedUrl("/auth/403");
        //自定义
        loadShiroFilterChain(shiroFilterFactoryBean);

        return shiroFilterFactoryBean;

    }

    /**
     *
     * @Description:  加载shiroFilter权限控制规则
     * @Param:
     * @Return:
     * @Auther: JiaBiao
     * @Date:  2019/6/14 0014 上午 11:06
     */
    private void loadShiroFilterChain(ShiroFilterFactoryBean shiroFilterFactoryBean) {
        /////////////////////// 下面这些规则配置最好配置到配置文件中 ///////////////////////
        // TODO 重中之重啊，过滤顺序一定要根据自己需要排序
        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<>();
        // 需要验证的写 authc 不需要的写 anon
//        filterChainDefinitionMap.put("/static/**","anon");

        filterChainDefinitionMap.put("/static/**", "anon");    // 静态资源匿名访问
//        filterChainDefinitionMap.put("/employees/login", "anon");// 登录匿名访问
        filterChainDefinitionMap.put("/logout", "logout");    // 用户退出，只需配置logout即可实现该功
//        filterChainDefinitionMap.put("/css/**", "anon");
//        filterChainDefinitionMap.put("/js/**", "anon");
//        filterChainDefinitionMap.put("/img/**", "anon");
//        filterChainDefinitionMap.put("/auth/login", "anon");
//        filterChainDefinitionMap.put("/auth/logout", "logout");
//        filterChainDefinitionMap.put("/auth/kickout", "anon");
//        filterChainDefinitionMap.put("/**", "authc,kickout");

        // anon：它对应的过滤器里面是空的,什么都没做
        logger.info("##################从数据库读取权限规则，加载到shiroFilter中##################");

        Map<String,String> permissions = new LinkedHashMap<>();
        permissions.put("/users/find", "perms[user:find]");
        filterChainDefinitionMap.putAll(permissions);
        filterChainDefinitionMap.put("/**", "authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
    }


    @Bean
    public SecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //设置realm
        securityManager.setRealm(shiroRealm());
        //自定义缓存实现
        securityManager.setCacheManager(cacheManager());
        // 自定义session管理 使用redis
        securityManager.setSessionManager(sessionManager());

        return securityManager;
    }
    
    /**
     *
     * @Description: 身份认证realm;
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 10:47
     */
    public ShiroRealm shiroRealm() {
        ShiroRealm shiroRealm = new ShiroRealm();
        return shiroRealm;
    }
    /**
     *
     * @Description:  cacheManager 缓存 redis实现
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 10:55
     */
    public RedisCacheManager cacheManager(){
        RedisCacheManager redisCacheManager = new RedisCacheManager();
        redisCacheManager.setRedisManager(redisManager());
        return redisCacheManager;
    }
    /**
     *
     * @Description: 配置shiro redisManager
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 10:56
     */
    public RedisManager redisManager(){
        RedisManager redisManager = new RedisManager();
        redisManager.setHost(host);
        redisManager.setPort(port);
        redisManager.setExpire(1800);// 配置缓存过期时间
        redisManager.setTimeout(timeout);

        // redisManager.setPassword(password);
        return redisManager;
    }
    @Bean
    public DefaultWebSessionManager sessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setSessionDAO(redisSessionDAO());
        return sessionManager;
    }
    /**
     *
     * @Description: RedisSessionDAO shiro sessionDao层的实现 通过redis
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 10:58
     */
    @Bean
    public RedisSessionDAO redisSessionDAO(){
        RedisSessionDAO redisSessionDAO = new RedisSessionDAO();
        redisSessionDAO.setRedisManager(redisManager());
        return redisSessionDAO;
    }

    /**
     *
     * @Description: 开启shiro aop注解支持.
     * @Param:
     * @Return: 
     * @Auther: JiaBiao
     * @Date:  2019/6/28 0028 上午 11:18
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager){
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

}
