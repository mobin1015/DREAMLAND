# GDJ77 Final Project - 놀이공원 그룹웨어 프로젝트
---


#### 프로젝트 개요

이 프로젝트는 놀이공원에서 사용될 그룹웨어 설계 및 개발하는 것에 중점을 두었습니다.



<br/> 


#### 구성원
+ 박모빈 [https://github.com/mobin1015]
+ 이소이 [https://github.com/soyi9601]
+ 신동우 [https://github.com/ted4010]
+ 고은정 [https://github.com/2unjung94]
+ 강산들 [https://github.com/san-deul]
+ 민수지 [https://github.com/qqsuzy]



<br/> 


#### 사용기술

+ **개발환경**: STS 4

+ **프론트엔드**: HTML5, CSS, JS, jQuery, Bootstrap, JSTree

+ **API**: FullCalendar API, OpenWeatherMap API

+ **백엔드**: Java, Spring Boot Framework, Mybatis Framework

+ **데이터베이스**: Oracle SQL Developer

+ **서버**: Tomcat

+ **버전관리**: Git, GitHub

+ **협업**: Slack




<br/> 


#### 담당 업무 및 역할

+ **팀장**: 프로젝트 기본아키텍처 구성하여 GitHub에 배포 및 GitHub main 브런치 관리, 개발 일정관리

+ **담당 기능 구현**:
  
	그룹웨어의 전자결재 기능을 구현했습니다.
<br/> 

  + 네비게이션바
   ![네비게이션](https://github.com/user-attachments/assets/9147f1f3-3688-46bb-9d54-8576114e8a07)
  좌측의 네비게이션바를 통해 기안서작성, 결재문서, 내 문서, 참조 문서함 페이지로 이동할 수 있습니다.



<br/> 


  + 문서양식 변경
   ![셀렉트바](https://github.com/user-attachments/assets/ed1b95c4-c1bd-4f0d-8893-aea4d47cc7a9)
  셀렉트바를 이용해 휴가신청서와 지출품의서 중 원하는 양식을 선택할 수 있습니다.



<br/> 

 
  + 결재라인지정 및 결재라인직급제한
   ![사원 선택](https://github.com/user-attachments/assets/87eb6a88-da97-432c-98f1-a18e61cd3b75)
  JSTree를 이용하여 조직도를 열고 원하는 사원을 결재자로 지정할 수 있습니다.

<br/> 



    
   ![결재라인 위계](https://github.com/user-attachments/assets/49f75fd9-370c-49ce-862c-2af7f43672d9)
  이전 결재자보다 더 직급이 높은 사원만 지정할 수 있도록 자바스크립트로 제한을 걸었습니다.



<br/> 

 
  + 참조자 지정
  ![참조하기](https://github.com/user-attachments/assets/2224f9ac-fad2-4eea-b6e9-98c4e47b3d3a)
  참조자로 지정된 사원은 참조문서함에서 해당 문서의 진행 상태를 확인할 수 있습니다.


<br/> 



  + 임시저장 및 임시저장 불러오기
  ![임시저장 및 불러오기](https://github.com/user-attachments/assets/d90b0cd8-325c-48d9-96ad-24f359d8fee2)
  임시저장 후 임시저장함에서 저장했던 데이터 그대로 문서를 불러올 수 있습니다.




<br/> 
  + 승인하기
   ![결재하기](https://github.com/user-attachments/assets/1827edc8-be57-4f71-80b1-e1d6910308f6)
  승인한 문서는 처리대기 페이지에서 처리 완료페이지로 이동합니다.




<br/> 


  + 반려하기
   ![반려하기](https://github.com/user-attachments/assets/8d71a363-7c38-43d7-8b99-db49173b4645)
  번려 사유룰 작성하여 반려할 수 있습니다.




<br/> 


  + 철회하기
    ![철회하기](https://github.com/user-attachments/assets/48a4d3c7-1e7e-4fc9-92f4-94cd2550a01a)
  상신한 문서를 철회할 수 있고 철회한 문서는 임시저장함으로 이동합니다.


<br/> 


  + 반려자 및 반려 사유 확인
   ![반려자와 반려사유 확인](https://github.com/user-attachments/assets/ed129a68-8bed-41f5-b515-ac45c8a0697a)
  반려된 문서는 반려문서 페이지를 통해 반려자와 반려사유를 확인할 수 있습니다.


<br/> 

#### 제작 기간

2024년 5월 7일부터 2024년 6월 19일까지, 총 6주간 진행되었습니다.
