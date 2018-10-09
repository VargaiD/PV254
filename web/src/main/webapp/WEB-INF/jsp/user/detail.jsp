<%--
  User: Stefan Matta
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" trimDirectiveWhitespaces="false" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!-- If User exists -->
<c:if test="${user != null}">

    <t:page title="${user.name}" activeNavbarItem="Users">

    <jsp:attribute name="body">
            <div class="row">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">${user.name}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-lg-9">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td><b>ID</b></td>
                                            <td>${user.id}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Name</b></td>
                                            <td>${user.name}</td>
                                        </tr>
                                        <tr>
                                            <td><b>E-mail</b></td>
                                            <td><a href="mailto:${user.email}">${user.email}</a></td>
                                        </tr>
                                        <tr>
                                            <td><b>Phone</b></td>
                                            <td>${user.phone}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Address</b></td>
                                            <td>${user.address}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Legal Status</b></td>
                                            <td>${user.legalStatus.toString()}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Is Admin</b></td>
                                            <td>${user.isAdmin ? 'Yes' : 'No'}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="col-xs-2">
                                <a href="${pageContext.request.contextPath}/user/edit/${user.id}" class="btn btn-block btn-primary glyphicon glyphicon-pencil"><font face="arial">  Edit</font></a>
                                </div>

                                <c:if test="${user.isAdmin}">
                                <div class="col-xs-2">
                                    <a href="${pageContext.request.contextPath}/user/delete/${user.id}" class="btn btn-block btn-danger glyphicon glyphicon-remove"><font face="arial">  Delete</font></a>
                                </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <h3>Orders (${user.orders.size()})</h3>
                <table class="table">
                    <thead>
                    <tr>
                        <th><b>Order ID</b></th>
                        <th><b>Date From</b></th>
                        <th><b>Date To</b></th>
                        <th><b>Machine</b></th>
                        <th><b>Rent Price</b></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${user.orders.size() > 0}">
                            <c:forEach items="${user.orders}" var="order">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/order/detail/${order.id}">Display order ${order.id}</a>
                                    </td>
                                    <td>${order.rentalDate}</td>
                                    <td>${order.returnDate}</td>
                                    <td>${order.machine.name}</td>
                                    <td>${order.rentalPrice}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr class="danger">
                                <td colspan="5" align="center"><b>User has no orders</b></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>

                    </tbody>
                </table>
            </div>
    </jsp:attribute>

    </t:page>

</c:if>

<!-- If User doesn't exist -->
<c:if test="${user == null}">
    <t:page title="User doesn't exist" activeNavbarItem="Users">
        <jsp:attribute name="body">
            <div class="jumbotron">
                <h3>Sorry, no such user exists.</h3>
            </div>
        </jsp:attribute>
    </t:page>
</c:if>
