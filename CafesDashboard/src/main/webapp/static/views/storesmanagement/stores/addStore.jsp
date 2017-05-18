<%@ page isELIgnored="false"%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center; margin-top: 20px"
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
		name="storeForm"
		novalidate
	>
		<div
			class="form-group"
			style="display: flex;"
		>
			<div
				class="col-lg-11"
				style="width: 440px; margin-left: 0px; margin-top: 0px;"
			>
				<label
					for="text1"
					style="margin-left: -15px;"
					class="control-label col-lg-1"
				>Description</label>
				<textarea
					rows="15"
					id="text2"
					placeholder="Store description"
					class="form-control"
					ng-model="activeStore.description"
					ng-required="true"
					name="desc"
				></textarea>
				<span
					ng-show="storeForm.desc.$error.required "
					style="color: red"
					class="ng-hide"
				>* </span>
			</div>
			<div
				class="form-group"
				style="text-align: left"
			>
				<br />
			</div>
		</div>
		<div class="form-group">
			<input
				type="file"
				id="myDESFile"
				style="width: 43%; margin-left: 1em; background-color: #eab123;"
				name="file"
				ng-model="file"
				class="form-control"
				accept="image/*"
				valid-file
				ng-required="true"
			/> <span
				ng-show="storeForm.file.$error.required "
				style="color: red"
				class="ng-hide"
			>* </span>
		</div>
		<div
			class="form-actions"
			style="text-align: left; margin-right: 66px;"
		>
			<button
				ng-click="submitCreateUpdate(activeStore)"
				class="btn btn-primary btn-sm"
				ng-disabled="storeForm.$invalid"
			>{{buttonOperation}}</button>
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