<div class="modal fade" id="DeleteOrder" ng-show="showDeletion"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true" style="display: block;" data-backdrop="static"
	data-keyboard="false">
	>
	<div class="modal-dialog">
		<div class="modal-content2">
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" -->
<!-- 					aria-hidden="true">×</button> -->
<!-- 				<h4 class="modal-title" id="H1">Deletion Confirmation</h4> -->
<!-- 			</div> -->
			<div class="modal-body">Are you sure To Delete Order for Guest
				{{activeOrder.user.fName}}?</div>
<div class="modal-footer"   style="display:flex;float:right;padding-right: 0px;padding-top: 12px;">	
		<div class="form-group">
		<button type="button" class="btn btn-default"  id="id="close-popup"" data-dismiss="modal">Close
		</button>
		<button type="button" class="btn btn-primary" id="primary-delete"
					ng-click="deleteOrder(activeOrder.id)">Delete</button>
					</div>
			</div>
		</div>
	</div>
</div>