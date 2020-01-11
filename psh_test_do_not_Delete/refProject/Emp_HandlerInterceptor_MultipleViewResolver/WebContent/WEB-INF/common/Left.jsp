<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar" class="sidebar py-3">
	<div
		class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">TEAM_1</div>
	<ul class="sidebar-menu list-unstyled">
		<li class="sidebar-list-item"><a href="index.jsp"
			class="sidebar-link text-muted"> <i
				class="o-home-1 mr-3 text-gray"></i><span>Home</span>
		</a></li>

		<li class="sidebar-list-item"><c:choose>
				<c:when test="${sessionScope.id !=null}">
					<a href='empList.do' class='sidebar-link text-muted'> <i
						class='o-survey-1 mr-3 text-gray'></i><span>사원 조회</span></a>
					<a href='adminLogout.do' class='sidebar-link text-muted'> <i
						class='fas fa-sign-out-alt mr-3 text-gray'></i><span>Logout</span></a>
					<a href="EmpJopAvgSalCharPage.do" class="sidebar-link text-muted"> <i
						class="o-exit-1 mr-3 text-gray"></i><span>Chart</span></a>	
					<a href="empList.do" class="sidebar-link text-muted"> <i
						class="o-exit-1 mr-3 text-gray"></i><span>List</span></a>
						
				</c:when>
				<c:otherwise>
					<a href="emplist.do" class="sidebar-link text-muted"> <i
						class="o-exit-1 mr-3 text-gray"></i><span>Search</span></a>
					<a href="empAdd.do" class="sidebar-link text-muted"> <i
						class="o-exit-1 mr-3 text-gray"></i><span>Register</span></a>
					<a href="multiple.do" class="sidebar-link text-muted"> <i
						class="o-exit-1 mr-3 text-gray"></i><span>Multiple</span></a>
						
				</c:otherwise>
			</c:choose></li>



	</ul>

</div>