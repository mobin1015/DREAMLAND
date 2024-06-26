package com.dreamland.prj.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dreamland.prj.service.EmployeeServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/******************************************
 * 
 * - 직원등록
 * 작성자 : 고은정
 * 
 * ****************************************/

@Controller
public class EmployeeContorller {
  
  @Autowired
  private EmployeeServiceImpl employeeService;
 
  // 부서, 직급 가져오기
  @GetMapping("/employee/add")
  public String add(HttpServletRequest request, Model model) {
    model.addAttribute("request", request);
    employeeService.getDeptAndPos(model);
    return "employee/addEmployee";
    
  }
  
  // 세부 부서 가져오기
  @GetMapping(value="/employee/detailDepart.do", produces = "application/json")
  public ResponseEntity<Map<String, Object>> detailDepart(HttpServletRequest request){
    return employeeService.getDetailDepart(request);
  }
  
  // 직원 등록
  @PostMapping("/employee/add.do")
  public String addEmployee(@RequestParam("profilePath") MultipartFile profilePath, HttpServletRequest request, HttpServletResponse response) {
    employeeService.addEmployee(profilePath, request, response);
    return "redirect:/employee/add";
  }
  
  // 이메일 중복체크
  @PostMapping(value="/employee/emailCheck.do", produces = "application/json")
  public ResponseEntity<Map<String, Object>> emailCheck(HttpServletRequest request){
    return employeeService.emailCheck(request);
  }
  

    
}