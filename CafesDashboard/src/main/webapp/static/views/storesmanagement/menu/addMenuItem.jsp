
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 150px"
></div>
<form
	name="menuForm"
	novalidate
	ng-hide="showLoader"
>
	<div class="row panel panel-default ">
		<div class="col-lg-10">
			<div class="main-box">
				<header class="main-box-header clearfix">
					<h4 style="font-weight: 600; font-family: sans-serif;">{{subtitle}}</h4>
				</header>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="text-align: left; width: 440px;"
						>
							<label for="text2">Category</label>
							<div style="display: flex;">
								<select
									style="background-color: #eab123; color: white; border: white;"
									class="form-control"
									ng-model="activeItem.category"
									ng-required="true"
									name="category"
								>
									<option
										disabled
										value=""
									>Please choose</option>
									<option
										ng-repeat="category in categories"
										ng-selected="category.id == activeItem.category.id"
										value="{{category.id}}"
										ng-hide="category.isDeleted==1"
									>{{category.categoryName }}</option>
								</select> <span
									style="color: red"
									ng-show="menuForm.category.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
						<div
							class="form-group"
							style="text-align: left; width: 440px; margin-left: 12px;"
						>
							<label for="text2">Type</label>
							<div style="display: flex;">
								<select
									style="background-color: #eab123; color: white; border: white;"
									class="form-control"
									ng-model="activeItem.type"
									ng-required="true"
									name="type"
								>
									<option value="">Please choose</option>
									<option value="Drink">Drink</option>
									<option value="Other">Other</option>
								</select> <span
									style="color: red"
									ng-show="menuForm.type.$error.required"
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
							style="text-align: left; width: 440px;"
						>
							<label for="text2">Item name</label>
							<div style="display: flex;">
								<input
									type="text"
									id="text1"
									placeholder="name"
									class="form-control"
									ng-model="activeItem.itemName"
									ng-required="true"
									name="name"
								> <span
									style="color: red"
									ng-show="menuForm.name.$error.required"
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
							style="text-align: left; width: 440px;"
						>
							<label for="text2">Item Price</label>
							<div style="display: flex;">
								<input
									type="number"
									id="text1"
									placeholder="price"
									class="form-control"
									ng-model="activeItem.itemPrice"
									ng-required="true"
									name="price"
								> <span
									style="color: red"
									ng-show="menuForm.price.$error.required"
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
									ng-model="activeItem.itemDescription"
									ng-required="true"
									name="menudesc"
								> <span
									style="color: red"
									ng-show="menuForm.menudesc.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
					</div>
					<div
						class="form-group"
						ng-show="currentActiveOperation=='add'"
					>
						<input
							style="background-color: #eab123; color: white; border: white;"
							type="file"
							id="myDESFile"
							style="width: 440px; margin-left: 0px;"
							name="file"
							ng-model="file"
							class="form-control"
							accept="image/*"
							valid-file
							ng-required="currentActiveOperation=='add'"
						/> <span
							ng-show="menuForm.file.$error.required "
							style="color: red"
							class="ng-hide"
						>* </span>
					</div>
					<div
						class="form-group"
						style="padding-bottom: 8px;"
					>
						<button
							ng-show="currentActiveOperation=='add'"
							style="margin-right: 2px;"
							ng-click="submitCreateUpdate(activeItem)"
							class="btn btn-primary btn-sm"
							ng-disabled="menuForm.$invalid"
						>{{buttonOperation}}</button>
						<button
							ng-show="currentActiveOperation=='edit'"
							style="margin-right: 2px; margin-bottom: 10px;"
							ng-click="submitUpdate(activeItem)"
							class="btn btn-primary btn-sm"
							ng-disabled="menuForm.$invalid"
						>{{buttonOperation}}</button>
						<button
							id="cancel-form"
							style="float: right; width: 120px; margin-bottom: 10px;"
							value="Cancel"
							ng-click="cancel()"
							class="btn btn-danger btn-sm"
						>Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>