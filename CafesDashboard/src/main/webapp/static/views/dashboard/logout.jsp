
<!DOCTYPE html>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<html>
<head>
<link
	rel="styleshee
	"
	href="<c:url value='/static/assets/css/error.css'/>
"
/>
</head>
<body>
	<!-- PAGE CONTENT -->
	<div class="container">
		<div class="col-lg-4 col-lg-offset-2 text-center">
			<div class="logo">
				<h1>Leaving !</h1>
			</div>
			<p class="lead text-muted">Are you sure you wanna logout right
				now!</p>
			<div class="clearfix"></div>
			<div class="clearfix">
				<img
					alt="error"
					width="300px"
					class="img-responsive"
					src="<c:url value="/static/assets/img/logout.png"/>"
				>
			</div>
			<br /> <a
				href="#/redirect"
				class="btn btn-info"
			>Logout</a> <a
				href="#/dashboard"
				class="btn btn-danger"
			>Cancel</a>
		</div>
	</div>
	<!-- END PAGE CONTENT -->
</body>
<!-- END BODY -->
</html>
