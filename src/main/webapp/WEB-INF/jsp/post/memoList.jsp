<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		<section class="d-flex justify-content-center">
			<div class="w-75 my-4">
				<h1 class="text-center">메모 리스트</h1>
				<table class="table text-center">
					<thead>
						<c:forEach var="memo" items="${memoList }" varStatus="status">
						<tr>
							<td>${memo.id }</td>
							<td><a href="/post/detail_view?id=${memo.id }"> ${memo.subject } </a></td>
							<td><fmt:formatDate value="${memo.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						</c:forEach>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<div class="d-flex justify-content-between">
					
					<div>
						<c:if test="${prevId ne 0 }">
							<a href="/post/memoList_view?prevId=${prevId }">&lt;이전</a>
						</c:if>
					</div>
					
					
					
					<div class="text-right">
						<c:if test="${nextId ne 0}">
							<a href="/post/memoList_view?nextId=${nextId }">다음> </a>
						</c:if>
					</div>
					
				</div>
				<div class="text-right">
					<a class="btn btn-info" href="/post/create_view">글쓰기</a>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>