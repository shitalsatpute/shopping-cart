<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
    
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/shopdb" 
     user="root"  password=""/>
 <c:if test="${path != null }">
 <sql:update dataSource="${ds}" var="updatedTable">
UPDATE product set image =? where title = ?
<sql:param value="${path}" />
<sql:param value="${name}" />

</sql:update>
 
 </c:if> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Add Product</h1>
  <sql:query dataSource="${ds}" var="result">
SELECT * from category;
</sql:query>   
<h4><c:out value="${msg }"></c:out></h4>
<form method="post" action="<%=request.getContextPath() %>/Admin" >
<input type="hidden" name="action" value="add_product_form" /> 
Category: <select name="category">
<c:forEach var="row" items="${result.rows}">
<option value='<c:out value="${row.id}"/>'><c:out value="${row.name}"/></option>

</c:forEach>

</select>
<BR><BR> 
Name: <input type="text" name="name" />
<BR><BR>
Price: <input type="text" name="price" />
<BR><BR>
Brand: <input type="text" name="brand" />
<BR><BR>

Short description: <BR><textarea name="short_desc" cols="75" rows="6">Enter Short Description of Product Here</textarea>
<BR><BR>
Description: <BR><textarea name="desc" cols="100" rows="12">Enter Full Description of Product Here</textarea>
<BR><BR>
<input type="submit" name="submit" value="Add Product" />
</form>
</body>
</html>
