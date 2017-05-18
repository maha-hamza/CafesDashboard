<%@ page isELIgnored="false"%>
<%@taglib
	uri="http://www.springframework.org/tags"
	prefix="spring"
%>
<!DOCTYPE html>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<html lang="en">
<head>
<link href="src/main/webapp/static/assets/css/login.css" />
<meta charset="UTF-8" />
<title>It's grind Admin Dashboard | Login Page</title>
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
<link
	rel="stylesheet"
	href="<c:url value='/static/assets/css/login.css' />"
/>
<link
	rel="stylesheet"
	href="<c:url value='/static/assets/plugins/magic/magic.css' />"
/>
</head>
<body
	style="height: 85%"
	ng-init="disabled()"
	ng-controller="UsersController"
>
	<!-- PAGE CONTENT -->
	<div class="container">
		<div
			class="text-center"
			id="logo-img"
		>
			<img
				src="<c:url value='/static/assets/img/logo-22.png' />"
				id="logoimg"
				alt="Logo"
			/>
		</div>
		<div
			ng-controller="UsersController"
			class="tab-content"
			style="border-color: transparent;"
		>
			<div
				id="login"
				class="tab-pane active"
			>
				<form
					class="form-signin"
					name="userForm"
					novalidate
				>
					<p class="text-muted text-center btn-block btn ">Enter your
						Email and password</p>
					<div style="display: flex">
						<input
							type="email"
							placeholder="Email"
							class="form-control"
							ng-model="activeUser.email"
							name="email"
							ng-required="true"
							ng-blur="emailchecker(activeUser.email);getUserByStatus(activeUser.email)"
						/>
					</div>
					<span
						ng-show="userForm.email.$invalid && !userForm.email.$pristine && userForm.email.$error.required"
						class="help-block"
						ng-bind-html="userFormRequiredFormError"
					></span> <span
						ng-show="(userForm.email.$touched && userForm.email.$invalid) && userForm.$error.email"
						class="help-block"
						ng-bind-html="userFormInvalidFormError"
					> </span> <span
						ng-show="activeUser.email.length>0 && stat"
						class="help-block"
						ng-bind-html="inactiveUserError"
					> </span> <input
						type="password"
						placeholder="Password"
						class="form-control"
						ng-model="activeUser.password"
						name="password"
						required
					/> <span
						ng-show="userForm.password.$invalid && !userForm.password.$pristine"
						class="help-block"
						ng-bind-html="userFormPasswordRequiredFormError"
					></span>
					<button
						class="btn text-muted text-center btn-danger"
						id="submit_btn"
						ng-click="login(activeUser)"
						ng-disabled="userForm.$invalid || stat"
						style="display: block; left: -60px; width: 100%;"
					>
						<spring:message code="LOGIN_USER_SIGNIN"></spring:message>
					</button>
					<div
						class="fa fa-spinner fa-spin"
						ng-show="showLoader"
						style="font-size: 50px; color: gray; align-items: center; display: flex; justify-content: center;"
					></div>
					<!-- ------------notification------------ -->
					<div ng-bind-html="loginmsg"></div>
					<!-- ------------------------------ -->
				</form>
			</div>
		</div>
	</div>
</body>
</html>
