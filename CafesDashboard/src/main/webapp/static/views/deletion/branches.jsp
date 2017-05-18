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
<div class="row">
	<div class="col-lg-12">
		<br />
		<h4>
			<a href="#/deletion">Deletion Pages </a>> {{title}}
		</h4>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div class="table-responsive">
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
		</form>
		<div
			class="form-group table-responsive"
			ng-init="getDeletedBranches()"
		>
			<table class="table table-striped table-bordered table-hover">
				<thead style="color: white; background-color: #4f5f6f;">
					<tr>
						<th ng-click="sort('country')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Country</th>
						<th ng-click="sort('city')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;City</th>
						<th ng-click="sort('open')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Open</th>
						<th ng-click="sort('close')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Close</th>
						<th ng-click="sort('address')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Address</th>
						<th ng-click="sort('description')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Description</th>
						<th ng-click="sort('createdAt')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Creation Date</th>
						<th ng-click="sort('updatedAt')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Last Updated</th>
						<th ng-click="sort('branchCode')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Branch Code</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-show="delBranches.length==0">
						<td colspan="10"><center>No records to display</center></td>
					</tr>
					<c:choose>
						<c:when
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
						>
							<tr
								dir-paginate="u in delBranches|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
							>
								<td>{{u.country.country}}</td>
								<td>{{u.city.city}}</td>
								<td>{{u.open|date:' h:mma'}}</td>
								<td>{{u.close|date:' h:mma'}}</td>
								<td>{{u.address}}</td>
								<td>{{u.description}}</td>
								<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
								<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
								<td>{{u.branchCode}}</td>
								<td><a
									class="btn btn-warning"
									data-toggle="modal"
									data-target="#BranchModal"
									ng-click="showBRPU(u)"
								><i class="fa fa-repeat"></i></a></td>
							</tr>
						</c:when>
						<c:when
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
						>
							<tr
								dir-paginate="u in branches|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
								ng-show="u.isDeleted==1"
							>							
								<td>{{u.country.country}}</td>
								<td>{{u.city.city}}</td>
								<td>{{u.open|date:' h:mma'}}</td>
								<td>{{u.close|date:' h:mma'}}</td>
								<td>{{u.address}}</td>
								<td>{{u.description}}</td>
								<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
								<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
								<td>{{u.branchCode}}</td>
								<td><a
									class="btn btn-warning"
									data-toggle="modal"
									data-target="#BranchModal"
									ng-click="showBRPU(u)"
								><i class="fa fa-repeat"></i></a></td>
							</tr>
						</c:when>
					</c:choose>
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
<!-- __________unDelete modal__________ -->
<%@ include file="/static/views/deletion/restore/delete.jsp"%>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>