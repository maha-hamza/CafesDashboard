<form
	name="chgimgForm"
	novalidate
>
	<div class="row panel panel-default ">
		<div class="col-lg-10">
			<div class="main-box">
				<div class="main-box-body clearfix">
					<div class="main-box-body clearfix">
						<div class="form-group">
							<input
								type="file"
								id="myDESFile2"
								style="width: 50%; margin-left: 1em;"
								name="file"
								ng-model="file"
								class="form-control"
								accept="image/*"
								valid-file
								ng-required="currentActiveOperation=='add'"
							/> <span
								ng-show="storeForm.file.$error.required "
								style="color: red"
								class="ng-hide"
							>* </span>
						</div>
						<div class="form-group">
							<button
								style="margin-right: 2px;"
								ng-click="changeImg(activeItem.id)"
								class="btn btn-primary btn-sm"
								ng-disabled="menuForm.$invalid"
							>Change</button>
							<button
								id="cancel-form"
								style="float: right; width: 120px;"
								value="Cancel"
								ng-click="cancel()"
								class="btn btn-danger btn-sm"
							>Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>