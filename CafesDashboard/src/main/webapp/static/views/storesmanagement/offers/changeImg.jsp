<%@ page isELIgnored="false"%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 150px"
></div>
<div class="row panel panel-default ">
	<div class="col-lg-10">
		<div class="main-box">
			<div class="main-box-body clearfix">
				<div class="main-box-body clearfix">
					<form
						name="offerimgform"
						novalidate
					>
						<br />
						<div
							class="form-group"
							style="display: flex"
						>
							<input
								type="file"
								id="myDESFile4"
								style="width: 50%; margin-left: 1em;"
								name="file"
								ng-model="file"
								class="form-control"
								accept="image/*"
								valid-file
								ng-required="currentActiveOperation=='add'"
							/> &nbsp;<span
								ng-show="offerimgform.file.$error.required "
								style="color: red"
								class="ng-hide"
							>* </span>
						</div>
						<div class="form-group">
							<button
								style="margin-right: 2px;"
								ng-click="changeImg(activeOffer.id)"
								class="btn btn-primary btn-sm"
								ng-disabled="offerimgform.$invalid"
							>Change</button>
							<button
								id="cancel-form"
								style="float: right; width: 120px;"
								value="Cancel"
								ng-click="cancel()"
								class="btn btn-danger btn-sm"
							>Cancel</button>
						</div>
					</form>
				</div>
				<br />
			</div>
		</div>
	</div>
</div>
