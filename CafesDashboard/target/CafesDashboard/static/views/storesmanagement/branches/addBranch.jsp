<%@ page isELIgnored="false"%>
<div class="row panel panel-default">
	<div class="col-lg-10">
		<form
			name="branchForm"
			novalidate
		>
			<div class="main-box">
				<header class="main-box-header clearfix">
					<h4
						style="font-weight: 600; font-family: sans-serif; color: #1eb7e9;"
					>{{subtitle}}</h4>
				</header>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Branch Code</label>
							<div style="display: flex;">
								<input
									type="text"
									id="text1"
									placeholder="branch code"
									class="form-control"
									ng-model="activeBranch.branchCode"
									ng-required="true"
								>
							</div>
						</div>
					</div>
				</div>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Latitude</label>
							<div style="display: flex;">
								<input
									type="text"
									id="text1"
									placeholder="latitude"
									class="form-control"
									ng-model="activeBranch.latitude"
									ng-required="true"
								>
							</div>
						</div>
					</div>
				</div>
				<div class="main-box-body clearfix">
					<div
						class="form-group"
						style="display: flex;"
					>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Langitude</label>
							<div style="display: flex;">
								<input
									type="text"
									id="text1"
									placeholder="langitude"
									class="form-control"
									ng-model="activeBranch.langitude"
									ng-required="true"
								>
							</div>
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
						<label for="text2">Description</label>
						<textarea
							placeholder="description"
							class="form-control"
							ng-model="activeBranch.description"
							ng-required="true"
						></textarea>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">Address</label> <input
							type="text"
							placeholder="address"
							class="form-control"
							ng-model="activeBranch.address"
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
						<label for="text2">Open time</label>
						<div class="input-group bootstrap-timepicker">
							<input
								class="form-control timepicker-default"
								type="text"
								ng-model="activeBranch.open"
								ng-required="true"
							/>
						</div>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">Close time</label>
						<div class="input-group bootstrap-timepicker">
							<input
								class="form-control timepicker-default"
								type="text"
								ng-model="activeBranch.close"
								ng-required="true"
							/>
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
						<label for="text2">Country</label> <select
							style="background-color: #1eb7e9; color: white; border: white;"
							class="form-control"
							ng-model="activeBranch.country"
							ng-change="loadStatesByCID(activeBranch.country)"
							ng-required="true"
						>
							<option
								style="background-color: white; color: black;"
								disabled
								value=""
							>Please choose</option>
							<option
								style="background-color: white; color: black;"
								ng-repeat="country in allCountries"
								ng-selected="country.id == activeBranch.country.id"
								value="{{country.id}}"
								name="country"
							>{{country.country }}</option>
						</select> <span
							ng-show="branchForm.country.$error.required"
							style="color: red"
						>*</span>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px; nargin-top: 10px;"
					>
						<label for="text2">City</label> <select
							style="background-color: #1eb7e9; color: white; border: white;"
							class="form-control"
							ng-model="activeBranch.city"
							ng-required="true"
							name="city"
						>
							<option
								style="background-color: white; color: black;"
								disabled
								value=""
							>Please choose</option>
							<option
								style="background-color: white; color: black;"
								ng-repeat="city in statez"
								ng-selected="city.id == activeBranch.city.id"
								value="{{city.id}}"
								style="width:440px;margin-left:12px;"
							>{{city.city }}</option>
						</select> <span
							ng-show="branchForm.city.$error.required"
							style="color: red"
						>*</span>
					</div>
				</div>
				<!-- _______________________________________________________ -->
				<!-- _______________________________________________________ -->
				<div class="form-group">
					<label for="text2">Phone</label>
					<!-- _______________________________________________________ -->
					<table>
						<tr ng-repeat="phone in formData.phones track by $index">
							<td><select
								style="width: 150px;"
								class="form-control"
								ng-model="phone.type"
								name="type"
								ng-required="true"
							>
									<option
										disabled
										value=""
									>Please choose</option>
									<option value="LandLine">LandLine</option>
									<option value="HotLine">HotLine</option>
									<option value="Mobile">Mobile</option>
							</select><span
								ng-show="branchForm.type.$error.required"
								style="color: red"
							>*</span></td>
							<td><input
								style="width: 250px; margin-left: 10px;"
								type="text"
								ng-model="phone.number"
								class="form-control"
								ng-required="true"
							></td>
							<td><input
								style="width: 150px; margin-left: 40px; float: right;"
								type="button"
								id="add-ph"
								class="form-control"
								ng-click="addPhone($index,$index)"
								value="Add Phone"
								ng-show="$last"
							></td>
							<td><input
								style="width: 150px; margin-left: 12px;"
								type="button"
								ng-click="removePhone($index,$index)"
								value="Delete Phone"
								ng-show="$last"
								class="form-control"
								id="remove-ph"
							></td>
						</tr>
					</table>
					<!-- _______________________________________________________ -->
				</div>
				<div
					class="form-group"
					style="margin-bottom: 20px;"
				>
					<button
						ng-click="submitCreateUpdate(activeBranch)"
						class="btn btn-primary btn-sm"
						ng-disabled="branchForm.$invalid"
					>{{buttonOperation}}</button>
					<button
						id="cancel-form"
						style="float: right; width: 120px; margin-left: 3px; margin-bottom: 30px;"
						value="Cancel"
						ng-click="cancel()"
						class="btn btn-danger btn-sm"
					>Cancel</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
    $('.timepicker-default').timepicker();
</script>