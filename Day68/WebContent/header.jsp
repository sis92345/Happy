<style>
    ul{
        list-style-type: none; 
        background-color: <%=backgroundColor%>; 
        /*display: inline; */
        padding: 20px; 
        border: 1px solid <%=foregroundColor%>;
    }
    li{
        display: inline;
        border: 1px solid <%=foregroundColor%>;
        border-radius: 2em;
    }
</style>
<ul>
    <li>Naver</li>
    <li>Google</li>
    <li>Daum Kakao</li>
    <li>Nate</li>
    <li><%=msg%></li>
</ul>
