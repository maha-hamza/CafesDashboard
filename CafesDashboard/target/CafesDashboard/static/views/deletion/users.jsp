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
		test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'STORE_ADMIN'}"
	>
		<c:redirect url="#/users" />
	</c:when>
	<c:when
		test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMINN'}"
	>
		<div class="row">
			<div class="col-lg-12">
				<br />
				<h3><a href="#/deletion">Deletion Pages > </a>{{title}}</h3>
			</div>
		</div>
		<div
			class="panel panel-default"
			style="background-color: #fff;"
		></div>
		<div
			class="panel-body"
			style="background-color: #fff;"
		>
			<div
				class="table-responsive"
				ng-hide="showUser"
			>
				<form
					class="form-inline"
					style="padding-bottom: 20px;"
				>
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
				<table class="table table-striped table-bordered table-hover">
					<thead style="color: white; background-color: #4f5f6f;">
						<tr>
							<th ng-click="sort('status.status')"><span
								class="glyphicon sort-icon"
								ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
							></th>
							<th ng-click="sort('fName')"><span
								class="glyphicon sort-icon"
								ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
							></span>&nbsp;Firstname</th>
							<th ng-click="sort('lName')"><span
								class="glyphicon sort-icon"
								ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
							></span>&nbsp;Lastname</th>
							<th ng-click="sort('createdAt')"><span
								class="glyphicon sort-icon"
								ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
							></span>&nbsp;Creation Date</th>
							<th ng-click="sort('updatedAt')"><span
								class="glyphicon sort-icon"
								ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
							></span>&nbsp;Last Updated</th>
							<th ng-click="sort('role.roleName')"><span
								class="glyphicon sort-icon"
								ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
							></span>&nbsp;Role</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-show="users.length==0">
							<td
								colspan="7"
								style="text-align: center;"
							>No records to display</td>
						</tr>
						<tr
							dir-paginate="u in users|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
							ng-show="u.isDeleted==1"
						>
							<td>
								<button
									type="button"
									ng-class="{'btn btn-success btn-sm btn-circle ':u.status.status=='ACTIVE','btn btn-danger btn-circle btn-sm':u.status.status=='INACTIVE'} "
									class="btn btn-warn btn-circle btn-sm"
								>{{u.fName|limitTo:1}}</button>
							</td>
							<td><a href="#/userDetails/{{u.uuid}}">{{u.fName}}</a></td>
							<td><a href="#/userDetails/{{u.uuid}}">{{u.lName}}</a></td>
							<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							<td>{{u.role.roleName}}</td>
						</tr>
					</tbody>
				</table>
				<dir-pagination-controls
					max-size="10"
					direction-links="true"
					boundary-links="true"
				> </dir-pagination-controls>
			</div>
		</div>
		<div>
			<jsp:include page="/static/views/usermanagement/users/delete.jsp"></jsp:include>
		</div>
	</c:when>
</c:choose>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>