<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<div class="row panel panel-default">
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
							>
							<!-- ______lname______ -->
							<input
								type="text"
								id="text1"
								placeholder="lastname"
								class="form-control"
								ng-model="activeUser.lName"
								style="margin-left: 12px;"
								ng-required="true"
							>
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
								style="width: 440px;"
							>
								<label for="text2">Role</label> <select
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
								</select> <span
									ng-show="userForm.role.$error.required"
									style="color: red"
								>*</span>
								<div
									ng-hide="(((activeUser.role==1) || (activeUser.role.id==1))) || activeUser.role ==null"
								>
									<label for="text2">Branch</label> <select
										style="background-color: #1eb7e9; color: white; border: white;"
										class="form-control"
										ng-model="activeUser.branch"
										name="country"
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
									</select>
								</div>
							</div>
						</c:if>
						<!-- _____________________ -->
						<div
							class="form-group"
							style="width: 440px; float: right; margin-left: 12px;"
						>
							<label for="text2">Email</label> <input
								style="width: 440px;"
								type="email"
								name="email"
								placeholder="email"
								class="form-control"
								ng-model="activeUser.email"
								ng-required="true"
							> <span
								ng-show="(userForm.email.$touched && userForm.email.$invalid) && userForm.$error.email"
								class="help-block"
							>You email is invalid.</span>
						</div>
					</div>
					<div
						class="form-group"
						style="display: flex;"
						ng-hide="currentActiveOperation=='edit'"
					>
						<div
							class="form-group"
							style="width: 440px;"
						>
							<label for="text2">Password</label> <input
								type="password"
								placeholder="password"
								class="form-control"
								ng-model="activeUser.password"
								ng-required="true"
							>
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
						<label for="text2">Status</label> <select
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
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">Gender</label> <select
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
				<div
					class="form-group"
					style="display: flex;"
				>
					<div
						class="form-group"
						style="width: 440px;"
					>
						<label for="text2">Birthdate</label> <input
							style="background-color: #1eb7e9; color: white; border: white;"
							type="date"
							class="form-control"
							ng-model="activeUser.birthDate"
							ng-required="true"
						>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">Address</label> <input
							type="text"
							placeholder="address"
							class="form-control"
							ng-model="activeUser.address"
							ng-required="true"
						>
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
						<label for="text2">Country</label> <select
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
							>{{country.country }}</option>
						</select> <span
							ng-show="userForm.country.$error.required"
							style="color: red"
						>*</span>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">City</label> <select
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
							>{{city.city }}</option>
						</select> <span
							ng-show="userForm.city.$error.required"
							style="color: red"
						>*</span>
					</div>
				</div>
				<!-- _____________________________________ -->
				<div class="form-group">
					<label for="text2">Phone</label>
					<!-- _______________________________________________________ -->
					<table>
						<tr ng-repeat="phone in formData.phones track by $index">
							<td><select
								style="width: 150px;"
								class="form-control"
								ng-model="phone.type"
								ng-required="true"
							>
									<option
										disabled
										value=""
									>Please choose</option>
									<option value="LandLine">LandLine</option>
									<option value="HotLine">HotLine</option>
									<option value="Mobile">Mobile</option>
							</select></td>
							<td><input
								style="width: 275px; margin-left: 12px;"
								type="text"
								ng-model="phone.number"
								class="form-control"
								ng-required="true"
							></td>
							<td><input
								style="width: 150px; margin-left: 15px;"
								type="button"
								id="add-ph"
								class="form-control"
								ng-click="addPhone($index,$index)"
								value="Add Phone"
								ng-show="$last"
							></td>
							<td><input
								style="width: 150px; margin-left: 12px;"
								type="button"
								ng-click="removePhone($index,$index)"
								value="Delete Phone"
								ng-show="$last"
								id="remove-ph"
								class="form-control"
							></td>
						</tr>
					</table>
					<!-- _______________________________________________________ -->
				</div>
				<div class="form-group">
					<button
						ng-click="submitCreateUpdateUSERORGUEST(activeUser)"
						class="btn btn-primary btn-sm"
						ng-disabled="userForm.$invalid"
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
