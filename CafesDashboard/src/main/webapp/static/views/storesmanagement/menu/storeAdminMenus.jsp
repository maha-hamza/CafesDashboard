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
<div
	ng-init="fetchMenuByStore('${sessionScope.ACTIVE_LOGGED_USER.store.uuid}')"
>
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
						class="btn btn-success"
						ng-click="addOrEdit('add',null)"
						ng-disabled='showItem'
					><i
						class="glyphicon glyphicon-plus"
						style="margin-right: 10px;"
					></i>Add Menu Item</a>
				</div>
			</form>
			<table class="table table-striped table-bordered table-hover">
				<thead style="color: white; background-color: #4f5f6f;">
					<tr>
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
						<th ng-click="sort('isDeleted')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;IsDeleted</th>
						<th ng-click="sort('category')"><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Category</th>
						<th
							ng-click="sort('branches')"
							colspan="2"
						><span
							class="glyphicon sort-icon"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
						></span>&nbsp;Branch and Store</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-show="menues.length==0">
						<td colspan="7"><center>No records to display</center></td>
					</tr>
					<tr
						dir-paginate="u in menues|filter:search|itemsPerPage:10"
					>
						<td>{{u.itemName}}</td>
						<td>{{u.itemDescription}}</td>
						<td>{{u.itemPrice}}</td>
						<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
						<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
						<td>{{u.isDeleted}}</td>
						<td>{{u.category.categoryName}}</td>
						<td colspan="2">
							<table>
								<tr ng-repeat="branch in u.branches">
									<td><span
										class="glyphicon glyphicon-shopping-cart"
										aria-hidden="true"
									></span>{{branch.branchCode}}</td>
									<td>&nbsp;<i class="glyphicon glyphicon-cutlery"></i>{{branch.store.storeName}}
									</td>
								</tr>
							</table>
						</td>
						<td class="center"><a
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
			<dir-pagination-controls
				max-size="10"
				direction-links="true"
				boundary-links="true"
			> </dir-pagination-controls>
		</div>
	</div>
	<div>
		<jsp:include page="/static/views/storesmanagement/menu/menudelete.jsp"></jsp:include>
	</div>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>