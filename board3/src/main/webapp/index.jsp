<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Index</title>
  <script>
    window.onload = function() {
      const introDiv = document.getElementById('intro');
      introDiv.addEventListener('click', function(event) {
        const target = event.target;
        if (target.tagName === 'A') {
          event.preventDefault(); // 기본 동작(링크 이동) 중단
          console.log('링크 클릭');
          window.location.href = target.href; // 링크 이동
        } else if (target === introDiv) {
          event.preventDefault(); // 기본 동작(링크 이동) 중단
          console.log('intro 클릭');
          const link = introDiv.querySelector('a');
          window.location.href = link.href; // 링크 이동
        }
      });
    }
  </script>
  <link rel="stylesheet" href="common.css">
</head>
<body>
  <div class="wrap">
    <div id="intro">
      <div id="list" class="intro_box"> <a href="list.jsp">글 게시판</a></div>
      <div id="rcp" class="intro_box"> <a href="rcp.jsp">가위바위보 게임</a></div>
      <div id="trpg" class="intro_box"> <a href="trpg.jsp">텍스트 게임</a></div>
    </div>
    <%-- 글리스트에 들어가서 글 읽기를 할 수 있고, 그 안에서 글삭제,수정을 함.  게시판 아래로는 다른 기능을 연동해서 넣자.--%>
  </div>
  
</body>
</html>