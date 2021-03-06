package com.fabulous.www.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component // 스프링에서 관리하는 bean 객체
@Aspect // 횡단관심(공통업무)를 지원하는 클래스
public class LogAdvice {
	private static final Logger logger = 
			LoggerFactory.getLogger(LogAdvice.class);
	
	// JoinPoint : method가 호출되는 시점
	// @Before(전처리), @After(후처리), @Around(전후처리)
	
	@Around(
			"execution(* com.fabulous.www.controller..*Controller.*(..))"
			+ " or execution(* com.fabulous.www.service..*Impl.*(..))"
			+ " or execution(* com.fabulous.www.model..dao..*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		long start = System.currentTimeMillis();
		Object result = joinPoint.proceed(); // 핵심업무 실행
		
		// 호출한 클래스 이름
		String type = joinPoint.getSignature().getDeclaringTypeName();
		String name = "";
		if(type.indexOf("controller") > -1) {
			name ="Controller \t:";
		} else if(type.indexOf("Service") > -1) {
			name ="ServiceImpl \t:";
		} else if(type.indexOf("DAO") > -1) {
			name = "DaoImpl \t:";
		}
		// 호출한 클래스, method 정보
		
		logger.info(name+"."+joinPoint.getSignature().getName()+"");
		// method에 전달되는 매개변수들
		
		logger.info(Arrays.toString(joinPoint.getArgs()));
		long end = System.currentTimeMillis();
		long time = end-start;
		logger.info("실행시간:"+time);
		return result;
	}
}
