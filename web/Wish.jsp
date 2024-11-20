<%-- 
    Document   : Wish
    Created on : Jun 28, 2024, 1:23:23 PM
    Author     : dtai1
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wish Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .quantity_input {
                width: 40px;
                text-align: center;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    </head>
    
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <div class="shopping-wish">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">No</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Số Lượng</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Xóa</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list}" var="o" varStatus="loop">
                                                <tr>
                                                    <td>${loop.index + 1}</td>
                                                    <td scope="row">
                                                        <div class="p-2">
                                                            <img src="${o.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.name}</a></h5>
                                                                <span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle"><strong>${o.price}</strong></td>

                                                    </td>
                                                    <td class="align-middle">
                                                        <a href="MainController?id=${o.id}&action=DecreaseCart">
                                                            <button onclick="decreaseQuantity(${o.id})">-</button> 
                                                        </a>
                                                        <strong id="quantity${o.id}">${o.quantity}</strong>
                                                        <a href="MainController?id=${o.id}&action=IncreaseCart">
                                                            <button onclick="increaseQuantity(${o.id})">+</button> 
                                                        </a>
                                                    </td>
                                                    <td class="align-middle">

                                                        <form action="ViewWish" method="post">
                                                            <input type="hidden" name="productId" value="${o.id}">
                                                            <button type="submit" class="btn btn-danger">Remove</button>
                                                        </form>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>                                                             
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
</html>
