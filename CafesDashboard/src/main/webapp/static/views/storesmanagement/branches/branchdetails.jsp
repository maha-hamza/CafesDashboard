<%@page import="com.websystique.springmvc.pojos.User"%>
<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<div
	class="inner"
	ng-init="getBranchDetails()"
>
	<div
		ng-show="uploadStarted"
		class="box panel widget light-widget"
	>
		<jsp:include
			page="/static/views/storesmanagement/branches/uploadimg.jsp"
		/>
	</div>
	<div class="row" style="font-size: 2vmin !important; text-align: left; word-wrap: break-word;">
		<br />
		<div class="col-lg-12">
			<div>
				<h4>
					<span style="float: left; margin-bottom: 10px;"> <span
						ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
					> <a href="#/branches">Branches</a> >
					</span> {{branchDetails.branchCode}}
					</span>
				</h4>
			</div>
			<a
				class="btn btn-warning"
				ng-click="activeBran = null;showBranchUpload(branchDetails)"
				ng-disabled='uploadStarted'
				style="float: right;"
			><i
				class="glyphicon glyphicon-upload"
				style="margin-right: 10px;"
			></i>Upload Image</a>
		</div>
	</div>
	<div class="row" style="font-size: 2vmin !important; text-align: left; word-wrap: break-word;">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel widget light-widget">
					<div class="panel-heading no-title"></div>
					<div class="panel-body">
						<br>
						<div class="row">
							<div class="col-sm-3 mgbt-xs-20">
								<div class="form-group">
									<div class="col-xs-12">
										<div class="form-img text-center mgbt-xs-15">
											<img
												class="img-responsive"
												ng-src="{{branchDetails.logo}}"
												alt="It's a grind"
											/>
										</div>
										<br>
										<div class="table-responsive">
											<table class="table table-striped table-hover">
												<tbody>
													<tr>
														<td style="width: 60%;">Store name</td>
														<td><span> It's A grind </span></td>
													</tr>
													<tr>
														<td>Unique identifier</td>
														<td>{{branchDetails.uuid}}</td>
													</tr>
													<tr>
														<td>Added at</td>
														<td>{{branchDetails.createdAt|date:'MM/dd/yyyy
															@h:mma'}}</td>
													</tr>
													<tr>
														<td>Last Updated</td>
														<td>{{branchDetails.updatedAt|date:'MM/dd/yyyy
															@h:mma'}}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-9">
								<h3 class="mgbt-xs-15">Description</h3>
								<div
									class="form-group"
									style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
								>{{branchDetails.description}}</div>
							</div>
							<div class="col-sm-9">
								<hr />
								<h3 class="mgbt-xs-15">Location</h3>
								<div
									class="form-group"
									style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
								>
									<div class="form-group">
										<label class="col-sm-3 control-label">Country</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{branchDetails.country.country}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
								</div>
								<div
									class="form-group"
									style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
								>
									<div class="form-group">
										<label class="col-sm-3 control-label">City</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{branchDetails.city.city}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
								</div>
								<div
									class="form-group"
									style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
								>
									<div class="form-group">
										<label class="col-sm-3 control-label">Latitude</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{branchDetails.latitude}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
								</div>
								<div
									class="form-group"
									style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
								>
									<div class="form-group">
										<label class="col-sm-3 control-label">Langitude</label>
										<div class="col-sm-9 controls">
											<div class="row mgbt-xs-0">
												<div class="col-xs-9">{{branchDetails.langitude}}</div>
											</div>
											<!-- row -->
										</div>
										<!-- col-sm-10 -->
									</div>
								</div>
								<div class="col-sm-9">
									<hr />
									<h3 class="mgbt-xs-15">Times</h3>
									<div
										class="form-group"
										style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
									>
										<div class="form-group">
											<label class="col-sm-3 control-label">Open</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">{{branchDetails.open}}</div>
												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
									</div>
									<div
										class="form-group"
										style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
									>
										<div class="form-group">
											<label class="col-sm-3 control-label">Close</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">{{branchDetails.close}}</div>
												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
									</div>
								</div>
								<div class="col-sm-9">
									<hr />
									<h3 class="mgbt-xs-15">Contact Details</h3>
									<div
										class="form-group"
										style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
									>
										<div class="form-group" style="font-size: 2vmin !important; text-align: left; word-wrap: break-word;">
											<label class="col-sm-3 control-label">Address</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9" style="font-size: 2vmin !important; text-align: left; word-wrap: break-word;">{{branchDetails.address}}</div>
												</div>
												<!-- row -->
											</div>
											<!-- col-sm-10 -->
										</div>
									</div>
									<div
										class="form-group"
										style="word-wrap: break-word; padding: 5px; width: 600px; margin: 1.00em 0;"
									>
										<div class="form-group" style="font-size: 2vmin !important; text-align: left; word-wrap: break-word;">
											<label class="col-sm-3 control-label">Telephones</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">
														<table style="font-size: 2vmin !important; text-align: left; word-wrap: break-word;">
															<tr ng-repeat="tel in branchDetails.telephone">
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
									</div>
								</div>
								<div
									class="col-sm-9"
									ng-show="branchDetails.images.length>0"
								>
									<hr />
									<h3 class="mgbt-xs-15">Related Photos</h3>
									<div class="panel panel-success">
										<!-- ___________________________ -->
										<div class="panel-body">
											<p style="text-align: center">
												<a
													ng-repeat="img in branchDetails.images"
													id="example1"
													data-toggle="modal"
													data-target="#mod"
													ng-click="initimg(img)"
												><img
													class="img-circle"
													ng-src="{{img}}"
													alt="branch"
													width="120"
													height="100"
												></a>
											</p>
										</div>
									</div>
									<!-- ___________________________ -->
								</div>
							</div>
						</div>
					</div>
					<!-- row -->
				</div>
				<!-- panel-body -->
			</div>
		</div>
	</div>
</div>
<div
	class="modal fade"
	id="mod"
	tabindex="-1"
	role="dialog"
>
	<div class="modal-dialog">
		<div style="background: none !important">
			<div
				class="modal-body"
				data-dismiss="modal"
			>
				<img
					class="img-thumbnail"
					ng-src="{{iimg}}"
					alt="branch"
				>
			</div>
		</div>
	</div>
</div>