<!DOCTYPE html>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<head>

<link
	rel="styleshee
	" href="<c:url value='/static/assets/css/error.css'/>
" />
</head>
<body>
	<!-- PAGE CONTENT -->
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2 text-center">
			<div class="logo">
				<h1>Error Occured !</h1>
			</div>
			<p class="lead text-muted">Oops, an error has occurred.
				Forbidden!</p>
			<div class="clearfix"></div>
			<div class="clearfix"><img alt="error" src="<c:url value="/static/assets/img/error.png"/>"></div>
			<br />
		</div>
	</div>
	<!-- END PAGE CONTENT -->
</body>
<!-- END BODY -->
</html>
