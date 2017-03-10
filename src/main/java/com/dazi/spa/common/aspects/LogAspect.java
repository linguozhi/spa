package com.dazi.spa.common.aspects;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * @desc: 日志Aop
 * @author:linguozhi@52tt.com
 * @date: 2016/12/13
 */
@Component
@Aspect
public class LogAspect {
    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Pointcut("execution(* com.dazi.spa.console..*.*(..)) && !execution(* com.dazi.spa.console.BaseController.*(..))")
    private void pointCutMethod(){}

    /**
     * 用户访问日志记录
     * @param jp
     */
    @Before("pointCutMethod()")
    public void doBefore(JoinPoint jp) {
        Subject subject = SecurityUtils.getSubject();
        String userName = (String)subject.getPrincipal();
        if(!StringUtils.isEmpty(userName)) {
            logger.info("用户[{}]访问了{}", userName, jp.getSignature().toShortString());
        }
    }
}
