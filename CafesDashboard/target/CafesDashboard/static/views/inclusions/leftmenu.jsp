<%@ page isELIgnored="false"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<li class="panel"><a href="#/dashboard"> <i class="icon-table"></i>
		Dashboard
</a></li>
<!-- ______________________________________ -->
<li class="panel "><a
	data-parent="#menu"
	data-toggle="collapse"
	class="accordion-toggle"
	data-target="#component-nav"
> <i class="glyphicon glyphicon-user"> </i> Users Management <span
		class="pull-right"
	> <i class="icon-angle-right"></i>
	</span> &nbsp;
</a>
	<ul
		class="collapse"
		id="component-nav"
	>
		<c:choose>
			<c:when
				test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
			>
				<li class=""><a href="#/branch-guests"><i
						class="fa fa-user"
					></i>Guests </a></li>
			</c:when>
			<c:when
				test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
			>
				<li class=""><a href="#/users"><i class="fa fa-user"></i>
						Store Members </a></li>
				<li class=""><a href="#/guests"><i class="fa fa-user"></i>
						Guests </a></li>
				<li class=""><a href="#/settings"><i class="fa fa-user"></i>
						Settings </a></li>
			</c:when>
		</c:choose>
	</ul></li>
<!-- ______________________________________ -->
<li class="panel "><a
	data-parent="#menu"
	data-toggle="collapse"
	class="accordion-toggle collapsed"
	data-target="#form-nav"
> <i class="glyphicon glyphicon-cutlery"></i> Stores Management <span
		class="pull-right"
	> <i class="icon-angle-right"></i>
	</span> &nbsp;
</a>
	<ul
		class="collapse"
		id="form-nav"
	>
		<c:choose>
			<c:when
				test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}"
			>
			<li class=""><a href="#/branchdetails/${sessionScope.ACTIVE_LOGGED_USER.branch.uuid }"><i class="icon-angle-right"></i>${sessionScope.ACTIVE_LOGGED_USER.branch.branchCode} Details</a></li>
			<li class=""><a href="#/categories"><i class="icon-angle-right"></i>Categories</a></li>
			<li class=""><a href="#/menus"><i class="icon-angle-right"></i>Menus Items</a></li>
			</c:when>
			<c:when
				test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}"
			>
				<li class=""><a href="#/store"><i class="icon-angle-right"></i> Store</a></li>
				<li class=""><a href="#/branches"><i class="icon-angle-right"></i> Branches </a></li>
				<li class=""><a href="#/categories"><i class="icon-angle-right"></i>Categories</a></li>
				<li class=""><a href="#/menus"><i class="icon-angle-right"></i>Menus Items</a></li>
			</c:when>
		</c:choose>
	
		<c:choose>
			<c:when test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'BRANCH_ADMIN'}">
				<li class=""><a href="#/storeAdminOffers/${sessionScope.ACTIVE_LOGGED_USER.branch.store.uuid }"><i class="icon-angle-right"></i> Offers </a></li>
				<li class=""><a href="#/storeAdminOffers/${sessionScope.ACTIVE_LOGGED_USER.branch.store.uuid }"><i class="icon-angle-right"></i> Events </a></li>
			</c:when>
			<c:when test="${sessionScope.ACTIVE_LOGGED_USER.role.roleName == 'GENERAL_ADMIN'}">
				<li class=""><a href="#/offers"><i class="icon-angle-right"></i> Offers </a></li>
				<li class=""><a href="#/offers"><i class="icon-angle-right"></i> Events </a></li>
				<li class=""><a href="#/offertype"><i class="icon-angle-right"></i> Offers Type </a></li>
			</c:when>
		</c:choose>
		
	</ul></li>
<!-- ______________________________________ -->
<li class="panel"><a
	data-parent="#menu"
	data-toggle="collapse"
	class="accordion-toggle"
	data-target="#pagesr-nav"
> <i
		class="fa fa-users"
		aria-hidden="true"
	></i> Guests Management <span class="pull-right"> <i
			class="icon-angle-right"
		></i>
	</span> &nbsp;
</a>
	<ul
		class="collapse"
		id="pagesr-nav"
	>
		<li><a href="#/orders"><i class="fa fa-shopping-cart"></i>
				Orders </a></li>
		<li><a href="#/reservation"><i class="fa fa-ticket"></i>
				Reservations </a></li>
	</ul></li>
<!-- ______________________________________________________________ -->
<li class="panel"><a
	data-parent="#menu"
	data-toggle="collapse"
	class="accordion-toggle"
	data-target="#del-nav"
	href="#/deletion"
> <i
		class="fa fa-remove"
		aria-hidden="true"
	></i> Deleted Data <span class="pull-right"> </span> &nbsp;
</a></li>
<!-- ________________________________________________ -->
<li><a
	href=""
	ng-controller="UsersController"
	ng-click="logout()"
><i class="icon-signin"></i> Logout </a></li>
