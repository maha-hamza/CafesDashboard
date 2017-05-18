<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<div

>
	<div class="row">
		<br />
		<div class="col-lg-12">
			<h3>
				<a
					href="#/settings"
					style="cursor: pointer;"
				>Settings</a>
			</h3>
			<hr />
		</div>
	</div>
	<div
			class="panel-body"
			style="background-color: #fff;"
		>
	<div
		class="body collapse in"
		id="div9"
	>
		<br />
		<c:choose>
			<c:when
				test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
			>
				<a
					href="#/statuses"
					class="btn btn-warning btn-lg  "
					style="width: 266px; height: 90px; border-radius: 3px; padding-top: 30px;"
				> <span class="fa fa-flag"></span> Statuses
				</a>
				<a
					href="#/roles"
					class="btn btn-warning btn-lg  "
					style="width: 266px; height: 90px; border-radius: 3px; padding-top: 30px;"
				><i class="fa fa-road"></i> Roles</a>
				<a
					href="#/countries"
					class="btn btn-warning btn-lg  "
					style="width: 266px; height: 90px; border-radius: 3px; padding-top: 30px;"
				><i class="fa fa-globe"></i> Countries</a>
				<a
					href="#/cities"
					class="btn btn-warning btn-lg  "
					style="width: 266px; height: 90px; border-radius: 3px; padding-top: 30px;"
				><i class="fa fa-building-o"></i> Cities</a>
				<a
					href="#/offertype"
					class="btn btn-warning btn-lg"
					style="width: 266px; height: 90px; border-radius: 3px; padding-top: 30px; font-size: 14pt;"
				><i class="fa fa-calendar"></i> Offers and Events Type </a>
				<a
					href="#/images"
					class="btn btn-warning btn-lg"
					style="width: 266px; height: 90px; border-radius: 3px; padding-top: 30px;"
				> <i class="fa fa-image"></i> Images
				</a>
			</c:when>
			<c:otherwise>
				<div
					id="clickSettingsForm"
					emd-redirect-to="dashboard"
				>
					<a
						id="clickSettingsFormAnchor"
						href="#/dashboard"
					></a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</div>
<script>
    $(document).ready(
            function () {
                $("#clickSettingsForm").find('#clickSettingsFormAnchor')
                        .trigger('click');
            });
</script>