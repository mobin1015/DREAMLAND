<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }" />

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />


    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
 		
 		<style>
 		.card {
        display: none;
        }
    .card.active {
        display: block;
        }
 		</style>
  </head>
  

<body>

		<label for="pageSelect">파트 선택</label>
			<select id="pageSelect" onchange="showPage(this.value)">
    		<option value="tickets">티켓</option>
    		<option value="Zootopia">주토피아</option>
    		<option value="MagicLand">매직랜드</option>
    		<option value="AmericanAdventure">아메리칸어드벤처</option>
    		<option value="GloverFair">글로버페어</option>
    		<option value="EuropeanAdventure">유로피언어드벤처</option>
			</select>
	

   
     <!-- Bootstrap Dark Table -->
     <div id="tickets" class="card">
			 <form method="POST" 
	    			 action="${contextPath}/sales/salesreg.do" 
	    			 id="frm-salesreg">    		
	    		
	       <div>
	        <button type="submit" id="regbtn" class="btn-reg">저장</button>
	        <input type="date" name="salesDate">
	       </div>
	       	<h5 class="card-header">티켓</h5>
	        <div class="table-responsive text-nowrap">
	        	<table class="table table-dark">
	          	<thead>
	            	<tr>
	              	<th>상품번호</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th>파트번호</th>
	              </tr>
	            </thead>
	            <tbody class="table-border-bottom-0">
	            	<c:forEach items="${product}" var="product">
	              	<tr>
	              	<c:if test="${product.department.deptNo == 5000}"> 
	                	<td><input type="hidden" name="productNo" value="${product.productNo}">${product.productSctCd}</td>
	                  <td><i class="fab fa-angular fa-lg text me-3"></i> <strong>${product.productNM}</strong>
	                  <td><input type="text" name="qty" value=1></td>
	                  <td><input type="hidden" name="deptNo" value="${product.department.deptNo}">${product.department.deptNo}</td>
	                </tr>
	               	</c:if>
	              </c:forEach>
	            </tbody>
	          </table>
	        </div>
	     </form>
	   </div>
  
   
     <!-- Bootstrap Dark Table -->
     <div id="Zootopia" class="card">
			 <form method="POST" 
	    			 action="${contextPath}/sales/salesreg.do" 
	    			 id="frm-salesreg">    		
	    		
	       <div>
	        <button type="submit" id="regbtn" class="btn-reg">저장</button>
	        <input type="date" name="salesDate">
	       </div>
	       	<h5 class="card-header">주토피아</h5>
	        <div class="table-responsive text-nowrap">
	        	<table class="table table-dark">
	          	<thead>
	            	<tr>
	              	<th>상품번호</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th>파트번호</th>
	              </tr>
	            </thead>
	            <tbody class="table-border-bottom-0">
	            	<c:forEach items="${product}" var="product">
	              	<tr>
	              	<c:if test="${product.department.deptNo ge 5120 && product.department.deptNo le 5130}"> 
	                	<td><input type="hidden" name="productNo" value="${product.productNo}">${product.productSctCd}</td>
	                  <td><i class="fab fa-angular fa-lg text me-3"></i> <strong>${product.productNM}</strong>
	                  <td><input type="text" name="qty" value=1></td>
	                  <td><input type="hidden" name="deptNo" value="${product.department.deptNo}">${product.department.deptNo}</td>
	                </tr>
	               	</c:if>
	              </c:forEach>
	            </tbody>
	          </table>
	        </div>
	     </form>
	   </div>
	   
     <!-- Bootstrap Dark Table -->
     <div id="MagicLand" class="card">
			 <form method="POST" 
	    			 action="${contextPath}/sales/salesreg.do" 
	    			 id="frm-salesreg">    		
	    		
	       <div>
	        <button type="submit" id="regbtn" class="btn-reg">저장</button>
	        <input type="date" name="salesDate">
	       </div>
	       	<h5 class="card-header">매직랜드</h5>
	        <div class="table-responsive text-nowrap">
	        	<table class="table table-dark">
	          	<thead>
	            	<tr>
	              	<th>상품번호</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th>파트번호</th>
	              </tr>
	            </thead>
	            <tbody class="table-border-bottom-0">
	            	<c:forEach items="${product}" var="product">
	              	<tr>
	              	<c:if test="${product.department.deptNo ge 5220 && product.department.deptNo le 5230}"> 
	                	<td><input type="hidden" name="productNo" value="${product.productNo}">${product.productSctCd}</td>
	                  <td><i class="fab fa-angular fa-lg text me-3"></i> <strong>${product.productNM}</strong>
	                  <td><input type="text" name="qty" value=1></td>
	                  <td><input type="hidden" name="deptNo" value="${product.department.deptNo}">${product.department.deptNo}</td>
	                </tr>
	               	</c:if>
	              </c:forEach>
	            </tbody>
	          </table>
	        </div>
	     </form>
	   </div>
	   
     <!-- Bootstrap Dark Table -->
     <div id="AmericanAdventure" class="card">
			 <form method="POST" 
	    			 action="${contextPath}/sales/salesreg.do" 
	    			 id="frm-salesreg">    		
	    		
	       <div>
	        <button type="submit" id="regbtn" class="btn-reg">저장</button>
	        <input type="date" name="salesDate">
	       </div>
	       	<h5 class="card-header">아메리칸어드벤처</h5>
	        <div class="table-responsive text-nowrap">
	        	<table class="table table-dark">
	          	<thead>
	            	<tr>
	              	<th>상품번호</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th>파트번호</th>
	              </tr>
	            </thead>
	            <tbody class="table-border-bottom-0">
	            	<c:forEach items="${product}" var="product">
	              	<tr>
	              	<c:if test="${product.department.deptNo ge 5320 && product.department.deptNo le 5330}"> 
	                	<td><input type="hidden" name="productNo" value="${product.productNo}">${product.productSctCd}</td>
	                  <td><i class="fab fa-angular fa-lg text me-3"></i> <strong>${product.productNM}</strong>
	                  <td><input type="text" name="qty" value=1></td>
	                  <td><input type="hidden" name="deptNo" value="${product.department.deptNo}">${product.department.deptNo}</td>
	                </tr>
	               	</c:if>
	              </c:forEach>
	            </tbody>
	          </table>
	        </div>
	     </form>
	   </div>
	   
     <!-- Bootstrap Dark Table -->
     <div id="GloverFair" class="card">
			 <form method="POST" 
	    			 action="${contextPath}/sales/salesreg.do" 
	    			 id="frm-salesreg">    		
	    		
	       <div>
	        <button type="submit" id="regbtn" class="btn-reg">저장</button>
	        <input type="date" name="salesDate">
	       </div>
	       	<h5 class="card-header">글로버페어</h5>
	        <div class="table-responsive text-nowrap">
	        	<table class="table table-dark">
	          	<thead>
	            	<tr>
	              	<th>상품번호</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th>파트번호</th>
	              </tr>
	            </thead>
	            <tbody class="table-border-bottom-0">
	            	<c:forEach items="${product}" var="product">
	              	<tr>
	              	<c:if test="${product.department.deptNo ge 5420 && product.department.deptNo le 5430}"> 
	                	<td><input type="hidden" name="productNo" value="${product.productNo}">${product.productSctCd}</td>
	                  <td><i class="fab fa-angular fa-lg text me-3"></i> <strong>${product.productNM}</strong>
	                  <td><input type="text" name="qty" value=1></td>
	                  <td><input type="hidden" name="deptNo" value="${product.department.deptNo}">${product.department.deptNo}</td>
	                </tr>
	               	</c:if>
	              </c:forEach>
	            </tbody>
	          </table>
	        </div>
	     </form>
	   </div>
	   
     <!-- Bootstrap Dark Table -->
     <div id="EuropeanAdventure" class="card">
			 <form method="POST" 
	    			 action="${contextPath}/sales/salesreg.do" 
	    			 id="frm-salesreg">    		
	    		
	       <div>
	        <button type="submit" id="regbtn" class="btn-reg">저장</button>
	        <input type="date" name="salesDate">
	       </div>
	       	<h5 class="card-header">유로피언어드벤처</h5>
	        <div class="table-responsive text-nowrap">
	        	<table class="table table-dark">
	          	<thead>
	            	<tr>
	              	<th>상품번호</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th>파트번호</th>
	              </tr>
	            </thead>
	            <tbody class="table-border-bottom-0">
	            	<c:forEach items="${product}" var="product">
	              	<tr>
	              	<c:if test="${product.department.deptNo ge 5520 && product.department.deptNo le 5530}"> 
	                	<td><input type="hidden" name="productNo" value="${product.productNo}">${product.productSctCd}</td>
	                  <td><i class="fab fa-angular fa-lg text me-3"></i> <strong>${product.productNM}</strong>
	                  <td><input type="text" name="qty" value=1></td>
	                  <td><input type="hidden" name="deptNo" value="${product.department.deptNo}">${product.department.deptNo}</td>
	                </tr>
	               	</c:if>
	              </c:forEach>
	            </tbody>
	          </table>
	        </div>
	     </form>
	   </div>
 
      
</body>

<script>
function showPage(pageId) {
    const pages = document.querySelectorAll('.card');
    pages.forEach(page => {
        page.classList.remove('active');
    });
    document.getElementById(pageId).classList.add('active');
}

// Initialize to show the first page
showPage('tickets');

</script>

</html>


	
	