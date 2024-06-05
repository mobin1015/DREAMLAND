<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.employeeDto }" />
<jsp:include page="../layout/message-header.jsp" /> 

            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">쪽지함 /</span> 보낸쪽지함</h4>

              
              <div class="row">
	              <!-- Hoverable Table rows -->
	              <div class="card">
	                <h5 class="card-header">보낸쪽지함</h5>
	                <div id="send-count"></div>
	                <div class="table-responsive text-nowrap">
	                  <table class="table table-hover">
	                    <thead>
	                      <tr>
                          <th></th>
                          <th>번호</th>
                          <th>쪽지내용</th>
                          <th>받은시간</th>
                          <th>받는사람</th>
	                      </tr>
	                    </thead>
	                    <tbody class="table-border-bottom-0" id="send-list">
	                    </tbody>
	                    <tfoot id="send-page">
                      </tfoot>
	                  </table>
				            <div class="tab-content">
                     <nav aria-label="Page navigation">
                         <ul class="pagination justify-content-center">
                           <li class="page-item prev">
                             <a class="page-link" href="javascript:void(0);"
                               ><i class="tf-icon bx bx-chevrons-left"></i
                             ></a>
                           </li>
                           <li class="page-item">
                             <a class="page-link" href="javascript:void(0);">1</a>
                           </li>
                           <li class="page-item">
                             <a class="page-link" href="javascript:void(0);">2</a>
                           </li>
                           <li class="page-item active">
                             <a class="page-link" href="javascript:void(0);">3</a>
                           </li>
                           <li class="page-item">
                             <a class="page-link" href="javascript:void(0);">4</a>
                           </li>
                           <li class="page-item">
                             <a class="page-link" href="javascript:void(0);">5</a>
                           </li>
                           <li class="page-item next">
                             <a class="page-link" href="javascript:void(0);"
                               ><i class="tf-icon bx bx-chevrons-right"></i
                             ></a>
                           </li>
                         </ul>
                       </nav>
                       </div>
			                </div>
			              </div>
					              <!--/ Hoverable Table rows -->
                   </div>
                                           
                 </div>
               



            <!-- / Content -->
<script>var empNo = '${loginEmployee.empNo}';</script>
<script src="/resources/assets/js/pages-sendbox.js"></script>
<%@ include file="../layout/footer.jsp" %>
