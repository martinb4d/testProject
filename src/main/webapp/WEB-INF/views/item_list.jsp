<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Items</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
	<link href="/resources/css/jquery.dataTables.min.css" rel="stylesheet">
	<script src="/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<nav id='navbar-fixed' class='navbar navbar-static-top' >
		<div class='container-fluid clearfix header'>
			<div class="header-content">
				<div class="pull-left wel-msg">
					Welcome, ${actionForm.name}  
					<div class="sub-msg">
					Member since &nbsp;<fmt:formatDate value="${actionForm.registeredDate}" pattern="dd/MM/yyyy"/>
				</div>
				</div>
				<div class="logout pull-right">
					<a id="logout" href="/logout" target="_self" >
					  	Logout
					</a>
				</div>
			</div>
		</div>
	</nav>
	
		
		<form:form onsubmit="return false;" commandName="itemForm" autocomplete="false" method="post">
			<div class="form-content">
		<c:if test="${not empty actionForm.message}">
			<div class="systemMsg">${actionForm.message}
			</div>
		</c:if>
				<div id="errorJs" style="display: none;"><label id="errorJsLabel"></label> </div>
				<c:if test="${actionForm.screenState=='listing'}">
					<div class="subHeader">
						Item List
					</div>
					<table id="listTable" class="table table-striped table-bordered" width="100%" cellspacing="0">
				    </table>
					<div class="form-group">
						<a id="btnConfirm" onclick="onConfirmClick()"	class="btn btn-large btn-primary btn-full-scr">Confirm</a>
					</div>
				</c:if>
				<c:if test="${actionForm.screenState=='confirm'}">
					<div class="subHeader">
						Purchase Confirmation
					</div>
					<table id="cnfrmTable" class="table table-striped table-bordered" width="100%" cellspacing="0">
						<thead>
				            <tr>
				                <th>Item Description</th>
				                <th>Item Category</th>
				                <th>Price</th>
				                <th>Quantity</th>
				                <th>Total Price Per Item</th>
				            </tr>
				        </thead>
				        <tbody>
			                <c:forEach var="item" items="${actionForm.itemList}" varStatus="loop">
				                <tr>
				                    <td>${item.name}</td>
				                    <td>${item.category}</td>
				                    <td><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price}" /></td>
				                    <td>${item.qty}</td>
				                    <td style="text-align: right;"><fmt:formatNumber type="currency" currencySymbol="$" value="${item.ttlPrice}" /></td>
				                    <input type="Hidden" name="itemSelected" value ="${item.id}">
				                    <input type="Hidden" name="quantity" value ="${item.qty}">
          							<input type="Hidden" name="amount" value ="${item.ttlPrice}">
				                </tr>
				            </c:forEach>
				        </tbody>
				    </table>
				    <div class="form-group summary clearfix" >
				    	<div class="pull-left note">
				    	Total 
				    	</div>
				    	<div class="pull-right note2">
				    	<fmt:formatNumber type="currency" currencySymbol="$" value="${actionForm.total}" />
				    	</div>
				    </div>
					<div class="form-group clearfix"> 	
						<a id="btnSubmit" onclick="onSubmitClick(this.form)" class="btn btn-large btn-primary btn-half pull-left">Submit</a>
						<a id="btnBack" onclick="onBackClick(this.form)" class="btn btn-large btn-info btn-half pull-right">Back</a>
					</div>
				</c:if>
		    </div>
	    </form:form>
    </div>
</body>
<script src="/resources/js/item_list.js"></script>
</html>