<div class="modal fade" id="DeleteBranch" ng-show="showDeletion"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true" style="display: block;" data-backdrop="static"
	data-keyboard="false">
	>
	<div class="modal-dialog">
		<div class="modal-content">
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" -->
<!-- 					aria-hidden="true">×</button> -->
<!-- 				<h4 class="modal-title" id="H1">Deletion Confirmation</h4> -->
<!-- 			</div> -->
			<div class="modal-body">Are you sure To delete
				{{activeBranch.description}}?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"  id="close-popup" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"  id="primary-delete"
					ng-click="deleteBranch(activeBranch.id)">Delete</button>
			</div>
		</div>
	</div>
</div>