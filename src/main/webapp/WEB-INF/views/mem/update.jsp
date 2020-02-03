<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 페이지</title>
</head>

<body>
	<table border="1">
		<tr>
			<th>id</th>
			<th>username</th>
			<th>password</th>
			<th>email</th>
			<th>createDate</th>
			<th>edit</th>
			<th>delete</th>
		</tr>

		<tr>
			<td><input id="id" type="text" value="${mem.id}" readonly="readonly" /></td>
			<td><input type="text" value="${mem.username}" readonly="readonly" /></td>
			<td><input id="password" type="password" /></td>
			<td><input id="email" type="email" value="${mem.email}" /></td>
			<td><input type="text" value="${mem.createDate}" readonly="readonly" /></td>
			<td><button id="mem_update_proc">edit</button></td>
			<td><button id="mem_delete_proc">delete</button></td>
		</tr>

	</table>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
	
		$('#mem_update_proc').on('click',function(){

			let data = {
					password : $('#password').val(),
					email : $('#email').val(),
					id : $('#id').val()
			}

			$.ajax({
				
				type : 'PUT',
				url : '/mem/api/update',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'text'					
				
			}).done(function(result){
				if(result === 'ok') {
					console.log(result);
					alert('회원정보수정 성공');
					location.href='/mem'					
				}else {
					console.log(result);
					alert('회원정보수정 실패');
				}
				
			}).fail(function(result){
				alert('서버오류');
			})
		});

		$('#mem_delete_proc').on('click',function(){

			let id = $('#id').val()

			$.ajax({
				
				type : 'DELETE',
				url : '/mem/api/delete/'+id,
				dataType : 'text'					
				
			}).done(function(result){
				if(result === 'ok') {
					console.log(result);
					alert('회원정보삭제 성공');
					location.href='/mem'					
				}else {
					console.log(result);
					alert('회원정보삭제 실패');
				}
				
			}).fail(function(result){
				alert('서버오류');
			})
		});
	
	</script>
</body>
</html>