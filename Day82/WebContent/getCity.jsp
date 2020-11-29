<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sql:setDataSource dataSource="jdbc/mymariadb" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT ID, name, CountryCode, District, Population
	FROM city
	WHERE countryCode = ?
	<sql:param value="KOR"/>
</sql:query> 
<c:set var="last" value="${rs.rowCount + 1}"/>
<c:set var="count" value="${1}"/>
{
	"code":"success",
	"data":[
			<c:forEach items="${rs.rows}" var="rs">
				{
					"id":${rs.ID},
					"name":"${rs.name}",
					"countrycode":"${rs.countryCode}",
					"district":"${rs.district}",
					"population":${rs.population}
				}
				<c:set var="count" value="${count+1}"/>
				<c:if test="${count ne last}">,</c:if>
			</c:forEach>
			]
}