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
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 150px"
></div>
<div ng-hide="showLoader">
	<c:choose>
		<c:when
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
		>
			<div class="row">
				<div class="col-lg-12">
					<br />
					<h3>
						<a
							href="#/settings"
							style="cursor: pointer;"
						>Settings</a> / System Images
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
				ng-init="loadImages()"
			>
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead style="color: white; background-color: #4f5f6f;">
							<tr>
								<th>Image</th>
								<th>Image Name</th>
								<th></th>
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
								dir-paginate="u in images|filter:search|itemsPerPage:20"
							>
								<td><img
									src="{{u.fullPath}}"
									alt="{{u.imgName}}"
									width="100"
								/></td>
								<td>{{u.imgName}}</td>
								<td><button
										class="btn btn-danger"
										data-toggle="modal"
										data-target="#deleteimgmodal"
										ng-click="warnDeletion(u.imgName)"
									>Remove Photo</button></td>
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls
						max-size="20"
						direction-links="true"
						boundary-links="true"
					> </dir-pagination-controls>
				</div>
			</div>
			<div >
				<jsp:include page="/static/views/deletion/restore/delete.jsp"></jsp:include>
			</div>
		</c:when>
	</c:choose>
</div>