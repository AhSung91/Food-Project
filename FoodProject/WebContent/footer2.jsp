<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
#footer {
   font-family: 'Nanum Gothic', sans-serif;
    position:absolute;
    bottom:0;
}

.footer {
   /* padding: 20px 0; */
   text-align: center;
   font-size: 20px;
    background-color: black;
    height: 100px;
   padding-top: 5px;
}

.footer a {
   text-decoration: none;
   color: #888484;
}

.footer li {
   position: relative;
   display: inline;
   padding: 0 7px 0 10px;
}

.footer ul>li>a:hover {
   color: #85A7A9;
}

.address {
   color: grey;
   font-family: 'Nanum Gothic', sans-serif;
   margin-bottom: auto;
   text-align: center;
  
}
</style>
</head>
<body>
      <div id="footer">
         <div class="footer">
            <ul>
               <li><a href="#">사이트 도움말</a></li>
               <li><a href="#">사이트 이용약관</a></li>
               <li><a href="#"><strong>개인정보 취급방침</strong></a></li>
               <li><a href="#">Contact to 주먹왕</a></li>
               <li><a href="#">Contact to 회식요정</a></li>
               <li><a href="#">Contact to 인천주민</a></li>
               <li><a href="#">Contact to 자바천재</a></li>
                <li class="address">Copyright&copy;www.naver.com All
         Right Reserved</li>
            </ul>
         </div>
      </div>
</body>
</html>