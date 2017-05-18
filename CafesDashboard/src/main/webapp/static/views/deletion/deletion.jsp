<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<div
	class="body collapse in"
	id="div9"
>
	<div class="row">
		<br />
		<div class="col-lg-12">
			<h3>
				<a
					href="#/deletion"
					style="cursor: pointer;"
				>Deleted Data</a>
			</h3><hr />
		</div>
		
	</div>
	<br />
	<div
			class="panel-body"
			style="background-color: #fff;"
		>
	<c:choose>
		<c:when
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
		>
			<a
				href="#/users-store-deletion/${sessionScope.ACTIVE_LOGGED_USER.branch.store.uuid}"
				class="btn btn-warning btn-lg  "
				style="width: 25%;"
			>Users</a>
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
			>Offers and Events</a>
		</c:when>
		<c:when
			test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
		>
			<a
				href="#/users-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
			><i class="fa fa-user"></i>  Users</a>
			<a
				href="#/countries-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
			><i class="fa fa-globe"></i> Countries</a>
			<a
				href="#/cities-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
			><i class="fa fa-building-o"></i> Cities</a>
			<a
				href="#/branches-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
			> <i class="fa fa-sitemap" ></i> Branches</a>
			<a
				href="#/items-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
			>  <span class="fa fa-th-large"></span> Items</a>
			<a
				href="#/categories-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
			>  <span class="fa fa-th"></span> Categories</a>
			<a
				href="#/offers-deletion"
				class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;font-size: 14pt;"
			> <i class="fa fa-calendar"></i> Offers and Events</a>
		</c:when>
	</c:choose>
	<a
		href="#/reservations-deletion"
		class="btn btn-warning btn-lg  "
					style="width: 233px; height: 90px; border-radius: 3px; padding-top: 30px;"
	><i class="fa fa-check-square-o" ></i> Reservations</a>
</div>
</div>