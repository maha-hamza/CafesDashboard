<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<div class="row panel panel-default ">
	<div class="col-lg-10">
		<form
			name="resForm"
			novalidate
		>
			<div class="main-box">
				<header class="main-box-header clearfix">
					<h4
						style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;"
					>{{subtitle}}</h4>
				</header>
				<div class="form-group">
					<div style="display: flex;">
						<c:if
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
						>
							<div
								class="form-group"
								style="width: 440px;"
							>
								<label for="text2">Branch</label>
								<div style="display: flex;">
									<select
										style="background-color: #eab123; color: white; border: white;"
										class="form-control"
										ng-model="activeReservation.branchId"
										ng-change="fetchUsersByID(activeReservation.branchId)"
										ng-required="true"
										name="bid"
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
											ng-hide="branch.isDeleted==1"
										>{{branch.branchCode }}</option>
									</select> <span
										style="color: red"
										ng-show="resForm.bid.$error.required"
										class="help-block"
									>*</span>
								</div>
							</div>
							<div
								class="form-group"
								style="width: 440px;"
								ng-hide="currentActiveOperation=='edit'"
							>
								<label for="text1">Guest</label>
								<div style="display: flex;">
									<select
										style="background-color: #eab123; color: white; border: white;"
										class="form-control"
										ng-model="activeReservation.userId"
										ng-required="true"
										name="guest"
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
									</select> <span class="glyphicons glyphicons-chevron-down"></span> <span
										style="color: red"
										ng-show="resForm.guest.$error.required"
										class="help-block"
									>*</span>
								</div>
							</div>
						</c:if>
						<c:if
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
						>
							<!-- ________________________________ -->
							<div
								class="form-group"
								style="width: 440px;"
							>
								<label for="text1">Guest</label>
								<div style="display: flex;">
									<select
										style="background-color: #eab123; color: white; border: white; margin-left: 12px;"
										class="form-control"
										ng-model="activeReservation.userId"
										ng-init="fetchUsersByID('${sessionScope.ACTIVE_LOGGED_USER.branch.id}')"
										ng-required="true"
										name="guest2"
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
									</select> <span class="glyphicons glyphicons-chevron-down"></span> <span
										style="color: red"
										ng-show="resForm.guest2.$error.required"
										class="help-block"
									>*</span>
								</div>
							</div>
							<!-- ________________________________ -->
						</c:if>
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
						<label
							
							for="text2"
						>Reservation Date</label>
						<div style="display: flex;">
							<input
								type="date"
								ng-required="true"
								class="form-control"
								name="resd"
								ng-model="activeReservation.reservationDate"
								md-placeholder="Enter Reservation date"
							> <span
								style="color: red"
								ng-show="resForm.resd.$error.required"
								class="help-block"
							>*</span>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group bootstrap-timepicker">
							<label
								style="margin-left: 12px;"
								for="text2"
							>Reservation Time</label>
							<div style="display: flex;">
								<input
									style="margin-top: 0px; width: 80%; margin-left: 12px; color: white; background-color: #1eb7e9; border-radius: 3px; border: white;"
									class="form-control timepicker-default"
									type="text"
									ng-model="activeReservation.reservationTime"
									ng-required="true"
									name="tim"
								/> <span
									style="color: red"
									ng-show="resForm.tim.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
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
						<label for="text2">Number Of Members</label>
						<div style="display: flex;">
							<input
								type="number"
								placeholder="numebr of guests"
								class="form-control"
								ng-model="activeReservation.numberOfMembers"
								ng-required="true"
								name="num"
							> <span
								style="color: red"
								ng-show="resForm.num.$error.required"
								class="help-block"
							>*</span>
						</div>
					</div>
					<div
						class="form-group"
						style="width: 440px;"
					>
						<label for="text2">Notes</label>
						<div style="display: flex;">
							<textarea
								rows="4"
								cols="10"
								id="text1"
								placeholder="Extra notes"
								class="form-control"
								ng-model="activeReservation.description"
								ng-required="true"
								name="notes"
							></textarea>
							<span
								style="color: red"
								ng-show="resForm.notes.$error.required"
								class="help-block"
							>*</span>
						</div>
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
		</form>
	</div>
</div>
<script>
    $('.timepicker-default').timepicker();
    $('.timepicker-default').on('click', function (){
        $('.timepicker-default').timepicker('setTime', new Date());
    });
</script>