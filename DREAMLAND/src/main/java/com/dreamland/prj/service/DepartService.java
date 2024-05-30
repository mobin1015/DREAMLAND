package com.dreamland.prj.service;

import java.util.List;

import com.dreamland.prj.dto.DepartmentDto;
import com.dreamland.prj.dto.EmployeeDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface DepartService {

  public List<DepartmentDto> getDepartList();       // 조직도 조회
  void removeDepart(DepartmentDto departmentDto);   // 부서 삭제
  void removeEmployee(EmployeeDto employeetDto);    // 직원 삭제
  
  DepartmentDto getDepartById(int deptNo);          // 노드 클릭 후 부서 조회
  EmployeeDto getEmployeeById(int empNo);           // 노드 클릭 후 직원 조회

  void updateDepart(DepartmentDto departmentDto);   // 부서 정보 수정
  void updateEmployee(EmployeeDto employeeDto);     // 직원 정보 수정
    
  void addDepartment(HttpServletRequest request, HttpServletResponse response); // 부서 추가
  
}