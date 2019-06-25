<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />
<c:if test="${sessionScope.studentSession != null}">
	<c:redirect url="DashBoardServlet"/>
</c:if>

<body class="text-center pt-5 col-4">
  <h1 class="display-1 mt-5 mb-5">Sherpool</h1>
  <h1 class="display-4 mb-5">Car Pool</h1>
  <div class="container-fluid">
    <form method="post" action="StudentRegistrationServlet">
      <div class="form-group text-left row">
        <div class="col-6">
          <label for="studentID">Student ID</label>
					<input type="text" required class="form-control" id="studentID" name="studentID" placeholder="Student ID">
        </div>
        <div class="col-6">
          <label for="password">Password</label>
					<input type="password" required class="form-control" id="password" name="password" placeholder="Password">
        </div>
      </div>
      <div class="form-group text-left row">
        <div class="col-6">
          <label for="firstName">First Name</label>
					<input type="text" required class="form-control" id="firstName" name="fName" placeholder="First Name">
        </div>
        <div class="col-6">
          <label for="lastName">Last Name</label>
					<input type="text" required class="form-control" id="lastName" name="lName" placeholder="Last Name">
        </div>
      </div>
      <div class="form-group text-left row">
        <div class="col-6">
          <label for="email">Email</label>
					<input type="email" required class="form-control" id="email" name="email" placeholder="Email">
        </div>
        <div class="col-6">
          <label for="phone">Phone Number</label>
					<input type="text" required class="form-control" id="phone" name="phone" placeholder="Phone Number">
        </div>
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-primary col-12">Register</button>
      </div>
      <div class="form-group">
        <a class="btn-light bg-light" href="index.jsp">Click Here to Login</a>
      </div>
    </form>
  </div>
  <script src="JavaScript/jquery.min.js"></script>
  <script src="JavaScript/bootstrap.bundle.min.js"></script>
  <script src="JavaScript/bootstrap.min.js"></script>
</body>

</html>

