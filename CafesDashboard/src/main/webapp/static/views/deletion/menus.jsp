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
						<div class="form-group table-responsive">
		
		<table class="table table-striped table-bordered table-hover">
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
					>Restore</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="menues.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<tr
					dir-paginate="u in menues|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
					ng-show="u.isDeleted==1"
				>
					<td><a
						style="cursor: pointer;"
						ng-click="changeimgconv(u)"
					><img
							src="{{u.img}}"
							alt="menu"
							width="100px"
						/></a></td>
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
						data-toggle="modal"
						data-target="#menuModal"
						ng-click="showMNPU(u)"
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
<!-- __________unDelete modal__________ -->
<%@ include file="/static/views/deletion/restore/delete.jsp"%>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>