<%@ page isELIgnored="false"%>
<form
	name="categoryForm"
	novalidate
>
	<div
		id="collapse3"
		class="accordion-body collapse in body"
	>
		<div
			class="dl-horizontal"
			style="text-align: left"
		>
			<h4
				style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;"
			>{{subtitle}}</h4>
		</div>
		<div
			class="form-group"
			style="display: flex;"
		>
			<div
				class="form-group"
				style="text-align: left; width: 440px;"
			>
				<div class="col-lg-11">
					<label
					
						for="text1"
						class="control-label"
					>Category</label>
					<div style="display: flex;">
						<input
							type="text"
							id="text1"
							placeholder="Category name"
							class="form-control"
							ng-model="activeCategory.categoryName"
							ng-required="true"
							name="cat"
						> <span
							style="color: red"
							ng-show="categoryForm.cat.$error.required"
							class="help-block"
						>*</span>
					</div>
				</div>
			</div>
		</div>
		<div
			class="form-actions"
			style="text-align: left; margin-top: -10px;"
		>
			<button
				style="margin-right: 180px;"
				ng-click="submitCreateUpdate(activeCategory)"
				class="btn btn-primary btn-sm"
				ng-disabled="categoryForm.$invalid"
			>{{buttonOperation}}</button>
			<button
				id="cancel-form"
				style="float: right; width: 120px;margin-bottom:15px;"
				value="Cancel"
				ng-click="cancel()"
				class="btn btn-danger btn-sm"
			>Cancel</button>
		</div>
	</div>
</form>