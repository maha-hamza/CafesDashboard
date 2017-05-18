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
<div class="row" 	ng-init="fetchAllOrders()">
	<br />
	<div class="col-lg-12">
		<h3>
			<a>{{title}}</a>
		</h3>
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
			<div
				class="form-group"
				style="vertical-align: middle; margin-right: 0px; display: inherit; float: right;"
			></div>
		</form>
		<div class="form-group table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<thead style="color: white; background-color: #4f5f6f;">
					<tr>
						<th></th>
						<th ng-click="sort('user.fName')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Guest Name</th>
						<th ng-click="sort('orderTotalPrice')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;orderTotalPrice</th>
						<th ng-click="sort('branch.description')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Branch</th>						
						<th ng-click="sort('createdAt')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Creation Date</th>
						<th ng-click="sort('updatedAt')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Last Updated</th>
						<c:if
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
						>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<tr ng-show="orders.length==0">
						<td colspan="7"><center>No records to display</center></td>
					</tr>
					<c:choose>
						<c:when
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
						>
							<tr
								dir-paginate="u in orders|filter:search|itemsPerPage:50"
								ng-show="(u.branch.branchCode=='${sessionScope.ACTIVE_LOGGED_USER.branch.branchCode}')"
							>
								<td><a href="#/orderDetails/{{u.uuid}}">details</a></td>
								<td>{{u.user.fName}} {{u.user.lName}}</td>
								<td>{{u.orderTotalPrice}}</td>
								<td>{{u.branch.branchCode}}</td>								
								<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
								<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
							</tr>
						</c:when>
						<c:when
							test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
						>
							<tr dir-paginate="u in orders|filter:search|itemsPerPage:50">
								<td><a href="#/orderDetails/{{u.uuid}}">details</a></td>
								<td>{{u.user.fName}} {{u.user.lName}}</td>
								<td>{{u.orderTotalPrice}}</td>
								<td>{{u.branch.branchCode}}</td>								
								<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
								<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
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
<div>
	<jsp:include page="/static/views/guestsmanagement/orders/delete.jsp"></jsp:include>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>