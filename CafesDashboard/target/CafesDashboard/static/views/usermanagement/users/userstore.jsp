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
<div
	ng-init="fetchUsersByStore('${sessionScope.ACTIVE_LOGGED_USER.branch.uuid}')"
>
	<div class="row">
		<div class="col-lg-12">
			<br />
			<h3>
				<a
					ng-click="showUser=false"
					style="cursor: pointer;"
				> Guests </a> <span ng-show="showUser">/
					{{currentActiveOperation }} Guests</span> <span ng-show="clicked">/
					Deleted Users</span>
			</h3>
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
		<div ng-show="showUser">
			<jsp:include page="/static/views/usermanagement/users/addStoreGuest.jsp" />
		</div>
		<div
			class="table-responsive"
			ng-hide="showUser"
		>
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
				<div
					class="form-group"
					style="vertical-align: middle; margin-right: 0px; display: inherit; float: right;"
				>
					<a
						class="btn btn-success"
						ng-click="addOrEdit('add',null)"
						ng-disabled='showUser'
					><i
						class="glyphicon glyphicon-plus"
						style="margin-right: 10px;"
					></i>Add Guest</a>
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
					<tr ng-show="usersStore.length==0">
						<td
							colspan="7"
							style="text-align: center;"
						>No records to display</td>
					</tr>
					<tr
						dir-paginate="u in usersStore|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
						ng-show="!(u.isDeleted==0 && clicked)"
						ng-hide="!(u.isDeleted==0 && !clicked)"
					>
						<td>
							<button
								type="button"
								ng-class="{'btn btn-success btn-sm btn-circle ':u.status.status=='ACTIVE','btn btn-danger btn-circle btn-sm':u.status.status=='INACTIVE'} "
								class="btn btn-warn btn-circle btn-sm"
							>{{u.fName|limitTo:1}}</button>
						</td>
						<td><a href="#/storeGuestDetails/{{u.uuid}}">{{u.fName}}</a></td>
						<td><a href="#/storeGuestDetails/{{u.uuid}}">{{u.lName}}</a></td>
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
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>