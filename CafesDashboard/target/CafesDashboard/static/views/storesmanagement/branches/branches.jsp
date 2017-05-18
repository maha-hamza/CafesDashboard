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
				ng-click="showBranch=false"
				style="cursor: pointer;"
			>{{title}} </a> <span ng-show="showBranch">/
				{{currentActiveOperation }} Branch</span>
		</h3>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div ng-show="showBranch">
		<jsp:include
			page="/static/views/storesmanagement/branches/addBranch.jsp"
		/>
	</div>
	<div
		class="table-responsive"
		ng-hide="showBranch"
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
					ng-disabled='showBranch'
					style="background-color: #eab123; border: #eab123;"
				><i
					class="glyphicon glyphicon-plus"
					style="margin-right: 10px;"
				></i>Add Branch</a>
			</div>
		</form>
		<table class="table table-striped table-bordered table-hover">
			<thead style="color: white; background-color: #4f5f6f;">
				<tr>
					<th ng-click="sort('branchCode')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Branch Code</th>
					<th ng-click="sort('country')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Country</th>
					<th ng-click="sort('city')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;City</th>
					<th ng-click="sort('createdAt')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Creation Date</th>
					<th ng-click="sort('updatedAt')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Last Updated</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="branches.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<tr
					dir-paginate="u in branches|orderBy:sortKey:reverse|filter:search|itemsPerPage:10"
					ng-hide="u.isDeleted==1"
				>
					<td><a href="#/branchdetails/{{u.uuid}}">{{u.branchCode}}</a></td>
					<td>{{u.country.country}}</td>
					<td>{{u.city.city}}</td>
					<td>{{u.createdAt |date:'MM/dd/yyyy h:mma'}}</td>
					<td>{{u.updatedAt |date:'MM/dd/yyyy h:mma'}}</td>
					<td class="center"><a
						class="btn btn-warning"
						ng-click="addOrEdit('edit', u)"
						ng-disabled='showBranch'
					><i class="glyphicon glyphicon-edit"></i></a> <a
						class="btn btn-danger"
						data-toggle="modal"
						data-target="#DeleteBranch"
						ng-disabled='showBranch'
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
	<jsp:include page="/static/views/storesmanagement/branches/delete.jsp"></jsp:include>
</div>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>