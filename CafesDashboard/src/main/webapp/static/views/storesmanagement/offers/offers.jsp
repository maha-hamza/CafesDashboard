<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<style>
.sort-icon {
	font-size: 9px;
	margin-left: 5px;
}

th {
	cursor: pointer;
}
</style>
<c:choose>
	<c:when
		test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
	>
		<div class="row">
			<div class="col-lg-12">
				<h2>{{title}}</h2>
			</div>
		</div>
		<div class="panel panel-default"></div>
		<div class="panel-body">
			<div class="table-responsive">
				<div ng-show="showOffer">
					<jsp:include
						page="/static/views/storesmanagement/offers/addOffer.jsp"
					/>
				</div>
				<div ng-show="showImg">
					<jsp:include
						page="/static/views/storesmanagement/offers/changeImg.jsp"
					/>
				</div>
				<!-- ------------notification------------ -->
				<div
					id="hideMeNow"
					class="alert alert-info alert-dismissable"
					ng-show="errorMessage.length !=0"
				>
					<button
						type="button"
						class="close"
						data-dismiss="alert"
						aria-hidden="true"
					>×</button>
					{{errorMessage}}
				</div>
				<!-- ------------------------------ -->
				<form class="form-inline">
					<div class="form-group">
						<input
							type="text"
							ng-model="search"
							class="form-control"
							placeholder="Search"
						> <span
							style="margin-right: 4px; margin-top: -26px; color: #1eb7e9; float: right;"
						> <i
							class="glyphicon glyphicon-search"
							style="margin-right: 10px; margin-top: -26px; color: #1eb7e9;"
						> </i></span>
					</div>
					<!-- ___________________________ -->
					<div
						class="form-group"
						style="width: 440px;"
					>
						<select
							style="background-color: #730419; color: white; border: white; width: 150px !important"
							ng-init="fetchAllOfferType()"
							class="form-control"
							ng-model="value"
						>
							<option
								style="background-color: white; color: black;"
								disabled
								value=""
							>Please choose</option>
							<option
								style="background-color: white; color: black;"
								ng-repeat="type in otypes"
								value="{{type.type}}"
								ng-selected="type.type == value"
							>{{type.type }}</option>
						</select>
					</div>
					<!-- ___________________________ -->
					<div
						class="form-group"
						style="vertical-align: middle; margin-right: 0px; display: inherit; float: right;"
					>
						<a
							id="add-add"
							style="background-color: #eab123; border: #eab123;"
							class="btn btn-warning"
							ng-click="addOrEdit('add',null)"
							ng-disabled='showOffer'
							style="background-color:#eab123;border:#eab123;"
						><i
							class="glyphicon glyphicon-plus"
							style="margin-right: 10px;"
						></i>Add Offers/Events</a>
					</div>
				</form>
				<div class="form-group table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead style="color: white; background-color: #4f5f6f;">
							<tr>
								<th></th>
								<th>&nbsp;Title</th>
								<th>&nbsp;Description</th>
								<th ng-click="sort('from')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;from</th>
								<th ng-click="sort('to')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;to</th>
								<th ng-click="sort('createdAt')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;Creation Date</th>
								<th ng-click="sort('updatedAt')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;Last Updated</th>
								<th>Branchs</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr ng-show="offers.length==0">
								<td colspan="10"><center>No records to display</center></td>
							</tr>
							<tr
								dir-paginate="u in offers|filter:search|itemsPerPage:50"
								ng-show="((u.offerType.type=='offer') && (value=='offer' || value==null)) &&(u.isDeleted==0)"
							>
								<td style="overflow: hidden; white-space: nowrap;"><a
									style="cursor: pointer;"
									ng-click="changeimgoffer(u)"
								> <span class="glyphicon glyphicon-upload"></span> <img
										src="{{u.imgLogo}}"
										width="100"
									/></a></td>
								<td>{{u.title}}</td>
								<td>{{u.description}}</td>
								<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>
									<ul style="list-style-type: none;">
										<li ng-repeat="branch in u.branches" ng-hide="branch.isDeleted==1"><a
											ng-click="showRemovalWarning(branch.id,u.id)"
											data-toggle="modal"
											data-target="#confirmBORemoval"											
										> <span class="glyphicon glyphicon-trash" ></span>
										</a> {{branch.branchCode}}</li>
										<li><a
											data-toggle="modal"
											data-target="#addBranchToOffer"
											ng-click="initBranchAdder(u)"
										>Assign Branches To Offer</a></li>
									</ul>
								</td>
								<td class="center"><a
									class="btn btn-warning"
									ng-click="addOrEdit('edit', u)"
									ng-disabled='showOffer'
								><i class="glyphicon glyphicon-edit"></i></a> <a
									class="btn btn-danger"
									data-toggle="modal"
									data-target="#DeleteOffer"
									ng-disabled='showOffer'
									ng-hide="u.isDeleted==1"
									ng-click="showDelete(u)"
								><i class="glyphicon glyphicon-trash"></i></a></td>
							</tr>
							<tr
								dir-paginate="u in offers|filter:search|itemsPerPage:50"
								ng-show="(u.offerType.type=='event' && (value=='event')) && (u.isDeleted==0)"
							>
								<td style="overflow: hidden; white-space: nowrap;"><a
									style="cursor: pointer;"
									ng-click="changeimgoffer(u)"
								><span class="glyphicon glyphicon-upload"></span> <img
										src="{{u.imgLogo}}"
										width="100"
									/></a></td>
								<td>{{u.title}}</td>
								<td>{{u.description}}</td>
								<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>
									<ul style="list-style-type: none;">
										<li
											ng-repeat="branch in u.branches"
											ng-hide="branch.isDeleted==1"
										><a
											ng-click="showRemovalWarning(branch.id,u.id)"
											data-toggle="modal"
											data-target="#confirmBORemoval"
										> <span class="glyphicon glyphicon-trash"></span>
										</a> {{branch.branchCode}}</li>
										<li><a
											data-toggle="modal"
											data-target="#addBranchToOffer"
											ng-click="initBranchAdder(u)"
										> Assign Branches To Event</a></li>
									</ul>
								</td>
								<td class="center"><a
									class="btn btn-warning"
									ng-click="addOrEdit('edit', u)"
									ng-disabled='showOffer'
								><i class="glyphicon glyphicon-edit"></i></a> <a
									class="btn btn-danger"
									data-toggle="modal"
									data-target="#DeleteOffer"
									ng-disabled='showOffer'
									ng-hide="u.isDeleted==1"
									ng-click="showDelete(u)"
								><i class="glyphicon glyphicon-trash"></i></a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<dir-pagination-controls
					max-size="50"
					direction-links="true"
					boundary-links="true"
				> </dir-pagination-controls>
			</div>
		</div>
		<div>
			<jsp:include page="/static/views/storesmanagement/offers/delete.jsp"></jsp:include>
		</div>
		<!-- ______________________________ -->
		<div
			class="modal fade"
			id="addBranchToOffer"
			tabindex="-1"
			role="dialog"
		>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						Assign Branch to {{offerData.offerType.type}} <strong>{{offerData.title}}</strong>?
					</div>
					<div class="modal-body">
						<select
							class="form-control"
							ng-model="newBranch"
							ng-change="chan()"
						>
							<option
								style="background-color: white; color: black;"
								disabled
								value=""
							>Please choose</option>
							<option
								style="background-color: white; color: black;"
								ng-repeat="branch in branches"
								ng-selected="branch.id == activeOffer.branch.id"
								value="{{branch.id}}"
								ng-show="branch.isDeleted==0"
							>{{branch.branchCode }}</option>
						</select> {{msg}}
					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-default"
							id="close-popup"
							data-dismiss="modal"
						>Close</button>
						<button
							type="button"
							class="btn btn-primary"
							id="primary-delete"
							ng-click="assignBranch(offerData.id,newBranch)"
							ng-disabled="disa"
						>Assign</button>
					</div>
				</div>
			</div>
		</div>
		<!-- _____________________________________________________________ -->
		<div
			class="modal fade"
			id="confirmBORemoval"
			tabindex="-1"
			role="dialog"
		>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						Remove Branch ??</strong>?
					</div>
					<div class="modal-body">Are you sure that you want to remove
						this offer from selected branch?</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-default"
							id="close-popup"
							data-dismiss="modal"
						>Close</button>
						<button
							type="button"
							class="btn btn-primary"
							id="primary-delete"
							ng-click="offerRemoval(branch,offer)"
						>Delete</button>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div
			id="clickOffersForm"
			emd-redirect-to="dashboard"
		>
			<a
				id="clickOffersFormAnchor"
				href="#/storeAdminOffers/${sessionScope.ACTIVE_LOGGED_USER.branch.uuid }"
			></a>
		</div>
	</c:otherwise>
</c:choose>
<!-- ______________________________ -->
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });

    $(document).ready(function () {
        $("#clickOffersForm").find('#clickOffersFormAnchor').trigger('click');
    });
</script>