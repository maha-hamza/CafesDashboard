<%@ page isELIgnored="false"%>
<div
	class="fa fa-spinner fa-spin"
	ng-show="showLoader"
	style="font-size: 200px; color: gray; align-items: center; display: flex; justify-content: center;"
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
		name="braFor"
		novalidate
	>
		<div
			class="form-group"
			style="display: flex;"
		>
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
					placeholder="description"
					class="form-control"
					ng-model="activeBran.description"
					ng-required="true"
					name="desc"					
				> <span
					style="color: red"
					ng-show="braFor.desc.$error.required"
					class="help-block"
				>*</span>
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
				id="BRANCHDESFile"
				style="width: 50%; margin-left: 1em;"
				name="file"
				ng-model="file"
				class="form-control"
				accept="image/*"
				valid-file
				ng-required="true"
			/> <span
				ng-show="braFor.file.$error.required "
				style="color: red"
				class="ng-hide"
			>* </span>
		</div>
		<div
			class="form-actions"
			style="text-align: left; margin-right: 66px;"
		>
			<button
				ng-click="BranchImgUpload(activeBran)"
				class="btn btn-primary btn-sm"
				ng-disabled="braFor.$invalid"
			>Upload</button>
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