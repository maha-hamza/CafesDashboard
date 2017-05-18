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
		<div
			id="clickStoreAdminOffersForm"
			emd-redirect-to="dashboard"
		>
			<a
				id="clickStoreAdminOffersFormAnchor"
				href="#/offers"
			></a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row">
			<div class="col-lg-12">
				<h2>{{title}}</h2>
			</div>
		</div>
		<div
			class="panel panel-default"
			ng-init="fetchOffersByBranch()"
		></div>
		<div class="panel-body">
			<div class="table-responsive">
			<!--  	<div ng-show="showOffer">
					<jsp:include
						page="/static/views/storesmanagement/offers/addBranchOffer.jsp"
					/>
				</div>
			-->
				<div ng-show="showImg">
					<jsp:include
						page="/static/views/storesmanagement/offers/changeImg.jsp"
					/>
				</div>
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
					<!--  	<div
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
						></i>Add {{value}}</a>
					</div> -->
				</form>
				<table class="table table-striped table-bordered table-hover">
					<thead style="color: white; background-color: #4f5f6f;">
						<tr>
							<th></th>
							<th>&nbsp;Offer Type</th>
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
						</tr>
					</thead>
					<tbody>
						<tr ng-show="offerz.length==0">
							<td colspan="7"><center>No records to display</center></td>
						</tr>
						<tr
							dir-paginate="u in offerz|filter:search|itemsPerPage:50"
							ng-show="((u.offerType.type=='offer') && (value=='offer' || value==null)) &&(u.isDeleted==0)"
						>
							<td style="overflow: hidden; white-space: nowrap;"><img
									src="{{u.imgLogo}}"
									width="100"
								/></td>
							<td>{{u.offerType.type}}</td>
							<td>{{u.title}}</td>
							<td>{{u.description}}</td>
							<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
						</tr>
						<tr
							dir-paginate="u in offerz|filter:search|itemsPerPage:50"
							ng-show="(u.offerType.type=='event' && (value=='event')) && (u.isDeleted==0)"
						>
							<td style="overflow: hidden; white-space: nowrap;"> <img
									src="{{u.imgLogo}}"
									width="100"
								/></td>
							<td>{{u.offerType.type}}</td>
							<td>{{u.title}}</td>
							<td>{{u.description}}</td>
							<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
						</tr>
					</tbody>
				</table>
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
	</c:otherwise>
</c:choose>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });

    $(document).ready(
            function () {
                $("#clickStoreAdminOffersForm").find(
                        '#clickStoreAdminOffersFormAnchor').trigger('click');
            });
</script>