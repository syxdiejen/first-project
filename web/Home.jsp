<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><i class="material-icons">home</i><a href="HomeController">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="#"><i class="fa fa-list"></i> Sub-category</li>
                                <li class="breadcrumb-item">
                                    <select onchange="location = this.value;">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="CategoryController?cid=${o.cid}" ${tag == o.cid ? 'selected' : ''}>
                                            ${o.cname}
                                        </option>
                                    </c:forEach>
                                </select>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <%--<jsp:include page="Left.jsp"></jsp:include>--%>

                <!--<div class="col-md-10">-->
                <div id="content" class="row">
                    <c:forEach items="${listP}" var="o">
                        <div class="product col-12 col-md-6 col-lg-3">
                            <div class="card">
                                <img class="card-img-top" src="${o.image}" alt="Product image">
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="DetailController?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                    <p class="card-text show_txt">${o.title}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${o.price} $</p>
                                        </div>
                                        <div class="col">
                                            <a href="MainController?id=${o.id}&action=AddCart" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--</div>-->

            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>

