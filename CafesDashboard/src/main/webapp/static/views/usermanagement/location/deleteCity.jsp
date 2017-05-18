<div
	class="modal fade"
	id="DeleteCity"
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
			<div class="modal-body">Are you sure to delete City
				{{activeCity.city}}?</div>
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
						ng-click="deleteCity(activeCity.id)"
					>Delete</button>
				</div>
			</div>
		</div>
	</div>
</div>