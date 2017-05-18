<%@ page isELIgnored="false"%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center;"
></div>

<div
	class="row panel panel-default "
	ng-hide="showLoader"
>
	<div class="col-lg-10">
		<div class="main-box">
			<header class="main-box-header clearfix">
				<h4 style="font-weight: 600; font-family: sans-serif;">{{subtitle}}</h4>
			</header>
			<form
				novalidate
				name="offerForm"
			>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px; overflow: hidden; white-space: nowrap;"
						>
							<label for="text2">Type</label>
							<div style="display: flex;">
								<select
									style="background-color: #730419; color: white; border: white;"
									class="form-control"
									ng-model="activeOffer.offerType"
									ng-required="true"
									name="type"
								>
									<option
										style="background-color: white; color: black;"
										disabled
										value=""
									>Please choose</option>
									<option
										style="background-color: white; color: black;"
										ng-repeat="type in types"
										ng-selected="type.id == activeOffer.offerType.id"
										value="{{type.id}}"
									>{{type.type }}</option>
								</select> <span
									style="color: red;"
									ng-show="offerForm.type.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Description</label>
							<div style="display: flex;">
								<input
									type="text"
									id="text1"
									placeholder="Description"
									class="form-control"
									ng-model="activeOffer.description"
									ng-required="true"
									name="desc"
								> <span
									style="color: red"
									ng-show="offerForm.desc.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px;"
						>
							<label for="text2">Title</label>
							<div style="display: flex;">
								<input
									style="background-color: #1eb7e9; color: white; border: white;"
									type="text"
									class="form-control"
									ng-model="activeOffer.title"
									ng-required="true"
									name="title"
								> <span
									style="color: red"
									ng-show="offerForm.title.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
						<div
							class="form-group"
							ng-show="currentActiveOperation=='add'"
						>
							<div style="display: flex;">
								<input
									style="background-color: #eab123; color: white; border: white; margin-top: 25px; width: 80%; margin-left: 12px;"
									type="file"
									id="myDESFile3"
									name="file"
									ng-model="file"
									class="form-control"
									accept="image/*"
									valid-file
									ng-required="currentActiveOperation=='add'"
								/> <span
									style="color: red"
									ng-show="offerForm.file.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 50%;"
						>
							<label for="text2">From</label>
							<div style="display: flex;">
								<input
									style="background-color: #1eb7e9; color: white; border: white;"
									type="datetime-local"
									class="form-control"
									ng-model="activeOffer.from"
									ng-required="true"
									name="from"
								> <span
									style="color: red"
									ng-show="offerForm.from.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
						<div
							class="form-group"
							style="margin-left: 10px; width: 44%;"
						>
							<label for="text2">To</label>
							<div style="display: flex;">
								<input
									style="background-color: #1eb7e9; color: white; border: white;"
									type="datetime-local"
									class="form-control"
									ng-model="activeOffer.to"
									ng-required="true"
									name="to"
								> <span
									style="color: red"
									ng-show="offerForm.to.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
					</div>
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px;"
							ng-show="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
							ng-hide="currentActiveOperation=='edit'"
						>
							<label for="text2">Branchs<br /> <span
								style="font-size: small;"
							>Select one or more branches by click "Ctrl"</span></label> <select
								style="color: white; overflow-y: scroll;"
								class="form-control"
								ng-model="activeOffer.branches"
								multiple
								size="4"
								ng-required="true"
								name="br"
							>
								<option
									style="background-color: white; color: black;"
									disabled
									value=""
								>Please choose</option>
								<option
									style="background-color: white; color: black;"
									ng-repeat="branch in branches"
									ng-selected="branch.id == activeOffer.branch.id"
									value="{{branch.id}}"
									ng-hide="branch.isDeleted==1"
								>{{branch.branchCode }}</option>
							</select> <span
								style="color: red"
								ng-show="offerForm.br.$error.required"
								class="help-block"
							>*</span>
						</div>
					</div>
					<div class="form-group">
						<button
							ng-show="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
							style="margin-right: 2px;"
							ng-click="currentActiveOperation=='add'?submitCreateUpdate(activeOffer):submitUpdate(activeOffer)"
							class="btn btn-primary btn-sm"
							ng-disabled="offerForm.$invalid"
						>{{buttonOperation}}</button>
						<button
							ng-show="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
							style="margin-right: 2px;"
							ng-click="submitCreate(activeOffer,'${sessionScope.ACTIVE_LOGGED_USER.branch.id}')"
							class="btn btn-primary btn-sm"
							ng-disabled="offerForm.$invalid"
						>{{buttonOperation}}</button>
						<button
							id="cancel-form"
							style="float: right; width: 120px; margin-bottom: 20px;"
							value="Cancel"
							ng-click="cancel()"
							class="btn btn-danger btn-sm"
						>Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
