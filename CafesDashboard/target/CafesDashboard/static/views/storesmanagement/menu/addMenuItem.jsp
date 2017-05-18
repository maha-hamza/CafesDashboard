<form
	name="menuForm"
	novalidate
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
							<label for="text2">Category</label> <select
								class="form-control"
								ng-model="activeItem.category"
								ng-required="true"
							>
								<option
									disabled
									value=""
								>Please choose</option>
								<option
									ng-repeat="category in categories"
									ng-selected="category.id == activeItem.category.id"
									value="{{category.id}}"
								>{{category.categoryName }}</option>
							</select>
						</div>
						<div
							class="form-group"
							style="text-align: left; width: 440px;"
						>
							<label for="text2">Type</label> <select
								class="form-control"
								ng-model="activeItem.type"
								ng-required="true"
							>
								<option value="">Please choose</option>
								<option value="Drink">Drink</option>
								<option value="Other">Other</option>
							</select>
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
							<label for="text2">Item name</label> <input
								type="text"
								id="text1"
								placeholder="name"
								class="form-control"
								ng-model="activeItem.itemName"
								ng-required="true"
							>
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
							<label for="text2">Item Price</label> <input
								type="text"
								id="text1"
								placeholder="price"
								class="form-control"
								ng-model="activeItem.itemPrice"
								ng-required="true"
							>
						</div>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Description</label> <input
								type="text"
								id="text1"
								placeholder="Description"
								class="form-control"
								ng-model="activeItem.itemDescription"
								ng-required="true"
							>
						</div>
					</div>
					<div
						class="form-group"
						ng-show="currentActiveOperation=='add'"
					>
						<input
							type="file"
							id="myDESFile"
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
						>* </span> <img
							src="{{activeItem.img}}"
							width="100px"
						/>
					</div>
					<div class="form-group">
						<button
							ng-show="currentActiveOperation=='add'"
							style="margin-right: 2px;"
							ng-click="submitCreateUpdate(activeItem)"
							class="btn btn-primary btn-sm"
							ng-disabled="menuForm.$invalid"
						>{{buttonOperation}}</button>
						<button
							ng-show="currentActiveOperation=='edit'"
							style="margin-right: 2px;"
							ng-click="submitUpdate(activeItem)"
							class="btn btn-primary btn-sm"
							ng-disabled="menuForm.$invalid"
						>{{buttonOperation}}</button>
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
</form>