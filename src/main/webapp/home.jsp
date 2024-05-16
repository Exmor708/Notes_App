<%@page import="java.util.List"%>
<%@page import="dao.UserDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/bootstrap_css.jsp" %>
</head>
<body>
<% User sessionUser=(User)session.getAttribute("userObj");

if(sessionUser == null){
	response.sendRedirect("login.jsp");
}else{

%>


<%@ include file="components/home_navbar.jsp" %>
<h1 class="text-center"> Hey

<%= sessionUser.getName() %>

,welcome to notes app!</h1>
<% } %>
<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">User Details</p>
						<a href="add.jsp" class="text-decoration-none btn btn-primary">Add
							User</a>
						<table class="table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Age</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Action</th>
								</tr>
								<%
								UserDao dao=new UserDao();
								List<User> list=dao.fetchAllUser();
								
								for(User u : list){
									if(sessionUser.getId()==u.getId()){
										continue;
										
									}
								
								
								%>
								<tr>
								<td><%=u.getName() %></td>
								<td><%=u.getAge() %></td>
								<td><%=u.getEmail() %></td>
								<td><%=u.getMobile() %></td>
								<td>
								<a href="update.jsp?id=<%=u.getId()%>"
								class="btn btn-success text-decoration-none">update</a>
								<a href="delete.jsp?id=<%=u.getId()%>"
								class="btn btn-danger text-decoration-none">delete</a>
								</td>
								
								</tr>
								<% } %>
								
								

							</thead>
							<tbody>
						</table>

					</div>
				</div>


			</div>

		</div>


	</div>

</body>
</html>