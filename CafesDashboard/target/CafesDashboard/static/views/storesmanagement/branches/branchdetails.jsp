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
	<div class="row">
		<br />
		<div class="col-lg-12">
			<div>
				<h3>
					<span style="float: left; margin-bottom: 10px;"> <a
						href="#/branches"
					>Branches </a>/ {{branchDetails.branchCode}}
					</span>
				</h3>
			</div>
		</div>
	</div>
	<div class="row">
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
												ng-src="{{branchDetails.logo}}"
												alt="It's a grind"
											/>
										</div>
										<br>
										<div>
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
										<div class="form-group">
											<label class="col-sm-3 control-label">Address</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">{{branchDetails.address}}</div>
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
											<label class="col-sm-3 control-label">Telephones</label>
											<div class="col-sm-9 controls">
												<div class="row mgbt-xs-0">
													<div class="col-xs-9">
														<table>
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
								<div class="col-sm-9">
									<hr />
									<h3 class="mgbt-xs-15">Related Photos</h3>
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
</div>
