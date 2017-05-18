<div
	class="modal fade"
	id="DeleteCountry"
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
		<div class="modal-content">
			<div class="modal-body">Are you sure to delete Country
				{{activeCountry.country}}, Please be caution that this will delete
				all underlied cities?</div>
			<div class="modal-footer">
				<div class="form-group">
					<button
						type="button"
						class="btn btn-default"
						id="close-popup"
						data-dismiss="modal"
					>Close</button>
					<button
						type="button"
						class="btn btn-primary"
						id="primary-delete"
						ng-click="deleteCountry(activeCountry.id)"
					>Delete</button>
				</div>
			</div>
		</div>
	</div>
</div>