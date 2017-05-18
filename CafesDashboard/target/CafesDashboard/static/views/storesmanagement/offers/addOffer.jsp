<%@ page isELIgnored="false"%>
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
						style="width: 440px;"
					>
						<label for="text2">OfferType</label> <select
							style="background-color: #730419; color: white; border: white;"
							class="form-control"
							ng-model="activeOffer.offerType"
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
						</select>
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
							ng-model="activeOffer.description"
						>
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
						<label for="text2">Branch</label> <select
							class="form-control"
							ng-model="activeOffer.branches"
							multiple
							size="3"
						>
							<option
								style="background-color: white; color: black;"
								disabled
								value=""
							>Please choose</option>
							<option
								style="background-color: white; color: black;"
								ng-repeat="branch in branches"
								ng-selected="branch.id == activeOffer.branch.id"
								value="{{branch.id}}"
							>{{branch.branchCode }}</option>
						</select>
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
						<label for="text2">From</label> <input
							style="background-color: #1eb7e9; color: white; border: white;"
							type="datetime-local"
							class="form-control"
							ng-model="activeOffer.from"
						>
					</div>
					<div
						class="form-group"
						style="width: 440px; margin-left: 12px;"
					>
						<label for="text2">To</label> <input
							style="background-color: #1eb7e9; color: white; border: white;"
							type="datetime-local"
							class="form-control"
							ng-model="activeOffer.to"
						>
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
						<label for="text2">Title</label> <input
							style="background-color: #1eb7e9; color: white; border: white;"
							type="text"
							class="form-control"
							ng-model="activeOffer.title"
						>
					</div>
				</div>
				<div
					class="form-group"
					ng-show="currentActiveOperation=='add'"
				>
					<input
						type="file"
						id="myDESFile3"
						style="width: 50%; margin-left: 1em;"
						name="file"
						ng-model="file"
						class="form-control"
						accept="image/*"
						valid-file
						ng-required="currentActiveOperation=='add'"
					/> <img
						src="{{activeItem.img}}"
						width="100px"
					/>
				</div>
				<div class="form-group">
					<button
						style="margin-right: 2px;"
						ng-click="submitCreateUpdate(activeOffer)"
						class="btn btn-primary btn-sm"
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
		</div>
	</div>
</div>
