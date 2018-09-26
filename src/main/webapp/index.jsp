<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";

        #nav {
            margin-bottom: 0;
        }

        article {
            background: #ddd;
            height: 800px;
        }

        footer.jumbotron {
            margin-top: 30px;
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">My Website</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign in</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<header class="jumbotron">
    <div class="container">
        <h1>
            <%
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                out.print(simpleDateFormat.format(new Date()));
            %>
        </h1>
        <p>
            <%=request.getRemoteAddr()%>
        </p>
    </div>
</header>
<main class="container">
    <div class="row">
        <section class="col-md-4">
            <article></article>
        </section>
        <section class="col-md-4">
            <article></article>
        </section>
        <section class="col-md-4">
            <article></article>
        </section>
    </div>
</main>
<footer class="jumbotron">
    <div class="container">
        &copy; 2018
    </div>
</footer>
<script src="assets/scripts/jquery-3.3.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
</body>
</html>
