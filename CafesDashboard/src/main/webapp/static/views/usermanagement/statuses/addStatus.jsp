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
		name="statusForm"
		novalidate
	>
		<div
			class="form-group"
			style="text-align: left"
		>
			<label
				for="text1"
				class="control-label col-lg-1"
			>Status</label>
			<div class="col-lg-11">
				<input
					type="text"
					id="text1"
					placeholder="Status"
					class="form-control"
					ng-model="activeStatus.status"
					ng-required="true"
				>
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
			style="text-align: left;"
		><br /></div>
		<div
			class="form-actions"
			style="text-align: left;"
		>
			<button
				ng-click="submitCreateUpdate(activeStatus)"
				class="btn btn-primary btn-sm"
				ng-disabled="statusForm.$invalid"
			>{{buttonOperation}}</button>
			<button
				value="Cancel"
				ng-click="cancel()"
				id="cancel-form"
				class="btn btn-danger btn-sm"
			>Cancel</button>
		</div>
	</form>
</div>