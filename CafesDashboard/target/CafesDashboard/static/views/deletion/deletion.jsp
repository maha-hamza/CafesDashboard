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
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
		>
			<a
				href="#/users-store-deletion/${sessionScope.ACTIVE_LOGGED_USER.store.uuid}"
				class="btn btn-warning btn-lg  "
				style="width: 25%;"
			>Users</a>
			<a
				href="#/branches-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Branches</a>
			<a
				href="#/store-items-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Items</a>
			<a
				href="#/categories-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Categories</a>
			<a
				href="store-offers-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Offers</a>
			<a
				href="#/offertypes-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Offers Types</a>
		</c:when>
		<c:when
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
		>
			<a
				href="#/users-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%;"
			>Users</a>
			<a
				href="#/guests-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%;"
			>Guests</a>
			<a
				href="#/status-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Status</a>
			<a
				href="#/roles-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Roles</a>
			<a
				href="#/countries-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Countries</a>
			<a
				href="#/cities-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Cities</a>
			<a
				href="/stores-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Stores</a>
			<a
				href="#/branches-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Branches</a>
			<a
				href="#/items-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Items</a>
			<a
				href="#/categories-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Categories</a>
			<a
				href="#/offers-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Offers</a>
			<a
				href="#/offertypes-deletion"
				class="btn btn-warning btn-lg  "
				style="width: 25%; height: 20%"
			>Offers Types</a>
		</c:when>
	</c:choose>
	<a
		href="#/reservations-deletion"
		class="btn btn-warning btn-lg  "
		style="width: 25%; height: 20%"
	>Reservations</a>
</div>