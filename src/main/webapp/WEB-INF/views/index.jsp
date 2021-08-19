<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css" >
    <script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js" ></script>
</head>
<body>
<%--搭建显示页面--%>
<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CURD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <br>
    <%--    显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>



            </table>
        </div>
    </div>
    <%--    显示分页信息--%>
    <div class="row">
        <%--            分页文本信息--%>
        <div class="col-md-6">

        </div>
        <%--            分页条信息--%>
        <div class="col-md-6">

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn=1",
            type:"get",
            success:function (result) {
                console.log(result);
            }
        })
    })
</script>
</body>
</html>