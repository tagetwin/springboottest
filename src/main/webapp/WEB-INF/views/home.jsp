<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Home에 오신것을 환영합니다.</h1>
	<a href="/home/hello?id=ssar">hello 페이지로 이동 - href</a>
	<br />
	<button id="hello-button">hello 페이지로 이동 - button</button>
	<br />
	<form>
		<input type="hidden" id="id" value="ssar_form">
	</form>
	<button id="hello-button-form">hello 페이지로 이동 - form</button>
	<br />
	<form>
		<input type="hidden" id="username" value="love" />
		<input type="hidden" id="phone" value="01000000001" />
	</form>
	<button id="hello-put-button-form">hello 페이지로 이동 - put form button</button>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		
		$('#hello-button').on('click', function(){
			let data = {
				id : 'ssar1'
			};

			$.ajax({
				type : 'DELETE',
				url:'/home/hello',
				data:JSON.stringify(data),
				contentType :'application/json; charset=utf-8',
				dataType:'json'
			}).done(function(result){
				if(result.statusCode == 200) {
					console.log('삭제성공');
					alert('글이 삭제되었습니다.');
					location.href='/home/hello';
				}
				
			}).fail(function(){
				alert('글 삭제가 실패하였습니다.');
				
			});
		});

		$('#hello-button-form').on('click', function(){
			let data = {
					id : $('#id').val()
				};

				$.ajax({
					type : 'POST',
					url:'/home/hello',
					data:JSON.stringify(data),
					contentType :'application/json; charset=utf-8',
					dataType:'json'
				}).done(function(result){
					if(result.statusCode == 200) {
						console.log('등록성공');
						alert('글이 등록되었습니다.');
						location.href='/home/hello';
					}
					
				}).fail(function(){
					alert('글 등록이 실패하였습니다.');
					
				});
			
		});

		$('#hello-put-button-form').on('click', function(){
			let data = {
					username : $('#username').val(),
					phone : $('#phone').val()
			};

				$.ajax({
					type : 'PUT',
					url:'/home/hello',
					data:JSON.stringify(data),
					contentType :'application/json; charset=utf-8',
					dataType:'json'
				}).done(function(result){
					if(result.statusCode == 200) {
						console.log('업데이트성공');
						alert('글이 수정되었습니다.');
						location.href='/home/hello';
					}
					
				}).fail(function(){
					alert('글 수정이 실패하였습니다.');
					
				});
			
		});
	</script>
</body>
</html>