<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
</head>
<c:import url="/WEB-INF/common/Top.jsp" />
<div class="d-flex align-items-stretch">
	<c:import url="/WEB-INF/common/Left.jsp" />

	<div class="container-fluid px-xl-5">
		<section class="py-5">
			<div class="row" style="margin-top: 10%;">
				<div class="col-6 col-lg-4 mx-auto mb-5 mb-lg-0">
					<div class="pr-lg-5">
						<img src="img/login.gif" alt="" class="img-fluid">
					</div>
				</div>
				<div class="col-lg-6 px-lg-4" style="margin-right: 100px;">
					<h1 class="text-base text-primary text-uppercase mb-4">Login
						Page</h1>
					<h2 class="mb-4">Welcome to Doyeon's Page</h2>
					<p class="text-muted">^3^</p>
					<form id="loginForm" action="AdminLogin.do" class="mt-4"
						method="post" name="loginForm">
						<div class="form-group mb-4">
							<input type="text" id="id" name="id" placeholder="Login ID"
								class="form-control border-0 shadow form-control-lg">
						</div>
						<div class="form-group mb-4">
							<input type="password" id="pwd" name="pwd"
								placeholder="Login Password"
								class="form-control border-0 shadow form-control-lg text-violet">
						</div>
						<button type="submit" class="btn btn-primary shadow px-5">Login</button>
					</form>
				</div>
			</div>

		</section>

	</div>

</div>

<c:import url="/WEB-INF/common/Bottom.jsp" />