<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.employeeDto }" />
<jsp:include page="../layout/header.jsp" /> 

            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">쪽지함 /</span> 중요보관함</h4>

              
              <div class="row">
	              <!-- Hoverable Table rows -->
	              <div class="card">
	                <h5 class="card-header">중요보관함 <small id="save-count"></small></h5>
	                <div class="card-body">
	                
	                  <form id="frm-save-box" method="POST">
                    <div>
                      <button type="button" class="btn btn-sm btn-danger" id="btn-delete">삭제</button>
                    </div>
                  <div class="table-responsive text-nowrap">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th style="width:5%;"><input class="form-check-input" type="checkbox" id="check-all"/></th>
                          <th style="width:23%;">보낸사람/받는사람</th>
                          <th style="width:55%;">쪽지내용</th>
                          <th style="width:17%;">받은시간</th>
                        </tr>
                      </thead>

                        <tbody class="table-border-bottom-0" id="receive-list">
                          <c:if test="${empty saveList}">
                            <tr>
                              <td colspan="5">보관함이 비었습니다</td>
                            </tr>
                          </c:if>
                          <c:if test="${not empty saveList}">
                            <c:forEach items="${saveList}" var="save" varStatus="vs">
                              <tr>
                                <td><input class="check-no form-check-input" type="checkbox" value="${save.msgNo}" id="check-no" name="checkYn"/>
                                    <input type="hidden" class="save-check" name="checkSendYn" value="${save.sendStarYn}">
                                </td>
                                  <c:choose>
                                      <c:when  test="${save.sendStarYn == 'Y' }">
			                                  <c:choose>
		                                      <c:when test="${save.readYn == 'Y'}">
	                                          <td style="color: lightgray;">${save.receiverName}[${save.receiverDeptName}-${save.receiverPosName}]</td>
	                                          <td style="color: lightgray;"><a style="color: lightgray;" href="${contextPath}/user/msgSendDetail?msgNo=${save.msgNo}">[보낸쪽지] ${save.msgContents}</a></td>
	                                          <td style="color: lightgray;">${save.msgCreateDt}</td>
		                                      </c:when>
		                                      <c:otherwise>
	                                          <td>${save.receiverName}[${save.receiverDeptName}-${save.receiverPosName}]</td>
	                                          <td><a href="${contextPath}/user/msgRecDetail?msgNo=${save.msgNo}">[보낸쪽지] ${save.msgContents}</a></td>
	                                          <td>${save.msgCreateDt}</td>
		                                      </c:otherwise>
			                                  </c:choose>
                                      </c:when>
		                                  <c:otherwise>
		                                    <c:choose>
                                          <c:when test="${save.readYn == 'Y'}">
                                              <td style="color: lightgray;">${save.senderName}[${save.senderDeptName}-${save.senderPosName}]</td>
                                              <td style="color: lightgray;"><a style="color: lightgray;" href="${contextPath}/user/msgRecDetail?msgNo=${save.msgNo}">[받은쪽지] ${save.msgContents}</a></td>
                                              <td style="color: lightgray;">${save.msgCreateDt}</td>
                                          </c:when>
                                          <c:otherwise>
                                              <td>${save.senderName}[${save.senderDeptName}-${save.senderPosName}]</td>
                                              <td><a href="${contextPath}/user/msgRecDetail?msgNo=${save.msgNo}">[받은쪽지] ${save.msgContents}</a></td>
                                              <td>${save.msgCreateDt}</td>
                                          </c:otherwise>
		                                    </c:choose>

		                                  </c:otherwise>
                                      
                                  </c:choose>
                              </tr>
                            </c:forEach>
                          </c:if>
                        </tbody>
                    </table>
                    <input class="form-emp-no" type="hidden" value="${loginEmployee.empNo}" id="empNo" name="empNo"/>  
                    </div>
                    </form>
                    <div class="pt-4">
                     <nav aria-label="Page navigation">
                         <ul class="pagination justify-content-center">${paging}</ul>
                       </nav>
                       </div>
                      </div>
                    </div>
                        <!--/ Hoverable Table rows -->
                   
                   </div>
                   </div>



            <!-- / Content -->
<script>var empNo = '${loginEmployee.empNo}';</script>
<script src="/resources/assets/js/pages-savebox.js"></script>
<%@ include file="../layout/footer.jsp" %>
