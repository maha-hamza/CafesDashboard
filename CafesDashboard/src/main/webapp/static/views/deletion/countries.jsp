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
	<br />
	<div class="col-lg-12">
		<h4>
			<a href="#/deletion">Deletion Pages </a>> Countries
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
					<th ng-click="sort('country')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Country</th>
					<th ng-click="sort('uuid')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;UUID</th>
					<th>Restore</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="countries.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<tr
					dir-paginate="u in countries|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
					ng-show="u.isDeleted==1"
				>
					<td>{{u.country}}</td>
					<td>{{u.uuid}}</td>
					<td class="center"><a
						class="btn btn-warning"
						data-toggle="modal"
						data-target="#countryModal"
						ng-click="showCPU(u)"
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