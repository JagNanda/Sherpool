<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />
<c:if test="${sessionScope.studentSession != null}">
	<c:redirect url="DashBoardServlet"/>
</c:if>

<body class="text-center pt-5 col-4">
  <h1 class="display-1 mt-5 mb-5">Sherpool</h1>
  <div class="container-fluid">
    <form method="post" action="LoginServlet">
      <div class="form-group text-left">
        <label for="studentID">Student ID</label>
        <input type="text" class="form-control" id="studentID" name="studentID" placeholder="Student ID">
      </div>
      <div class="form-group text-left">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-primary col-12">Login</button>
      </div>
      <div class="form-group">
        <a class="btn-light bg-light" href="registration.jsp">Click Here to Register</a>
      </div>
    </form>
  </div>
  <script src="JavaScript/jquery.min.js"></script>
  <script src="JavaScript/bootstrap.bundle.min.js"></script>
  <script src="JavaScript/bootstrap.min.js"></script>
</body>

</html>


