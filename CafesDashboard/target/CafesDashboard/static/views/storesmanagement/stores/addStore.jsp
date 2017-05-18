<%@ page isELIgnored="false"%>
<div
	id="collapse3"
	class="accordion-body collapse in body"
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
				class="form-group"
				style="width: 440px;"
			>
				<label
					for="text1"
					class="control-label col-lg-1"
				>Store</label>
				<div
					class="col-lg-11"
					style="text-align: left; width: 440px;"
				>
					<input
						type="text"
						id="text1"
						placeholder="Store name"
						class="form-control"
						ng-model="activeStore.storeName"
						ng-required="true"
					>
				</div>
			</div>
			<div
				class="col-lg-11"
				style="width: 440px; margin-left: 12px; margin-top: 0px;"
			>
				<label
					for="text1"
					style="margin-left: -15px;"
					class="control-label col-lg-1"
				>Description</label> <input
					type="text"
					id="text2"
					placeholder="Store description"
					class="form-control"
					ng-model="activeStore.description"
					ng-required="true"
				>
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
				style="width: 50%; margin-left: 1em;"
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