<%@ page isELIgnored="false"%>
<div
	class="inner"
	ng-init="fetchOrderDetails()"
>
	<div class="row">
		<br />
		<div class="col-lg-12">
			<h3>
				<a
					href="#/orders"
					style="cursor: pointer;"
				>Orders</a> <span>/ Order Details </span>
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
							<h2 class="mgbt-xs-20">Order Details:</h2>
							<br>
							<div class="row">
								<div class="col-sm-3 mgbt-xs-20">
									<div class="form-group">
										<div class="col-xs-12">
											<div class="form-img text-center mgbt-xs-15"></div>
											<br>
											<div>
												<table class="table table-striped table-hover">
													<tbody>
														<tr>
															<td>Created at</td>
															<td>{{orderDetails.order.createdAt|date:'MM/dd/yyyy
																@h:mma'}}</td>
														</tr>
														<tr>
															<td>Updated At</td>
															<td>{{orderDetails.order.updatedAt|date:'MM/dd/yyyy
																@h:mma'}}</td>
														</tr>
														<tr>
															<td>Branch</td>
															<td>{{orderDetails.order.branch.branchCode}}</td>
														</tr>
														<tr>
															<td>Total Order Price</td>
															<td>{{orderDetails.totalOrderPrice}}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-9">
									<h3 class="mgbt-xs-15">Guest Infos</h3>
									<div class="form-group">
										<label class="col-sm-3 control-label">Guest</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{orderDetails.order.user.fName}}
													{{orderDetails.order.user.lName}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Guest Email</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{orderDetails.order.user.email}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-3 control-label">Delivery address</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">
													<span> {{orderDetails.order.deliveryAddress}} </span>
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
														<tr ng-repeat="tel in orderDetails.order.user.telephone">
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
									<hr>
									<h3 class="mgbt-xs-15">Items</h3>
									<div class="form-group">
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9 table-responsive">
													<table class="table table-striped ">
														<thead>
															<tr>
																<th>Item</th>
																<th>Single Item Price</th>
																<th>Description</th>
																<th>Quantity</th>
																<th>Price</th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="u in orderDetails.menu">
																<td>{{u.itemName}}</td>
																<td>{{u.itemPrice}}</td>
																<td>{{u.itemDescription}}</td>
																<td>{{u.quantity}}</td>
																<td>{{u.itemPrice * u.quantity}}</td>
															</tr>
														</tbody>
													</table>
												</div>
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
