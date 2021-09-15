<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<header class="bg-secondary text-light d-flex justify-content-between align-items-center">
		<h1 class="ml-3 pt-2">Memo</h1>
		<c:if test="${not empty UserName }">
			<div class="text-white mr-3">
				${userName }님 [로그아웃]
			</div>
		</c:if>
	</header>