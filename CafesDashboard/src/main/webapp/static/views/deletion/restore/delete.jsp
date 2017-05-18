<head>
<style>
@media (max-width: 320px) {
	.modal-content2{
	    width: 300px;
	    margin-top:80px;
	    margin-left:5px;
	   height: 226px;
    background-color: white !important;
    border-radius: 6px;
	}
	}
	@media (min-width: 1600px) {
  .modal-content2{
	    width: 600px;
	    margin-top:80px;
	    margin-left:100px;
	   height: 380px;
    background-color: white;
    border-radius: 6px;
	    
}
}
</style>
</head>
<div
	class="modal fade"
	id="notificationModal2"
	ng-show="restoreUser"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content2" style="width:297px;height:200px;">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{use.fName +" "+use.lName}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore this
				user data?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button 
					ng-click="showUnDelete(use)"
					type="button"
					class="btn btn-primary"  id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="countryModal"
	ng-show="restoreCountry"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreCoun.country}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				{{restoreCoun.country}} data ?</div>
			<div class="modal-footer">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button  style="width:66px;padding-right:12px;font-size:10pt;padding-left:8px;margin-top:0px;"
					ng-click="showUnCDelete(restoreCoun)"
					type="button"
					class="btn btn-primary" id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="cityModal"
	ng-show="restoreCity"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreCty.city}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				{{restoreCty.city}} data ?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="showUnCiDelete(restoreCty)"
					type="button"
					class="btn btn-primary"  id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="categoryModal"
	ng-show="restoreCategory"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreCat.categoryName}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				{{restoreCat.categoryName}} data ?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="showUnCatDelete(restoreCat)"
					type="button"
					class="btn btn-primary"  id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="menuModal"
	ng-show="restoreMenu"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreMnu.itemName}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				{{restoreMnu.itemName}} data ?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="showUnMenuDelete(restoreMnu)"
					type="button"
					class="btn btn-primary"  id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="reservationModal"
	ng-show="restoreReservation"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreRes.itemName}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				Reservation in {{restoreRes.branch.branchCode}} for
				{{restoreRes.user.fName}} {{restoreRes.user.lName}} data ?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="showUnResDelete(restoreRes)"
					type="button"
					class="btn btn-primary"  id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="offerM"
	ng-show="showOf"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreOff.title}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				{{restoreOff.title}} data ?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="showUnOffDelete(restoreOff)"
					type="button"
					class="btn btn-primary"   id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="BranchModal"
	ng-show="restoreBranch"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Undelete {{restoreBR.branchCode}}</h4>
			</div>
			<div class="modal-body">Are you sure you want to restore
				{{restoreBR.branchCode}} data ?</div>
			<div class="modal-footer" style="margin-top:0px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="showUnBRNCHDelete(restoreBR)"
					type="button"
					class="btn btn-primary" id="my-restore"
				>Restore</button>
			</div>
		</div>
	</div>
</div>
<!-- ____________________________________________________________________ -->
<div
	class="modal fade"
	id="deleteimgmodal"
	ng-show="deleteimg"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content" style="height: 250px">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-hidden="true"
				>&times;</button>
				<h4
					class="modal-title"
					id="H1"
				>Deleting Image {{imgName}} Perminintaly??</h4>
			</div>
			<div class="modal-body">Are you sure you want to Delete This
				photo Perminintaly? Be caution that it may be used somewhere in the
				system</div>
			<div class="modal-footer" style="margin-top:0px;height:280px;">
				<button
					type="button"
					class="btn btn-default"
					data-dismiss="modal"
				>Close</button>
				<button
					ng-click="remove(imgName)"
					type="button"
					class="btn btn-primary"  id="my-restore"
				>Delete</button>
			</div>
		</div>
	</div>
</div>