<div
	class="modal fade"
	id="DeleteUser"
	ng-show="showDeletion"
	tabindex="-1"
	role="dialog"
	aria-labelledby="myModalLabel"
	aria-hidden="true"
	style="display: block;"
	data-backdrop="static"
	data-keyboard="false"
>
	<div class="modal-dialog">
		<div class="modal-content2">
			<div class="modal-body">Are you sure you want to delete
				{{activeUser.fName}} {{activeUser.lName}}?</div>
			<div
				class="modal-footer"
				style="display: flex; float: right; padding-right: 0px; padding-top: 12px;"
			>
				<div class="form-group">
					<button
						type="button"
						class="btn btn-default"
						data-dismiss="modal"
						id="close-popup"
					>Close</button>
					<button
						type="button"
						class="btn btn-primary"
						id="primary-delete"
						ng-click="deleteUser(activeUser.id)"
					>Delete</button>
				</div>
			</div>
		</div>
	</div>
</div>
