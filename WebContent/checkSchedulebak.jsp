<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="include/header.jsp" />
<c:if test="${sessionScope.studentSession == null}">
	<c:redirect url="index.jsp" />
</c:if>

<body>
	<jsp:include page="include/navbar.jsp" />
	<div class="container d-flex p-5">
		<div class="col col-12 order-2">
			<h3>
				From : ${checkSchedule.source} To: ${checkSchedule.destination }
				<c:if test="${studentSession.studentID != checkSchedule.studentID && fn:length(riders) < checkSchedule.seats}">
					<a class="btn btn-primary ml-5"
						href="ReserveSpot?scheduleNO=${checkSchedule.scheduleNO }">Reserve
						a Spot</a>
				</c:if>
				<c:if test="${studentSession.studentID == checkSchedule.studentID}">
					<a class="btn btn-primary ml-5"
						href="CancelSchedule?scheduleNO=${checkSchedule.scheduleNO }">Cancel
						Ride</a>
				</c:if>
				<c:if test="${fn:length(riders) >= checkSchedule.seats}">
					<span class="badge badge-danger">Full</span>
				</c:if>
			</h3>
			<h4>
			${checkSchedule.make}, ${checkSchedule.model } Seats : ${checkSchedule.seats}
			</h4>
			
			<h2>Rider List</h2>
			<table id="schedulesList"
				class="table table-sm table-striped table-borderless table-hover">
				<thead>
					<tr>
						<th style="width: 25%" scope="col">Name</th>
						<th scope="col">Number</th>
						<th scope="col">Email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${riders}" var="row">
						<tr>
							<th class="align-middle">${row.riderName}</th>
							<td class="align-middle">${row.phone }</td>
							<td class="align-middle">${row.email }</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col order-1" style="width: 200px;">
			<img src="Images/thumbnailD.svg" alt="default"
				class="img-thumbnail mb-3 rounded-circle"><br> <span
				class="font-weight-bold">${checkSchedule.driverName}</span><br>
			${checkSchedule.phone }<br> ${checkSchedule.email }
		</div>
	</div>
	<script src="JavaScript/jquery.min.js"></script>
	<script src="JavaScript/bootstrap.bundle.min.js"></script>
	<script src="JavaScript/bootstrap.min.js"></script>
</body>

</html>