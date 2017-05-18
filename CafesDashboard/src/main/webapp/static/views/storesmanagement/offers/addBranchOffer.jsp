<%@ page isELIgnored="false"%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 150px"
></div>

<div
	class="row panel panel-default"
	ng-hide="showLoader"
>
	<div class="col-lg-10">
		<div class="main-box">
			<header class="main-box-header clearfix">
				<h4 style="font-weight: 600; font-family: sans-serif;">{{subtitle}}</h4>
			</header>
			<form
				name="boffer"
				novalidate
			>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px;"
							ng-hide="currentActiveOperation=='edit'"
						>
							<label for="text2">OfferType</label>
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
									ng-show="boffer.type.$error.required "
									style="color: red"
									class="ng-hide"
								>* </span>
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
									ng-show="boffer.desc.$error.required "
									style="color: red"
									class="ng-hide"
								>* </span>
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
									ng-show="boffer.from.$error.required "
									style="color: red"
									class="ng-hide"
								>* </span>
							</div>
						</div>
						<div
							class="form-group"
							style="width: 44%; margin-left: 10px;"
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
									ng-show="boffer.to.$error.required "
									style="color: red"
									class="ng-hide"
								>* </span>
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
									ng-show="boffer.title.$error.required "
									style="color: red"
									class="ng-hide"
								>* </span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div style="display: flex;">
							<input
								type="file"
								id="branchAdminOfferImgFile"
								style="width: 50%; margin-left: 0px; background-color: #eab123; border: #eab123;"
								name="file"
								ng-model="file"
								class="form-control"
								accept="image/*"
								valid-file
								ng-required="true"
							/> <span
								ng-show="boffer.file.$error.required "
								style="color: red"
								class="ng-hide"
							>* </span>
						</div>
					</div>
					<div class="form-group">
						<button
							style="margin-right: 2px;"
							ng-click="submitCreateFORADMIN(activeOffer,${sessionScope.ACTIVE_LOGGED_USER.branch.id})"
							class="btn btn-primary btn-sm"
							ng-disabled="boffer.$invalid"
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
