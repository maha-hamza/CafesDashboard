<%@ page isELIgnored="false"%>
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
		<h2>{{title}}</h2>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div class="table-responsive">
		<div ng-show="showItem">
			<jsp:include
				page="/static/views/storesmanagement/menu/addMenuItem.jsp"
			/>
		</div>
		<div ng-show="showImg">
			<jsp:include page="/static/views/storesmanagement/menu/changeImg.jsp" />
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
			<div
				class="form-group"
				style="vertical-align: middle; margin-right: 0px; display: inherit; float: right;"
				ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
			>
				<a
					class="btn btn-warning"
					ng-click="addOrEdit('add',null)"
					ng-disabled='showItem'
					style="background-color: #eab123; border: #eab123;"
				><i
					class="glyphicon glyphicon-plus"
					style="margin-right: 10px;"
				></i>Add Menu Item</a>
			</div>
		</form>
		<div class="form-group table-responsive">
			<table class="table table-striped table-bordered table-hover table-condensed">
				<thead style="color: white; background-color: #4f5f6f;">
					<tr>
						<th></th>
						<th ng-click="sort('itemName')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Item</th>
						<th ng-click="sort('itemDescription')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Description</th>
						<th ng-click="sort('itemPrice')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Price</th>
						<th ng-click="sort('createdAt')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Creation Date</th>
						<th ng-click="sort('updatedAt')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Last Updated</th>
						<th ng-click="sort('category')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Category</th>
						<th
							ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
						></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-show="menues.length==0">
						<td colspan="7"><center>No records to display</center></td>
					</tr>
					<tr
						dir-paginate="u in menues|filter:search|itemsPerPage:50"
						ng-show="u.isDeleted==0"
					>
						<td>
							<div
								ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
							>
								<a
									style="cursor: pointer;"
									ng-click="changeimgconv(u)"
								> <span class="glyphicon glyphicon-upload"></span><img
									src="{{u.img}}"
									alt="menu"
									width="100px"
								/></a>
							</div>
							<div
								ng-show="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
							>
								<img
									src="{{u.img}}"
									alt="menu"
									width="100px"
								/>
							</div>
						</td>
						<td>{{u.itemName}}</td>
						<td>{{u.itemDescription}}</td>
						<td>{{u.itemPrice}}</td>
						<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
						<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
						<td>{{u.category.categoryName}}</td>
						<td
							class="center"
							ng-hide="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
						><a
							class="btn btn-warning"
							ng-click="addOrEdit('edit', u)"
							ng-disabled='showItem'
						><i class="glyphicon glyphicon-edit"></i></a> <a
							class="btn btn-danger"
							data-toggle="modal"
							data-target="#DeleteItem"
							ng-disabled='showItem'
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
	<jsp:include page="/static/views/storesmanagement/menu/menudelete.jsp"></jsp:include>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>