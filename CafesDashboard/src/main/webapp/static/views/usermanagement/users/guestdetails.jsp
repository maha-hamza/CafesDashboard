<%@ page isELIgnored="false"%>
<%@page import="com.websystique.springmvc.pojos.User"%>
<div
	class="inner"
	ng-init="fetchUserDetails()"
>
	<div class="row">
		<br />
		<div class="col-lg-12">
			<h3>
				<a
					href="#/guests"
					style="cursor: pointer;"
				>Guests</a> <span>/ Guest Details </span>
			</h3>
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
									<!-- form-group -->
									<hr>
									<h3 class="mgbt-xs-15">Orders</h3>
									<div  ng-show="userDetails.orders.length == 0"> this guest didn't place any order yet</div>
									<div class="form-group" ng-show="userDetails.orders.length >0">
										<table class="table table-striped table-bordered table-hover">
											<thead style="color: white; background-color: #4f5f6f;">
												<tr>
													<th>Placed At</th>
													<th>Updated At</th>
													<th>Total Price</th>
													<th>Delivery Address</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="order in userDetails.orders">
													<td>{{order.createdAt |date:'MM/dd/yyyy @ h:mma'}}</td>
													<td>{{order.updatedAt |date:'MM/dd/yyyy @ h:mma'}}</td>
													<td>{{order.orderTotalPrice}}</td>
													<td>{{order.deliveryAddress}}</td>
													<td><span ng-show="order.isDeleted==1">Order
															Canceled</span><span ng-show="order.isDeleted==0">Order
															Delivered</span></td>
												</tr>
											</tbody>
										</table>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9"></div>
												<!-- col-xs-12 -->
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
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
