<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<html lang="en">
<head>
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
<body style="height: 85%">
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
					<input
						type="email"
						placeholder="Email"
						class="form-control"
						ng-model="activeUser.email"
						name="email"
						ng-required="true"
					/> <span
						ng-show="userForm.email.$invalid && !userForm.email.$pristine && userForm.email.$error.required"
						class="help-block"
					>You email is required.</span> <span
						ng-show="(userForm.email.$touched && userForm.email.$invalid) && userForm.$error.email"
						class="help-block"
					>You email is invalid.</span> <input
						type="password"
						placeholder="Password"
						class="form-control"
						ng-model="activeUser.password"
						name="password"
						required
					/> <span
						ng-show="userForm.password.$invalid && !userForm.password.$pristine"
						class="help-block"
					>You Password is required.</span>
					<button
						class="btn text-muted text-center btn-danger"
						id="submit_btn"
						ng-click="login(activeUser)"
						ng-disabled="userForm.$invalid"
					>Sign In</button>
					<!-- ------------notification------------ -->
					<div
						class="alert alert-warning alert-dismissable"
						style="opacity: 0.5"
						ng-show="loginmsg.length !=0"
					>
						<button
							type="button"
							class="close"
							data-dismiss="alert"
							aria-hidden="true"
						>×</button>
						{{loginmsg}}
					</div>
					<!-- ------------------------------ -->
				</form>
			</div>
			<div
				id="forgot"
				class="tab-pane"
			></div>
			<div
				id="signup"
				class="tab-pane"
			></div>
		</div>
		<div
			class="text-center"
			style="width: 330px; margin-top: -6px;"
		></div>
	</div>
</body>
</html>
