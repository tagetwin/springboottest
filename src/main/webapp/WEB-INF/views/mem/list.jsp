<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트 페이지</title>
</head>

<body>
<img src="media/apple.jpg">
	<table border="1">
		<tr>
			<th>username</th>
			<th>email</th>
			<th>createDate</th>
			<th>edit</th>
		</tr>
		
		<c:forEach var="mem" items="${mems}" varStatus="status">
			<tr>
				<td>${mem.username}</td>
				<td>${mem.email}</td>
				<td>${mem.createDate}</td>
				<td><button onclick="mem_update('${mem.id}')">edit</button></td>
			</tr>
		</c:forEach>
		
	</table>
	<button onclick="mem_join()">Join</button>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		function mem_update(mem_id){
			location.href="/mem/"+mem_id;
		}

		function mem_join(){
			location.href="/mem/join"
		}
		
	</script>


</body>
</html>