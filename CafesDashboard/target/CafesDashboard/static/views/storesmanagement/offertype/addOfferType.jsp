<%@ page isELIgnored="false" %> 
<div class="row panel panel-default ">
	<div class="col-lg-10">
		<div class="main-box">
			<header class="main-box-header clearfix">
				<h4 style="font-weight: 600; font-family: sans-serif;">{{subtitle}} Description</h4>
			</header>
			<div class="main-box-body clearfix">
			<div class="form-group" style="display: flex;" >				
				<div class="form-group" style="width:440px;margin-left:20px;">
					<label for="text2">Description</label> <input
						type="text"
						id="text1"
						placeholder="Description"
						class="form-control"
						ng-model="activeOfferType.description"
					>
				</div>
				</div>
				<div class="form-group">
					<button   style="margin-right:2px;margin-bottom:20px;"
						ng-click="submitCreateUpdate(activeOfferType)"
						class="btn btn-primary btn-sm"
					>{{buttonOperation}}</button>
					<button id="cancel-form" style="float:right;width:120px;"
						value="Cancel"
						ng-click="cancel()"
						class="btn btn-danger btn-sm"
					>Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>
