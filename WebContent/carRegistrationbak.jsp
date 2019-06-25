<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />
<c:if test="${sessionScope.studentSession == null}">
	<c:redirect url="index.jsp"/>
</c:if>
<c:if test="${studentSession.driver}">
	<c:redirect url="index.jsp"/>
</c:if>

<body>
  <jsp:include page="include/navbar.jsp" />
  
  <div class="container-fluid col-6">
    <h4 class="m-3">Car Registraion</h4>
    <form method="post" action="CarRegistrationServlet">
      <div class="form-group text-left row">
        <div class="col-6">
          <label for="PlateNumber">Plate Number</label>
					<input type="text" required class="form-control" id="PlateNumber" name="plateNumber" placeholder="Plate Number">
        </div>
        <div class="col-6">
          <label for="Seats">Seats</label>
					<input type="text" required class="form-control" id="Seats" name="seats" placeholder="Seats">
        </div>
      </div>
      <div class="form-group text-left row">
        <div class="col-6">
          <label for="Make">Make</label>
					<input type="text" required class="form-control" id="Make" name="make" placeholder="Make">
        </div>
        <div class="col-6">
          <label for="Model">Model</label>
					<input type="text" required class="form-control" id="Model" name="model" placeholder="Model">
        </div>
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-primary col-12">Register</button>
      </div>
    </form>
  </div>
  <script src="JavaScript/jquery.min.js"></script>
  <script src="JavaScript/bootstrap.bundle.min.js"></script>
  <script src="JavaScript/bootstrap.min.js"></script>
</body>

</html>
