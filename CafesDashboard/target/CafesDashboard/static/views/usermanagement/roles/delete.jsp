<div class="modal fade" id="DeleteRole" ng-show="showDeletion"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true" style="display: block;" data-backdrop="static"
	data-keyboard="false"   style="width:466">
	
	<div class="modal-dialog"  style="width:466">
		<div class="modal-content"  style="width:466" >
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" -->
<!-- 					aria-hidden="true">×</button> -->
<!-- 				<h4 class="modal-title" id="H1">Deletion Confirmation</h4> -->
<!-- 			</div> -->
			<div class="modal-body">  
			Are you sure you want to delete this {{activeRole.roleName}}?</div>
			<div class="modal-footer">
			<a>	<button type="button" class="btn btn-default" id="close-popup" data-dismiss="modal">Close</button> 
			 </a>
				<a><button type="button" class="btn btn-primary" id="primary-delete"
					ng-click="deleteRole(activeRole.id)">Delete</button>  </a>
			</div>
		</div>
	</div>
</div>