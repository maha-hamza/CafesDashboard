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
			<br />
			<div class="col-lg-12">
				<h4>
					<a href="#/settings">Settings </a>> {{title}}
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
				<div class="form-group table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead style="color: white; background-color: #4f5f6f;">
							<tr>
								<th ng-click="sort('roleName')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;Role</th>
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
							<tr ng-show="roles.length==0">
								<td colspan="7"><center>No records to display</center></td>
							</tr>
							<tr
								dir-paginate="u in roles|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
							>
								<td>{{u.roleName}}</td>
								<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
								<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<dir-pagination-controls
					max-size="10"
					direction-links="true"
					boundary-links="true"
				> </dir-pagination-controls>
			</div>
		</div>
		<div>
			<jsp:include page="/static/views/usermanagement/roles/delete.jsp"></jsp:include>
		</div>
	</c:when>
	<c:otherwise>
		<div
			id="clickRolesForm"
			emd-redirect-to="dashboard"
		>
			<a
				id="clickRolesFormAnchor"
				href="#/dashboard"
			></a>
		</div>
	</c:otherwise>
</c:choose>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });

    $(document).ready(function () {
        $("#clickRolesForm").find('#clickRolesFormAnchor').trigger('click');
    });
</script>