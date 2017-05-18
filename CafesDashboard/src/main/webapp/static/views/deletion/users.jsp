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
<div ng-init="fetchAllDeletedUsers()">
	<c:choose>
		<c:when
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
		>
			<c:redirect url="#/users" />
		</c:when>
		<c:when
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
		>
			<div class="row">
				<div class="col-lg-12">
					<br />
					<h4>
						<a href="#/deletion">Deletion Pages</a> > {{title}}
					</h4>
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
						<!-- ___________________________ -->
						<div
							class="form-group"
							style="width: 440px;"
						>
							<select
								style="background-color: #730419; color: white; border: white; width: 150px !important"
								class="form-control"
								ng-model="role"
								ng-init="role=='user'"
							>
								<option
									style="background-color: white; color: black;"
									disabled
									value=""
								>Please choose</option>
								<option
									style="background-color: white; color: black;"
									value="user"
								>Users</option>
								<option
									style="background-color: white; color: black;"
									value="guest"
								>Guests</option>
							</select>
						</div>
						<!-- ___________________________ -->
					</form>
									<div class="form-group table-responsive">
					
					<table class="table table-striped table-bordered table-hover">
						<thead style="color: white; background-color: #4f5f6f;">
							<tr>
								<th></th>
								<th ng-click="sort('fName')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;Firstname</th>
								<th>&nbsp;Lastname</th>
								<th>&nbsp;Creation Date</th>
								<th>&nbsp;Last Updated</th>
								<th ng-click="sort('role.roleName')"><span
									class="glyphicon sort-icon"
									ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
								></span>&nbsp;Role</th>
								<th>&nbsp;Follower Branch</th>
								<th>Restore</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-show="deletedUsers.length==0">
								<td
									colspan="7"
									style="text-align: center;"
								>No records to display</td>
							</tr>
							<tr
								dir-paginate="u in deletedUsers|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
								ng-show="(u.role.roleName !='GUEST')&& (role=='user')"
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
								<td><div ng-hide="u.role.roleName == 'GENERAL_ADMIN'">{{u.branch.branchCode}}</div></td>
								<td class="center"><a
									class="btn btn-warning"
									data-toggle="modal"
									data-target="#notificationModal2"
									ng-click="showPU(u)"
								><i class="fa fa-repeat"></i></a></td>
							</tr>
							<tr
								dir-paginate="u in deletedUsers|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
								ng-show="(u.role.roleName =='GUEST')&& (role=='guest')"
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
								<td><div ng-hide="u.role.roleName == 'GENERAL_ADMIN'">{{u.branch.branchCode}}</div></td>
								<td class="center"><a
									class="btn btn-warning"
									data-toggle="modal"
									data-target="#notificationModal2"
									ng-click="showPU(u)"
								><i class="fa fa-repeat"></i></a></td>
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
		</c:when>
	</c:choose>
</div>
<!-- __________unDelete modal__________ -->
<%@ include file="/static/views/deletion/restore/delete.jsp"%>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>