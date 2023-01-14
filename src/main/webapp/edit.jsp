<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>

<%@include file="all_js_css.jsp"%>

</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>

		<div class="container">
			<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note) s.get(Note.class, noteId);
			%>
			
		<h2>Update your Notes...</h2>

		<br>

		<!-- this is add notes form -->
		<form action="UpdateServlet" method="post">
				<input value="<%= note.getId() %>" name="noteId" type="hidden"/>

				<div class="form-group">
				<label for="title">Note title</label> 
				<input 
				    required 
				    name="title"
					type="text" 
					class="form-control" 
					id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter here" 
					value="<%= note.getTitle() %>"/>
			</div>

			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				    required 
				    name="content" 
				    id="content" 
				    class="form-control"
					placeholder="Enter your content here"
					style="height: 300px"
					><%= note.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your Note</button>
			</div>
		</form>
		</div>
	</div>

</body>
</html>