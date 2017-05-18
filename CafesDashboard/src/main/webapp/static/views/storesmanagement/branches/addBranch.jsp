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
							style="width: 890px; margin-left: 0px;"
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
									ng-change="branchChecker(activeBranch.branchCode)"
									name="bco"
								> <span
									style="color: red"
									ng-show="branchForm.bco.$error.required"
									class="help-block"
								>*</span> <span
									ng-show="showBTick"
									class="help-block"
									ng-class="{ 'has-error': branchForm.bco.$invalid && branchForm.bco.$dirty }"
								>This Code already registered.</span>
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
							style="width: 440px; margin-left: 0px;"
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
									name="lat"
								> <span
									style="color: red"
									ng-show="branchForm.lat.$error.required"
									class="help-block"
								>*</span>
							</div>
						</div>
						<div
							class="form-group"
							style="width: 440px; margin-left: 12px;"
						>
							<label for="text2">Langitude</label>
							<div style="display: flex;">
								<input
									type="text"
									placeholder="langitude"
									class="form-control"
									ng-model="activeBranch.langitude"
									ng-required="true"
									name="langitude"
								> <span
									style="color: red"
									ng-show="branchForm.langitude.$error.required"
									class="help-block"
								>*</span>
							</div>
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
					<div style="display: flex;">
						<textarea
							placeholder="description"
							class="form-control"
							ng-model="activeBranch.description"
							ng-required="true"
							name="desc"
						></textarea>
						<span
							style="color: red"
							ng-show="branchForm.desc.$error.required"
							class="help-block"
						>*</span>
					</div>
				</div>
				<div
					class="form-group"
					style="width: 440px; margin-left: 12px;"
				>
					<label for="text2">Address</label>
					<div style="display: flex;">
						<input
							type="text"
							placeholder="address"
							class="form-control"
							ng-model="activeBranch.address"
							ng-required="true"
							name="address"
						> <span
							style="color: red"
							ng-show="branchForm.address.$error.required"
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
					<label for="text2">Open time</label>
					<div
						class="input-group bootstrap-timepicker"
						style="display: flex"
					>
						<input
							style="background-color: #1eb7e9; color: white; border: white;"
							class="form-control timepicker-default1"
							type="text"
							ng-model="activeBranch.open"
							ng-required="true"
							name="open"
						/> <span
							style="color: red"
							ng-show="branchForm.open.$error.required"
							class="help-block"
						>*</span>
					</div>
				</div>
				<div
					class="form-group"
					style="width: 440px; margin-left: 12px;"
				>
					<label for="text2">Close time</label>
					<div
						class="input-group bootstrap-timepicker"
						style="display: flex;"
					>
						<input
							style="background-color: #1eb7e9; color: white; border: white;"
							class="form-control timepicker-default2"
							type="text"
							ng-model="activeBranch.close"
							ng-required="true"
							name="close"
						/> <span
							style="color: red"
							ng-show="branchForm.close.$error.required"
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
					style="width: 440px;"
				>
					<label for="text2">Country</label>
					<div style="display: flex;">
						<select
							style="background-color: #1eb7e9; color: white; border: white;"
							class="form-control"
							ng-model="activeBranch.country"
							ng-init="fetchAllCountriesWithStatus()"
							ng-change="loadStatesByCID(activeBranch.country)"
							ng-required="true"
							name="country"
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
								ng-hide="country.isDeleted==1"
							>{{country.country }}</option>
						</select> <span
							ng-show="branchForm.country.$error.required"
							style="color: red"
						>*</span>
					</div>
				</div>
				<div
					class="form-group"
					style="width: 440px; margin-left: 12px; nargin-top: 10px;"
				>
					<label for="text2">City</label>
					<div style="display: flex;">
						<select
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
								ng-hide="city.isDeleted==1"
							>{{city.city }}</option>
						</select> <span
							ng-show="branchForm.city.$error.required"
							style="color: red"
						>*</span>
					</div>
				</div>
			</div>
			<!-- _______________________________________________________ -->
			<!-- _______________________________________________________ -->
			<div class="form-group">
				<div class="form-group">
					<label for="text2">Phone</label>
					<table class="table">
						<tr ng-repeat="phone in formData.phones track by $index">
							<td><select
								class="form-control"
								ng-model="phone.type"
								ng-required="true"
							>
									<option
										disabled
										value=""
									>Please choose</option>
									<option value="LandLine">LandLine</option>
									<option value="HotLine">HotLine</option>
									<option value="Mobile">Mobile</option>
							</select></td>
							<td><input
								type="text"
								name="telp"
								ng-model="phone.number"
								class="form-control"
								ng-required="true"
								ng-change="telChecker(phone.number,$index)"								
							></td>
							<td>
								<button
									id="add-ph"
									ng-click="addPhone($index,$index)"
									ng-show="$last"
									class="form-control"
									style="width: 100%"
								>
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</td>
							<td>
								<button
									ng-show="$index!=0"
									ng-click="removePhone($index,$index)"
									id="remove-ph"
									class="form-control"
									style="width: 100%"
								>
									<span class="glyphicon glyphicon-minus"></span>
								</button>
							</td>
							<td><span
								ng-show="showTelTick  && ($index==ind)"
								class="help-block"
								ng-class="{ 'has-error': userForm.telp.$invalid && userForm.telp.$dirty }"
							>Telephone Existed.</span></td>
						</tr>
					</table>
				</div>
			</div>
			<div
				class="form-group"
				style="margin-bottom: 20px;"
			>
				<button
					ng-click="submitCreateUpdate(activeBranch)"
					class="btn btn-primary btn-sm"
					ng-disabled="branchForm.$invalid || showTelTick || showBTick"
				>{{buttonOperation}}</button>
				<button
					id="cancel-form"
					style="float: right; width: 100px; margin-left: 3px; margin-bottom: 30px;"
					value="Cancel"
					ng-click="cancel()"
					class="btn btn-danger btn-sm"
				>Cancel</button>
			</div>
		</form>
	</div>
</div>
<script>
  
    $('.timepicker-default1').timepicker();
    $('.timepicker-default1').on('click', function (){
        $('.timepicker-default1').timepicker('setTime', new Date());
    });
    
    $('.timepicker-default2').timepicker();
    $('.timepicker-default2').on('click', function (){
        $('.timepicker-default2').timepicker('setTime', new Date());
    });
</script>