<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 150px"
></div>
<div
	class="row panel panel-default"
	ng-hide="showLoader"
>
	<div class="col-lg-10">
		<form
			name="userForm"
			novalidate
		>
			<div class="main-box">
				<header class="main-box-header clearfix">
					<h4
						style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;"
					>{{subtitle}}</h4>
				</header>
				<div class="main-box-body clearfix">
					<div class="form-group">
						<div style="display: flex;">
							<!-- _____fname________ -->
							<input
								type="text"
								id="text1"
								placeholder="firstname"
								class="form-control"
								ng-model="activeUser.fName"
								ng-required="true"
								name="fname"
							> &nbsp;<span
								style="color: red"
								ng-show="userForm.fname.$error.required"
								class="help-block"
								ng-class="{ 'has-error': userForm.fname.$invalid && userForm.fname.$dirty }"
							>*</span>
							<!-- ______lname______ -->
							<input
								type="text"
								id="text1"
								placeholder="lastname"
								class="form-control"
								ng-model="activeUser.lName"
								style="margin-left: 12px;"
								ng-required="true"
								name="lname"
							> &nbsp;<span
								style="color: red"
								ng-show="userForm.lname.$error.required"
								class="help-block"
								ng-class="{ 'has-error': userForm.lname.$invalid && userForm.lname.$dirty }"
							>*</span>
						</div>
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<!-- _______role_________ -->
						<c:if
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
						>
							<div
								class="form-group"
								style="width: 890px;"
							>
								<label for="text2">Role</label>
								<div style="display: flex;">
									<select
										style="background-color: #eab123; color: white; border: white;"
										class="form-control"
										ng-model="activeUser.role"
										name="role"
										ng-required="true"
									>
										<option
											style="background-color: white; color: black;"
											disabled
											value=""
										>Please choose</option>
										<option
											style="background-color: white; color: black;"
											ng-repeat="role in roles"
											ng-selected="role.id == activeUser.role.id"
											value="{{role.id}}"
											ng-hide="role.roleName=='GUEST'"
										>{{role.roleName }}</option>
									</select> &nbsp; <span
										ng-show="userForm.role.$error.required"
										style="color: red;"
										class="help-block"
									>*</span>
								</div>
							</div>
							<div class="form-group">
								<div
									ng-hide="(((activeUser.role==1) || (activeUser.role.id==1))) || activeUser.role ==null"
								>
									<label for="text2">Branch</label>
									<div style="display: flex">
										<select
											style="background-color: #1eb7e9; color: white; border: white; width: auto"
											class="form-control"
											ng-model="activeUser.branch"
											name="bra"
											ng-required="activeUser.role==2"
										>
											<option
												style="background-color: white; color: black;"
												disabled
												value=""
											>Please choose</option>
											<option
												style="background-color: white; color: black;"
												ng-repeat="branch in branches"
												ng-selected="branch.id == activeUser.branch.id"
												value="{{branch.id}}"
											>{{branch.branchCode }}</option>
										</select> <span
											ng-show="userForm.bra.$error.required"
											style="color: red;"
											class="help-block"
										>*</span>
									</div>
								</div>
							</div>
						</c:if>
						<!-- _____________________ -->
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px; float: right;"
						>
							<label for="text2">Email</label>
							<div style="display: flex;">
								<input
									type="email"
									name="email"
									placeholder="email"
									class="form-control"
									ng-model="activeUser.email"
									ng-required="true"
									ng-change="emailchecker(activeUser.email)"
								> <span
									ng-show="(userForm.email.$touched && userForm.email.$invalid) && userForm.$error.email"
									class="help-block"
									ng-class="{ 'has-error': userForm.email.$invalid && userForm.email.$dirty }"
								>Your email is invalid.</span> <span
									ng-show="showEmailTick && activeUser.email.length > 0"
									class="help-block"
									ng-class="{ 'has-error': userForm.email.$invalid && userForm.email.$dirty }"
									ng-bind-html="userEmailAreadyRegistered"
								></span> <span
									style="color: red"
									ng-show="userForm.email.$error.required "
									class="help-block"
									ng-class="{ 'has-error': userForm.lname.$invalid && userForm.lname.$dirty }"
								>*</span>
							</div>
						</div>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
							ng-hide="currentActiveOperation=='edit'"
						>
							<label for="text2">Password</label>
							<div style="display: flex;">
								<input
									type="password"
									placeholder="password"
									class="form-control"
									ng-model="activeUser.password"
									ng-required="true"
									name="password"
								> <span
									style="color: red"
									ng-show="userForm.password.$error.required"
									class="help-block"
									ng-class="{ 'has-error': userForm.password.$invalid && userForm.password.$dirty }"
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
						<label for="text2">Status</label>
						<div style="display: flex;">
							<select
								style="background-color: #eab123; color: white; border: white;"
								class="form-control"
								ng-model="activeUser.status"
								ng-required="true"
								name="status"
							>
								<option
									style="background-color: white; color: black;"
									disabled
									value=""
								>Please choose</option>
								<option
									style="background-color: white; color: black;"
									ng-repeat="status in statuses"
									ng-selected="status.id == activeUser.status.id"
									value="{{status.id}}"
								>{{status.status }}</option>
							</select> <span
								ng-show="userForm.status.$error.required"
								style="color: red"
							>*</span>
						</div>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">Gender</label>
						<div style="display: flex;">
							<select
								style="background-color: #eab123; color: white; border: white;"
								class="form-control"
								ng-model="activeUser.gender"
								ng-required="true"
								name="gender"
							>
								<option
									style="background-color: white; color: black;"
									disabled
									value=""
								>Please choose</option>
								<option
									value="F"
									style="background-color: white; color: black;"
								>Female</option>
								<option
									value="M"
									style="background-color: white; color: black;"
								>Male</option>
							</select> <span
								ng-show="userForm.gender.$error.required"
								style="color: red"
							>*</span>
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
						<label for="text2">Birthdate</label>
						<div style="display: flex;">
							<input
								type="date"
								ng-required="true"
								class="form-control"
								name="bd"
								ng-model="activeUser.birthDate"
								md-placeholder="Enter birthdate"
							> &nbsp;<span
								style="color: red"
								ng-show="userForm.bd.$error.required"
								class="help-block"
								ng-class="{ 'has-error': userForm.bd.$invalid && userForm.bd.$dirty }"
							>*</span>
						</div>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">Address</label>
						<div style="display: flex;">
							<input
								type="text"
								placeholder="address"
								class="form-control"
								ng-model="activeUser.address"
								ng-required="true"
								name="address"
							> &nbsp;<span
								style="color: red"
								ng-show="userForm.address.$error.required"
								class="help-block"
								ng-class="{ 'has-error': userForm.address.$invalid && userForm.address.$dirty }"
							>*</span>
						</div>
					</div>
				</div>
				<!-- ____________________________________ -->
				<div
					class="form-group"
					style="display: flex;"
				>
					<div
						class="form-group"
						style="width: 440px;"
					>
						<label for="text2">Country</label>
						<div style="display: flex;">
							<select
								style="background-color: #1eb7e9; color: white; border: white;"
								class="form-control"
								ng-model="activeUser.country"
								ng-change="loadStatesByCID(activeUser.country)"
								ng-required="true"
								name="country"
							>
								<option
									style="background-color: white; color: black;"
									disabled
									value=""
								>Please choose</option>
								<option
									style="background-color: white; color: black;"
									ng-repeat="country in allCountries"
									ng-selected="country.id == activeUser.country.id"
									value="{{country.id}}"
									ng-hide="country.isDeleted==1"
								>{{country.country }}</option>
							</select> <span
								ng-show="userForm.country.$error.required"
								style="color: red"
							>*</span>
						</div>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">City</label>
						<div style="display: flex;">
							<select
								style="background-color: #1eb7e9; color: white; border: white;"
								class="form-control"
								ng-model="activeUser.city"
								ng-required="true"
								name="city"
							>
								<option
									style="background-color: white; color: black;"
									disabled
									value=""
								>Please choose</option>
								<option
									style="background-color: white; color: black;"
									ng-repeat="city in statez"
									ng-selected="city.id == activeUser.city.id"
									value="{{city.id}}"
									ng-hide="city.isDeleted==1"
								>{{city.city }}</option>
							</select> <span
								ng-show="userForm.city.$error.required"
								style="color: red"
							>*</span>
						</div>
					</div>
				</div>
				<!-- _____________________________________ -->
				<div class="container">
					<label for="text2">Phone</label>
					<!-- _______________________________________________________ -->
					<table>
						<tr ng-repeat="phone in formData.phones track by $index">
							<td><select
								style="width: 100%"
								class="form-control"
								ng-model="phone.type"
								ng-required="true"
								name="type{{$index}}"
							>
									<option
										disabled
										value=""
									>Please choose</option>
									<option value="LandLine">LandLine</option>
									<option value="HotLine">HotLine</option>
									<option value="Mobile">Mobile</option>
							</select></td>
							<td><span
								style="color: red"
								ng-show="userForm.type{{$index}}.$error.required"
								class="help-block"
							>*</span></td>
							<td><input
								style="width: 100%; margin-left: 10px;"
								type="text"
								name="telp{{$index}}"
								ng-model="phone.number"
								class="form-control"
								ng-required="true"
								ng-change="telChecker(phone.number,$index)"
							></td>
							<td style="padding-left: 10px"><span
								style="color: red"
								ng-show="userForm.telp{{$index}}.$error.required"
								class="help-block"
							>*</span></td>
							<td>
								<button
									id="add-ph"
									ng-click="addPhone($index,$index)"
									ng-show="$last"
									class="form-control"
									style="width: 100%"
								>
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</td>
							<td>
								<button
									ng-show="$index!=0"
									ng-click="removePhone($index,$index)"
									id="remove-ph"
									class="form-control"
									style="width: 100%"
								>
									<span class="glyphicon glyphicon-minus"></span>
								</button>
							</td>
							<td><span
								ng-show="showTelTick && ($index==ind)"
								class="help-block"
							>Telephone Existed.</span></td>
						</tr>
					</table>
					<!-- _______________________________________________________ -->
				</div>
				<div class="form-group">
					<button
						ng-click="submitCreateUpdateUSERORGUEST(activeUser)"
						class="btn btn-primary btn-sm"
						ng-disabled="userForm.$invalid || showEmailTick || showTelTick"
					>{{buttonOperation}}</button>
					<button
						id="cancel-form"
						style="float: right; width: 120px;"
						value="Cancel"
						ng-click="cancel()"
						class="btn btn-danger btn-sm"
					>Cancel</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="/static/views/deletion/restore/delete.jsp"%>
<script>
    $(function () {
        $("#datepickeruser").datepicker({
            changeMonth : true,
            changeYear : true
        });
    });
</script>