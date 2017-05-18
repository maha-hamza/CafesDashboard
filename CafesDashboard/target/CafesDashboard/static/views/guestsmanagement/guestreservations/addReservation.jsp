<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<form
	name="resForm"
	novalidate
>
	<div class="row panel panel-default ">
		<div class="col-lg-10">
			<div class="main-box">
				<header class="main-box-header clearfix">
					<h4
						style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;"
					>{{subtitle}}</h4>
				</header>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<!-- ________________________________ -->
						<c:if
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
						>
							<div
								class="form-group"
								style="width: 440px; margin-left: 12px;"
							>
								<label for="text2">Branch</label> <select
									style="background-color: #eab123; color: white; border: white;"
									class="form-control"
									ng-model="activeReservation.branchId"
									ng-change="fetchUsersByID(activeReservation.branchId)"
									ng-required="true"
								>
									<option
										style="background-color: white; color: black;"
										disabled
										value=""
									>Please choose</option>
									<option
										style="background-color: white; color: black;"
										ng-repeat="branch in branches"
										ng-selected="branch.id == activeReservation.branchId"
										value="{{branch.id}}"
									>{{branch.branchCode }}</option>
								</select>
							</div>
							<!-- ________________________________ -->
							<div
								class="form-group"
								style="width: 440px;"
							>
								<label for="text1">Guest</label> <select
									style="background-color: #eab123; color: white; border: white;"
									class="form-control"
									ng-model="activeReservation.userId"
									ng-required="true"
								>
									<option
										disabled
										value=""
										style="background-color: white; color: black;"
									>Please choose</option>
									<option
										style="background-color: white; color: black;"
										ng-repeat="user in users"
										ng-selected="user.id == activeReservation.userId"
										value="{{user.id}}"
										ng-show="user.role.roleName=='GUEST'"
									>{{user.fName }} {{user.lName}}</option>
								</select> <span class="glyphicons glyphicons-chevron-down"></span>
							</div>
							<!-- ________________________________ -->
						</c:if>
						<c:if
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
						>
							<!-- ________________________________ -->
							<div
								class="form-group"
								style="width: 440px;"
							>
								<label for="text1">Guest</label> <select
									style="background-color: #eab123; color: white; border: white;"
									class="form-control"
									ng-model="activeReservation.userId"
									ng-init="fetchUsersByID('${sessionScope.ACTIVE_LOGGED_USER.branch.id}')"
									ng-required="true"
								>
									<option
										disabled
										value=""
										style="background-color: white; color: black;"
									>Please choose</option>
									<option
										style="background-color: white; color: black;"
										ng-repeat="user in users"
										ng-selected="user.id == activeReservation.userId"
										value="{{user.id}}"
										ng-show="user.role.roleName=='GUEST'"
									>{{user.fName }} {{user.lName}}</option>
								</select> <span class="glyphicons glyphicons-chevron-down"></span>
							</div>
							<!-- ________________________________ -->
						</c:if>
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px;"
						>
							<label for="text2">Reservation Date</label> <input
								style="background-color: #1eb7e9; color: white; border: white;"
								type="date"
								class="form-control"
								datetime="mm-dd-yyyy"
								ng-model="activeReservation.reservationDate"
								ng-required="true"
							>
						</div>
						<div class="input-group bootstrap-timepicker">
							<label
								style="margin-left: 12px;"
								for="text2"
							>Reservation Time</label> <br> <input
								style="margin-top: 0px; width: 166px; margin-left: 12px; color: white; background-color: #1eb7e9; border-radius: 3px; border: white;"
								class="form-control timepicker-default"
								type="text"
								ng-model="activeReservation.reservationTime"
								ng-required="true"
							/>
						</div>
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px;"
						>
							<label for="text2">Number Of Members</label> <input
								type="number"
								placeholder="numebr of guests"
								class="form-control"
								ng-model="activeReservation.numberOfMembers"
								ng-required="true"
							>
						</div>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Notes</label> <input
								type="text"
								id="text1"
								placeholder="Extra notes"
								class="form-control"
								ng-model="activeReservation.description"
								ng-required="true"
							>
						</div>
					</div>
					<div
						class="form-group"
						style="margin-right: -12px;"
					>
						<button
							style="margin-bottom: 20px;"
							ng-click="submitCreateUpdate(activeReservation,'${sessionScope.ACTIVE_LOGGED_USER.branch.id}','${sessionScope.ACTIVE_LOGGED_USER.role.roleName}')"
							class="btn btn-primary btn-sm"
							ng-disabled="resForm.$invalid"
						>{{buttonOperation}}</button>
						<button
							id="cancel-form"
							style="margin-bottom: 20px;"
							value="Cancel"
							ng-click="cancel()"
							class="btn btn-danger btn-sm"
						>Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script>
    $('.timepicker-default').timepicker();
</script>