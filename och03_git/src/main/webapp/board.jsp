<!-- 디렉티브, 지시자라 부른다-->
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 스크립트릿 태그  Java 코드를 직접 삽입하는데
		// 페이지의 동적인 부분을 작성할 때 이 태그를 활용
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		// Current Date
		Date date = new Date();
		// 파일 저장
		long fileName = date.getTime();
		// getRealePath --> Tomcat Metadata File 저장
		// RealPath = 현재 웹 애플리케이션의 실제 경로를 얻기 위해 사용
		// 				 = 배포할 곳의 위치를 지정
		String real = application.getRealPath("/WEB-INF/out/"+fileName+".txt");
		System.out.println(real);
		
		// File 저장할수 있는 객체
		FileWriter fw = new FileWriter(real);
		// File 내용
		// \r\n = \r\n은 각 줄의 끝을 나타낸다
		//       = 줄바꿈
		String msg = "제목 : " + title + "\r\n";
		msg += "작성자 : " + writer + "\r\n";
		msg += "내용 : " + content + "\r\n";
		fw.write(msg);
		fw.close();
		
		// 화면 출력 1
		out.println("제목1 : " + title + "<p>");
		out.println("작성자1 : " + writer + "<p>");
		out.println("작성일1 : " + date + "<p>");
		out.println("내용1 : " + content + "<p>");
	%>
	
	<!-- 화면출력 2  -->
	제목2 : <%=title %> <p>
	작성자2 : <%=writer %> <p>
	내용2 : <%=content %> <p>
	
</body>
</html>