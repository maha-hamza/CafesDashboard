<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%
	if (session.getAttribute("ACTIVE_LOGGED_USER") == null) {
%>
<%
	System.out.println("include login");
%>
<jsp:include page="/static/views/login.jsp" />
<!-- FOOTER -->
<div
	id="footer"
	style="position: absolute; bottom: 0; width: 100%;"
>
	<jsp:include page="/static/views/inclusions/footer.jsp" />
</div>
<%
	} else {
%>
<%
	System.out.println("else");
%>
<div>
	<div class="row">
		<br />
	</div>
	<div>
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
						style="width: 290px; height: 100px; border-radius: 3px; padding-top: 40px;"
					> <span class="fa fa-flag"></span> Statuses
					</a>
					<a
						href="#/roles"
						class="btn btn-warning btn-lg  "
						style="width: 290px; height: 100px; border-radius: 3px; padding-top: 40px;"
					><i class="fa fa-road"></i> Roles</a>
					<a
						href="#/countries"
						class="btn btn-warning btn-lg  "
						style="width: 290px; height: 100px; border-radius: 3px; padding-top: 40px;"
					><i class="fa fa-globe"></i> Countries</a>
					<a
						href="#/cities"
						class="btn btn-warning btn-lg  "
						style="width: 290px; height: 100px; border-radius: 3px; padding-top: 40px;"
					><i class="fa fa-building-o"></i> Cities</a>
					<a
						href="#/offertype"
						class="btn btn-warning btn-lg"
						style="width: 290px; height: 100px; border-radius: 3px; padding-top: 40px; font-size: 14pt;"
					><i class="fa fa-calendar"></i> Offers and Events Type </a>
					<a
						href="#/images"
						class="btn btn-warning btn-lg"
						style="width: 290px; height: 100px; border-radius: 3px; padding-top: 40px;"
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
<%
	}
%>