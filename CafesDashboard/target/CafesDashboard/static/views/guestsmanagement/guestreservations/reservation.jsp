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
		<h3>
			<a
				ng-click="showReservation=false"
				style="cursor: pointer;"
			>{{title}} </a> <span ng-show="showReservation">/
				{{currentActiveOperation }} Reservation</span>
		</h3>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div ng-show="showReservation">
		<jsp:include
			page="/static/views/guestsmanagement/guestreservations/addReservation.jsp"
		/>
	</div>
	<div
		class="table-responsive"
		ng-hide="showReservation"
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
			<div
				class="form-group"
				style="vertical-align: middle; margin-right: 0px; display: inherit; float: right;"
			>
				<a
					class="btn btn-warning"
					ng-click="addOrEdit('add',null)"
					ng-disabled='showReservation'
					style="background-color: #eab123; border: #eab123;"
				><i
					class="glyphicon glyphicon-plus"
					style="margin-right: 10px;"
				></i>Add Reservation</a>
			</div>
		</form>
		<table class="table table-striped table-bordered table-hover">
			<thead style="color: white; background-color: #4f5f6f;">
				<tr>
					<th ng-click="sort('user.fName')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Guest Name</th>
					<th ng-click="sort('numberOfMembers')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Number of members</th>
					<th ng-click="sort('reservationDate')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Reservation Date</th>
					<th ng-click="sort('reservationTime')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Reservation Time</th>
					<th ng-click="sort('branches.description')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Branch</th>
					<th ng-click="sort('store.storeName')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Store</th>
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
					<th
						ng-show="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
					></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="reservations.length==0">
					<td colspan="11"><center>No records to display</center></td>
				</tr>
				<c:choose>
					<c:when
						test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
					>
						<tr
							dir-paginate="u in reservations|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
							ng-show="u.isDeleted==0 && (u.branch.branchCode=='${sessionScope.ACTIVE_LOGGED_USER.branch.branchCode}')"
						>
							<td>{{u.user.fName}} {{u.user.lName}}</td>
							<td>{{u.numberOfMembers}}</td>
							<td>{{u.reservationDate|date:'MM/dd/yyyy'}}</td>
							<td>{{u.reservationTime}}</td>
							<td>{{u.branch.branchCode}}</td>
							<td>{{u.store.storeName}}</td>
							<td>{{u.description}}</td>
							<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
							<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
						</tr>
					</c:when>
					<c:when
						test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
					>
						<tr
							dir-paginate="u in reservations|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
							ng-show="u.isDeleted==0"
						>
							<td>{{u.user.fName}} {{u.user.lName}}</td>
							<td>{{u.numberOfMembers}}</td>
							<td>{{u.reservationDate|date:'MM/dd/yyyy'}}</td>
							<td>{{u.reservationTime}}</td>
							<td>{{u.branch.branchCode}}</td>
							<td>{{u.store.storeName}}</td>
							<td>{{u.description}}</td>
							<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
							<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
							<td class="center"><a
								class="btn btn-warning"
								ng-click="addOrEdit('edit',u)"
								ng-disabled='showReservation'
							><i class="glyphicon glyphicon-edit"></i></a> <a
								class="btn btn-danger"
								data-toggle="modal"
								data-target="#DeleteReservation"
								ng-disabled='showReservation'
								ng-hide="u.isDeleted==1"
								ng-click="showDelete(u)"
							><i class="glyphicon glyphicon-trash"></i></a></td>
						</tr>
					</c:when>
				</c:choose>
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
	<jsp:include
		page="/static/views/guestsmanagement/guestreservations/delete.jsp"
	></jsp:include>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>