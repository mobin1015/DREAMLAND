package com.dreamland.prj.service;

import com.dreamland.prj.dto.EmployeeDto;

public interface IndexService {

  EmployeeDto loadUser(String email);
  
}