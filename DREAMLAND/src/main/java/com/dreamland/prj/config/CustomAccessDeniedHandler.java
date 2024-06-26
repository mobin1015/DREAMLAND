package com.dreamland.prj.config;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/******************************************
 * 
 * 접근제어 예외처리
 * 작성자 : 고은정
 * 
 * ****************************************/
public class CustomAccessDeniedHandler implements AccessDeniedHandler{
  @Override
  public void handle(HttpServletRequest request, HttpServletResponse response,
      AccessDeniedException accessDeniedException) throws IOException, ServletException {
      response.sendRedirect("/auth/error");
  }

}
