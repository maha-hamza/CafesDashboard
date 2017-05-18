<%@ page isELIgnored="false" %> 
<%@page import="com.websystique.springmvc.pojos.User"%>
<%@ page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib
	prefix="spring"
	uri="http://www.springframework.org/tags"
%>
<!DOCTYPE html>
<html
	lang="en"
	ng-app="App"
>
<head>
<link
	rel="shortcut icon"
	href="<c:url value='/static/assets/img/logo-2.png' />"
	type="image/x-icon"
>
<meta charset="UTF-8" />
<title>It's grind Admin Dashboard</title>
<meta
	content="width=device-width, initial-scale=1.0"
	name="viewport"
/>
<meta
	content=""
	name="description"
/>
<meta
	content=""
	name="author"
/>
<jsp:include page="/static/views/inclusions/context.jsp" />
<jsp:include page="/static/views/inclusions/headersinclusions.jsp" />
</head>
<!-- END  HEAD-->
<!-- BEGIN BODY-->
<body class="padTop53 ">
	<%
		if (session.getAttribute("ACTIVE_LOGGED_USER") == null) {
	%>
	<jsp:include page="/static/views/login.jsp" />
	<%
		} else {
	%>
	<!-- MAIN WRAPPER -->
	<div id="wrap">
		<!-- HEADER SECTION -->
		<div id="top">
			<nav
				class="navbar navbar-inverse navbar-fixed-top "
				style="padding-top: 10px;"
			>
				<a
					data-original-title="Show/Hide Menu"
					data-placement="bottom"
					data-tooltip="tooltip"
					class="accordion-toggle btn btn-primary btn-sm visible-xs"
					data-toggle="collapse"
					href="#menu"
					id="menu-toggle"
				> <i class="icon-align-justify"></i>
				</a>
				<!-- LOGO SECTION -->
				<header class="navbar-header">
					<a
						href="#/dashboard"
						class="navbar-brand"
					> <img
						src="<c:url value='/static/assets/img/logogrind-2.png' />"
						height="50"
						width="221"
						alt=""
					style="margin-left: -60px;margin-top: -9px;"/></a>
				</header>
				<!-- END LOGO SECTION -->
				<ul class="nav navbar-top-links navbar-right" >
					<!--ADMIN SETTINGS SECTIONS -->
					<li class="dropdown"  id="my_dropdown"  ><a
						class="dropdown-toggle"
						data-toggle="dropdown"
					> <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down "></i>
					</a>
						<ul class="dropdown-menu dropdown-user" >
							<li><a
								href=""
								ng-controller="UsersController"
								ng-click="logout()"
							><i class="icon-signout" style="color:#1eb7e9;background-color:#fff;"></i> Logout </a></li>
						</ul></li>
					<!--END ADMIN SETTINGS -->
				</ul>
			</nav>
		</div>
		<!-- END HEADER SECTION -->
		<!-- MENU SECTION -->
		<div id="left">
			<div class="media user-media well-small" >
				<a
					class="user-link"
					href="#"
				> <img
					class="media-object img-thumbnail user-img img-circle"
					gravatar-src-once="'<%=((User) request.getSession().getAttribute("ACTIVE_LOGGED_USER")).getEmail()%>'"
					src="<c:url value='/static/assets/img/User-img.png' />"
					>
<%-- 					gravatar-src-once="'<%=((User) request.getSession().getAttribute("ACTIVE_LOGGED_USER")).getEmail()%>'" --%>
<!-- 					gravatar-size="90" -->
				
				</a> <br />
				<div class="media-body">
					<h5 class="media-heading" style="font-size: small;">
						<%
							User user = ((User) request.getSession().getAttribute("ACTIVE_LOGGED_USER"));
								String name = Character.toUpperCase(user.getFName().charAt(0)) + user.getFName().substring(1) + " "
										+ Character.toUpperCase(user.getLName().charAt(0)) + user.getLName().substring(1);
						%>
						<%=name%>
					</h5>
					<ul class="list-unstyled user-info">
						<li><a
							class="btn btn-success btn-xs btn-circle"
							style="width: 10px; height: 12px;"
						></a> Online</li>
					</ul>
				</div>
				<br />
			</div>
			<ul
				id="menu"
				class="collapse"
			>
				<jsp:include page="/static/views/inclusions/leftmenu.jsp" />
			</ul>
		</div>
		<!--END MENU SECTION -->
		<!--PAGE CONTENT -->
		<div id="content">
			<jsp:include page="/static/views/inclusions/body.jsp" />
		</div>
		<!--END PAGE CONTENT -->
	</div>
	<%
		}
	%>
	<!--END MAIN WRAPPER -->
	<!-- FOOTER -->
	<div
		id="footer"
		style="position: fixed; bottom: 0; width: 100%;"
	>
		<jsp:include page="/static/views/inclusions/footer.jsp" />
	</div>
	<!--END FOOTER -->
	<!-- GLOBAL SCRIPTS -->
	<jsp:include page="/static/views/inclusions/footerinclusion.jsp" />
	<!-- END GLOBAL SCRIPTS -->
</body>
<!-- END BODY-->
</html>
