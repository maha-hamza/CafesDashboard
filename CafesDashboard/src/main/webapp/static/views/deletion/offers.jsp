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
<br/>
	<div class="col-lg-12">
		<h4>
			<a href="#/deletion">Deletion Pages </a>> {{title}}
		</h4>
	</div>
</div>
<div class="panel panel-default"></div>
<div class="panel-body">
	<div class="table-responsive">
		<div ng-show="showOffer">
			<jsp:include
				page="/static/views/storesmanagement/offers/addOffer.jsp"
			/>
		</div>
		<div ng-show="showImg">
			<jsp:include
				page="/static/views/storesmanagement/offers/changeImg.jsp"
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
			<!-- ___________________________ -->
		
			
			
			<div
						class="form-group"
						style="width: 440px;"
					>
						<select
							style="background-color: #730419; color: white; border: white; width: 150px !important"
							ng-init="fetchAllOfferType()"
							class="form-control"
							ng-model="value"
						>
							<option
								style="background-color: white; color: black;"
								disabled
								value=""
							>Please choose</option>
							<option
								style="background-color: white; color: black;"
								ng-repeat="type in otypes"
								value="{{type.type}}"
								ng-selected="type.type == value"
							>{{type.type }}</option>
						</select>
					</div>
			<!-- ___________________________ -->
			
		</form>
						<div class="form-group table-responsive">
		
		<table class="table table-striped table-bordered table-hover">
			<thead style="color: white; background-color: #4f5f6f;">
				<tr>
					<th></th>
					<th ng-click="sort('offerType')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;Offer Type</th>
					<th>&nbsp;Title</th>
					<th>&nbsp;Description</th>
					<th ng-click="sort('from')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;from</th>
					<th ng-click="sort('to')"><span
						class="glyphicon sort-icon"
						ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"
					></span>&nbsp;to</th>
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
					<th>Branchs</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-show="offers.length==0">
					<td colspan="7"><center>No records to display</center></td>
				</tr>
				<tr
					dir-paginate="u in offers|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
					ng-show="((u.offerType.type=='offer') && (value=='offer' || value==null)) &&(u.isDeleted==1)"
				>
					<td><a
						style="cursor: pointer;"
						ng-click="changeimgoffer(u)"
					><img
							src="{{u.imgLogo}}"
							width="100"
						/></a></td>
					<td>{{u.offerType.type}}</td>
					<td>{{u.title}}</td>
					<td>{{u.description}}</td>
					<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.isDeleted}}</td>
					<td>
						<ul>
							<li ng-repeat="branch in u.branches">{{branch.branchCode}}
						</ul>
						<div
							ng-show="u.branches.length==0"
							style="margin-left: 0"
						>
							<a>Assign Branches To Offer</a>
						</div>
					</td>
					<td class="center"><a
						class="btn btn-warning"
						data-toggle="modal"
						data-target="#offerM"
						ng-click="showCOff(u)"
					><i class="fa fa-repeat"></i></a></td>
				</tr>
				<tr
					dir-paginate="u in offers|orderBy:sortKey:reverse|filter:search|itemsPerPage:50"
					ng-show="(u.offerType.type=='event' && (value=='event')) && (u.isDeleted==1)"
				>
					<td><a
						style="cursor: pointer;"
						ng-click="changeimgoffer(u)"
					><img
							src="{{u.imgLogo}}"
							width="100"
						/></a></td>
					<td>{{u.offerType.type}}</td>
					<td>{{u.title}}</td>
					<td>{{u.description}}</td>
					<td>{{u.from|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.to|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.createdAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.updatedAt|date:'MM/dd/yyyy @ h:mma'}}</td>
					<td>{{u.isDeleted}}</td>
					<td>
						<ul>
							<li ng-repeat="branch in u.branches">{{branch.branchCode}}
						</ul>
						<div
							ng-show="u.branches.length==0"
							style="margin-left: 0"
						>
							<a>Assign Branches To Offer</a>
						</div>
					</td>
					<td class="center"><a
						class="btn btn-warning"
						data-toggle="modal"
						data-target="#offerM"
						ng-click="showCOff(u)"
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