<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 화면</title>
</head>
<body>
	<form action="fileUpload.do" method="post" enctype="multipart/form-data">
		파일첨부 1 : <input type="file" name="file1" />
		<br />
		파일첨부 2 : <input type="file" name="file2" />
		<br />
		파일첨부 3 : <input type="file" name="file3" />
		<br />
		<input type="submit" value="upload" />
	</form>

</body>
</html>











