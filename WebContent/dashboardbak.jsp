<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="include/header.jsp" />
<c:if test="${sessionScope.studentSession == null}">
	<c:redirect url="index.jsp" />
</c:if>

<body>
	<jsp:include page="include/navbar.jsp" />

	<!-- IF Check if Student's is a Driver -->



	<div class="container p-4">

		<c:if test="${currentSchedule.scheduleNO == 0}">
			<c:if test="${studentSession.driver}">
					<h2>Current Trip</h2>
				<c:if test="${param.showPickUpForm != 'show'}">
					<form action="#">
						<button type="submit" class="btn btn-outline-primary m-3"
							name="showPickUpForm" value="show">Add Pick up</button>
					</form>
				</c:if>
				${pickUpStatus}
				<!-- This is to show if ride was added to schedule after submission -->
				<c:if test="${param.showPickUpForm == 'show'}">
					<form action="AddPickUp" class="m-3" method="post" style="width: 200px;">
						<div class="form-group text-left">
							<label for="pickTime">Pick up time in Minutes</label> <input
								type="number" min="1" max="60" class="form-control"
								id="pickTime" name="minutes" placeholder="Pick up time" required>
						</div>
						<div class="form-group text-left">
							<label for="pickTime"> Leaving from: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">Campus</label>
								</div>
								<select class="custom-select" id="inputGroupSelect01"
									name="campusSource">
									<option value="HMC">HMC</option>
									<option value="Davis">Davis</option>
									<option value="Trafalgar">Trafalgar</option>
								</select>
							</div>
						</div>
						<div class="form-group text-left">
							<label for="pickTime"> Headed to: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">Campus</label>
								</div>
								<select class="custom-select" id="inputGroupSelect01"
									name="campusDestination">
									<option value="HMC">HMC</option>
									<option value="Davis">Davis</option>
									<option value="Trafalgar">Trafalgar</option>
								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-outline-primary"
							name="action" value="Add Trip">Add Pick Up</button>
					</form>
				</c:if>
			</c:if>
		</c:if>
		<c:if test="${currentSchedule.scheduleNO != 0}">
					<h2>Current Trip</h2>
			<c:choose>
				<c:when test="${studentSession.driver}">
					<c:if test="${currentSchedule.scheduleNO != 0}">
						<table id="schedulesList"
							class="table table-sm table-striped table-borderless table-hover text-nowrap">
							<thead>
								<tr>
									<th style="width: 25%" scope="col">Driver</th>
									<th scope="col">Place</th>
									<th scope="col">Destination</th>
									<th style="width: 30%" scope="col">Expiry Date</th>
									<th style="width: 5%" scope="col">Seats</th>
									<th style="width: 10%" scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="align-middle">${currentSchedule.driverName}</th>
									<td class="align-middle" class="align-middle">${currentSchedule.source }</td>
									<td class="align-middle">${currentSchedule.destination }</td>
									<c:set value="${currentSchedule.expiryDate }" var="dateString" />
									<fmt:parseDate value="${dateString}" var="dateObject"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<td class="align-middle"><fmt:formatDate
											value="${dateObject }" pattern="EEEE, MMM d, yyyy '@' h:m a" /></td>
									<td class="text-center align-middle">${currentSchedule.seats }</td>
									<td class="text-center align-middle"><a
										class="btn btn-primary"
										href="CheckSchedule?scheduleNO=${currentSchedule.scheduleNO }">Check</a></td>
								</tr>
							</tbody>
						</table>
					</c:if>
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${currentSchedule.scheduleNO == 0}">
			<h2>Available Schedules</h2>
			<table id="schedulesList"
				class="table table-sm table-striped table-borderless table-hover">
				<thead>
					<tr>
						<th style="width: 25%" scope="col">Driver</th>
						<th scope="col">Place</th>
						<th scope="col">Destination</th>
						<th style="width: 30%" scope="col">Expiry Date</th>
						<th style="width: 5%" scope="col">Seats</th>
						<th style="width: 10%" scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${schedules}" var="row">
						<c:if test="${currentSchedule.scheduleNO != row.scheduleNO }">
							<tr>
								<th class="align-middle">${row.driverName}</th>
								<td class="align-middle">${row.source }</td>
								<td class="align-middle">${row.destination }</td>
								<c:set value="${row.expiryDate }" var="dateString" />
								<fmt:parseDate value="${dateString}" var="dateObject"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<td class="align-middle"><fmt:formatDate
										value="${dateObject }" pattern="EEEE, MMM d, yyyy '@' h:m a" /></td>
								<td class="text-center align-middle">${row.seats }</td>
								<td class="text-center align-middle"><a
									class="btn btn-primary"
									href="CheckSchedule?scheduleNO=${row.scheduleNO }">Check</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>

	<script src="JavaScript/jquery.min.js"></script>
	<script src="JavaScript/bootstrap.bundle.min.js"></script>
	<script src="JavaScript/bootstrap.min.js">
		
	</script>
</body>

</html>
