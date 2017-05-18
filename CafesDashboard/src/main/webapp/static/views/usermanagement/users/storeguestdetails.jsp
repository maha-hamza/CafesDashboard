<%@ page isELIgnored="false"%>
<%@page import="com.websystique.springmvc.pojos.User"%>
<div
	class="inner"
	ng-init="fetchUserDetails()"
	ng-controller="UsersController"
>
	<div class="row">
		<br />
		<div class="col-lg-12">
			<h3>
				<a
					href="#/branch-guests"
					style="cursor: pointer;"
				>Guests</a> <span>/ Guest Details </span>
			</h3>
	<!--  		<div
				class="form-group"
				style="margin-right: 0px; float: right;"
				
			>
				<a
					class="btn btn-warning"
					ng-click="showChangePassword(userDetails)"
					ng-disabled="showpw"
					style="background-color: #eab123; border: #eab123;"
				>Change Password</a>
			</div>
			-->
			<br /> <br />
			<div
				ng-show="showpw"
				class="panel-body"
				style="background-color: #fff;"
			>
				<div>
					<jsp:include page="/static/views/usermanagement/users/changepw.jsp" />
				</div>
			</div>
			<!-- ------------notification------------ -->
			<div
				id="hideMe"
				class="alert alert-info alert-dismissable"
				ng-show="mymsg.length !=0"
			>
				<button
					type="button"
					class="close"
					data-dismiss="alert"
					aria-hidden="true"
				>×</button>
				{{mymsg}}
			</div>
			<!-- ------------------------------ -->
			<br />
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel widget light-widget">
					<div class="panel-heading no-title"></div>
					<form
						class="form-horizontal"
						action="#"
						role="form"
					>
						<div class="panel-body">
							<h2 class="mgbt-xs-20">
								Profile: <span class="font-semibold">{{userDetails.fName|capitalize}}
									{{userDetails.lName|capitalize}}</span>
							</h2>
							<br>
							<div class="row">
								<div class="col-sm-3 mgbt-xs-20">
									<div class="form-group">
										<div class="col-xs-12">
											<div class="form-img text-center mgbt-xs-15">
												<img
													gravatar-src="userDetails.email"
													gravatar-size="90"
												>
											</div>
											<br>
											<div>
												<table class="table table-striped table-hover">
													<tbody>
														<tr>
															<td style="width: 60%;">Status</td>
															<td><span>{{userDetails.status.status}}</span></td>
														</tr>
														<tr>
															<td>Role</td>
															<td>{{userDetails.role.roleName}}</td>
														</tr>
														<tr>
															<td>Member Since</td>
															<td>{{userDetails.createdAt|date:'MM/dd/yyyy
																@h:mma'}}</td>
														</tr>
														<tr>
															<td>Last Updated</td>
															<td>{{userDetails.updatedAt|date:'MM/dd/yyyy @
																h:mma'}}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-9">
									<h3 class="mgbt-xs-15">User Infos</h3>
									<div class="form-group">
										<label class="col-sm-3 control-label">Email</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.email}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Unique ID</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.uuid}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">User Situation</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">
													<span ng-show="userDetails.isDeleted==1"> This user
														is no more active the system,
														<div ng-show="userDetails.gender=='M'">He</div>
														<div ng-show="userDetails.gender=='F'">She</div> is
														deleted previously
													</span> <span ng-show="userDetails.isDeleted==0">This user
														is active System user</span>
												</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Telephones</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">
													<table>
														<tr ng-repeat="tel in userDetails.telephone">
															<td>{{tel.type}}:</td>
															<td>{{tel.number}}</td>
														</tr>
													</table>
												</div>
												<!-- col-xs-12 -->
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<hr>
									<h3 class="mgbt-xs-15">Profile Setting</h3>
									<div class="form-group">
										<label class="col-sm-3 control-label">First Name</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.fName}}</div>
												<!-- col-xs-9 -->
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Last Name</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.lName}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Gender</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">
													<div ng-show="userDetails.gender=='F'">Female</div>
													<div ng-show="userDetails.gender=='M'">Male</div>
												</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Birthday</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">
													{{userDetails.birthDate|date:'MM/dd/yyyy' }}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Country</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.country.country}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">City</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.city.city}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Address</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{userDetails.address}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<div>
										<hr />
										<h3 class="mgbt-xs-15">Orders</h3>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">display orders here</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
						</div>
						<!-- panel-body -->
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
