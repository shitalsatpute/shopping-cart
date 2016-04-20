<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
          <%@ page import="java.util.ArrayList" %>  
  <%@ page import="com.beans.Product" %>     
        
 <c:import url="header.jsp"></c:import>       

<c:choose>
<c:when test="${list != null }">
<BR><BR>
<table width="100%">

<%
double price = 0;
ArrayList list = (ArrayList)session.getAttribute("list");

for(Object o :list){
	Product p = (Product)o;
	price = price + Double.parseDouble(p.getPrice());
	
	%>
	<tr>
	<td width="30%" height="100"><img src="<%=p.getImage() %>" width="70" height="40"></td>
	<td valign="top" width="35%"><b><%=p.getName() %></b></td>
	<td width="30%" align="center">Rs. <%=p.getPrice() %></td>
	<td ><a href="<%=request.getContextPath() %>/Controller?action=remove&id=<%=p.getId() %> ">remove</a></td>
	</tr>
	
	<% 
	
}
%>
<tr>
<td> </td>
<td><b>Total Amount:</b></td>
<td width="30%" align="center">  Rs. <%=price %></td>
<td></td>
</tr>
</table>
</c:when>
<c:otherwise>

Cart is Empty
</c:otherwise>
</c:choose>

<BR><BR><BR><BR><BR><BR><BR><BR><BR>
 <c:import url="footer.jsp"></c:import>    
