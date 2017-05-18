<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
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
				style="width: 40%; height: 40%;" 
			>Statuses</a>
			<a
				href="#/roles"
				class="btn btn-warning btn-lg  "
				style="width: 40%; height: 40%"
			>Roles</a>
			<a
				href="#/countries"
				class="btn btn-warning btn-lg  "
				style="width: 40%; height: 40%"
			>Countries</a>
			<a
				href="#/cities"
				class="btn btn-warning btn-lg  "
				style="width: 40%; height: 40%"
			>Cities</a>
		</c:when>
	</c:choose>
</div>