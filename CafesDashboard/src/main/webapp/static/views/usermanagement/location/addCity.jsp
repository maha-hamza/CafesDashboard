<%@ page isELIgnored="false"%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 150px"
></div>
<div
	id="collapse3"
	class="accordion-body collapse in body"
	ng-hide="showLoader"
>
	<div
		class="dl-horizontal"
		style="text-align: left"
	>
		<h4 style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;">{{subtitle}}</h4>
	</div>
	<form
		class="form-signin"
		name="cityForm"
		novalidate
	>
		<div
			class="form-group"
			style="display: flex;"
		>
			<div
				class="form-group"
				style="width: 440px; text-align: left;"
			>
				<label
					style="margin-top: 5px; margin-right: 41px;"
					for="text1"
					class="control-label col-lg-1"
				>City</label>
				<div class="col-lg-11">
					<input
						type="text"
						id="text1"
						placeholder="city"
						class="form-control"
						ng-model="activeCity.city"
						ng-required="true"
					>
				</div>
			</div>
			<div
				class="form-group"
				style="width: 440px; float: right; margin-left: 12px;"
			>
				<label
					style="margin-top: 5px; margin-right: 41px;"
					for="text1"
					class="control-label col-lg-1"
				>Country</label>
				<div class="col-lg-11">
					<select
						style="background-color: #1eb7e9; color: white; border: white;"
						class="form-control"
						ng-model="activeCity.country"
						ng-required="true"
						name="n"
					>
						<option
							style="background-color: white; color: black;"
							disabled
							value=""
						>Please choose</option>
						<option
							style="background-color: white; color: black;"
							ng-repeat="country in countries"
							ng-selected="country.id == activeCity.country.id"
							value="{{country.id}}"
							ng-hide="country.isDeleted==1"
						>{{country.country }}</option>
					</select> <span
						ng-show="cityForm.n.$error.required"
						style="color: red"
					>*</span>
				</div>
			</div>
		</div>
		<div
			class="form-group"
			style="text-align: left"
		>
			<br />
		</div>
		<div
			class="form-actions"
			style="text-align: left; margin-top: -20px; margin-right: 200px;"
		>
			<button
				ng-click="submitCityCreateUpdate(activeCity)"
				class="btn btn-primary btn-sm"
				ng-disabled="cityForm.$invalid"
			>{{buttonOperation}}</button>
			<button
				id="cancel-form"
				value="Cancel"
				ng-click="cancel()"
				class="btn btn-danger btn-sm"
			>Cancel</button>
		</div>
	</form>
</div>
