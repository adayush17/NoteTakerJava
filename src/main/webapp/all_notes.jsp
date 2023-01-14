<%@page import="java.util.Collections"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>

<%@include file="all_js_css.jsp"%>

</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<br>

	<div class="container">
		<h4>All Notes are Here...</h4>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");

				List<Note> list = q.list();
				Collections.reverse(list);

				for (Note note : list) {
					/* out.println(note.getId() + " : " + note.getTitle() + "<br>"); */
				%>

				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width: 80px" src="img/sticky-notes.png" alt="">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger mr-2">Delete</a> 
							<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary ml-2">Update</a>
						</div>
					</div>
				</div>

				<%
				}

				s.close();
				%>

			</div>
		</div>
	</div>

</body>
</html>