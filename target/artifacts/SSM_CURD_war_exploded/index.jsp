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
<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateModalLabel">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>

                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_update_input" name="email" placeholder="Email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline" >
                                <input type="radio" name="gender" id="updateRadio1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="updateRadio2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DeptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<%--员工新增的模态框--%>
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName_add_input" name="empName">
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_add_input" name="email" placeholder="Email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline" >
                                <input type="radio" name="gender" id="inlineRadio1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DeptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="emp_save_btn">提交</button>
            </div>
        </div>
    </div>
</div>
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
            <button class="btn btn-primary" id="emp_add_modal">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <br>
    <%--    显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>#</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
        </div>
    </div>
    <%--    显示分页信息--%>
    <div class="row">
        <%--            分页文本信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--            分页条信息--%>
        <div class="col-md-6" id="page_info_nav">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalNum,currentPage;
<%--    绑定删除按钮的点击事件--%>
<%--d单个删除--%>
    $(document).on("click",".delete_btn",function () {
        //1.弹出确认是否删除
        var empName=$(this).parents("tr").find("td:eq(1)").text();
        var empId=$(this).attr("delete-id");
        if(confirm("是否确认删除{"+empName+"} 吗？")){
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_pn(currentPage);
                }
            })
        }
    });
    //完成全选、全不选
    $("#check_all").click(function () {
        //prop修改和读取dom原生属性的值；
        //attr获取自定义的属性的值；
        $(".check_item").prop("checked",$(this).prop("checked"));
       // alert($(this).prop("checked"));
    });
    //全选下面全部框，全选框的变化
    $(document).on("click",".check_item",function () {
        var flag=$(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });
    //点击批量删除
    $("#emp_delete_all_btn").click(function () {
        var empNames="";
        var empIds="";
       $.each($(".check_item:checked"),function () {
           empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
           empIds+=$(this).parents("tr").find("td:eq(1)").text()+",";
       });
        empNames=empNames.substring(0,empNames.length-1);
        empIds=empIds.substring(0,empIds.length-1);
        if(confirm("确定是否删除{"+empNames+"}")){
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+empIds,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_pn(currentPage);
                }
            })
        }
    });
    //一开始加载跳转到第一页
    $(function () {
        to_pn(1);
    });
    //查询员工信息
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            async: false,
            success:function(result){
                console.log(result);
                var empData=result.map.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModel input[name=gender]").val([empData.gender]);
                $("#empUpdateModel select").val([empData.dId]);
            }

        });
    }
    function validate_add_form(){
        $("#empAddModel form").find("*").removeClass("has-error has-success");
        alert("1");
        var name=$("#empName_add_input").value;
        var regName=/^[A-Za-z_@.]{6,10}$/;
        if(!regName.test(name)){
            // alert("名称需为3位以上的字母或是汉字组成");
            show_validate_msg("#empName_add_input","error","用户名必须是6-10位之间的字母、下划线、@、.");
            return false;
        }else{
            show_validate_msg("#empName_add_input","success","");
        }
        var email=$("#email_add_input").value;
        var regEmail=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if(regEmail.test(email)){
            show_validate_msg("#email_add_input","error","请输入正确的邮箱");
            return false;
        }else{
            show_validate_msg("#email_add_input","success","");
        }
        return true;
    }
    function resetClear_ele(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    $("#empName_add_input").change(function () {

        var empName=this.value();
       $.ajax({
           url:"${APP_PATH}/checkUser",
           data:"empName="+empName,
           type:"POST",
           success:function (result) {
               alert(empName);
               if(result.code==200){
                   $("#emp_save_btn").attr("ajax-va","success");
                   show_validate_msg("#empName_add_input","success",result.map.va_msg);
               }else{
                   $("#emp_save_btn").attr("ajax-va","error");
                   show_validate_msg("#empName_add_input","error",result.map.va_msg);
               }
           }
       })
    });
    $("#emp_save_btn").click(function () {
        alert($("#empAddModel form").serialize());
        // if(!validate_add_form()){
        //     return false;
        // }
        //2.发送服务器
        if($(this).attr("ajax-va")=="error"){
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/emps",
            type:"POST",
            data:$("#empAddModel form").serialize(),
            success:function (result) {
                if(result.code==200){
                    //    1.关闭模态框
                    $("#empAddModel").modal('hide');
                    //    2.到在最后一页
                    to_pn(totalNum);
                }else{
                    // console.log(result);
                    if(undefined!=result.map.errorFields.empName){
                        show_validate_msg("#empName_add_input","error",result.map.errorFields.empName);
                    }
                    if(undefined!=result.map.errorFields.email){
                        show_validate_msg("#email_add_input","error",result.map.errorFields.email);
                    }
                }


            }

        })
    });
    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error");
        if("error"== status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }else if("success"== status){
            $(ele).parent().addClass("has-success");
        }

    }
    $("#emp_add_modal").click(function () {
        resetClear_ele("#empAddModel form");
        getDepts("#empAddModel select");
       $("#empAddModel").modal({
           backdrop:"static"
       });
    });
    $("#emp_update_btn").click(function () {
        var email=$("#email_update_input").value;
        var regEmail=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if(regEmail.test(email)){
            show_validate_msg("#email_update_input","error","请输入正确的邮箱");
            return false;
        }else{
            show_validate_msg("#email_update_input","success","");
        }
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModel form").serialize(),
            success:function (result) {
                // alert(result.msg);
            //    1.关闭模态框
                $("#empUpdateModel").modal("hide");
            //    2.回到页面
                to_pn(currentPage);
            }
        })
    });
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            async: false,
            success:function (result) {
                $("#empAddModel select").empty();
                $.each(result.map.depts,function () {
                    var optionId=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionId.appendTo(ele);
                })
            }
        });
    }
    function to_pn(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"get",
            success:function (result) {

                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);

            }
        })
    }
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps=result.map.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxId=$("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender);
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            var editButton=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            editButton.attr("edit-id",item.empId);
            var deleteButton=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            deleteButton.attr("delete-id",item.empId);
            var btnTd=$("<td></td>").append(editButton).append(" ").append(deleteButton);
            $("<tr></tr>").append(checkBoxId)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    $(document).on("click",".edit_btn",function () {

        //2.查出部门信息
        getDepts("#empUpdateModel select");

        //1.查出员工信息
        getEmp($(this).attr("edit-id"));


        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        //3.弹出模态框
        $("#empUpdateModel").modal({
            backdrop:"static"
        });

    });
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前为："+result.map.pageInfo.pageNum+" / 总 "+result.map.pageInfo.pages+" 页 ;总数量："+result.map.pageInfo.total);
        totalNum=result.map.pageInfo.total;
        currentPage=result.map.pageInfo.pageNum;
    }
    function build_page_nav(result) {
        $("#page_info_nav").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePage=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(!result.map.pageInfo.hasPreviousPage){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }else{
            firstPage.click(function () {
                to_pn(1);
            });
            prePage.click(function () {
                to_pn(result.map.pageInfo.pageNum-1);
            });
        }

        ul.append(firstPage).append(prePage);
        var endPage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        var nextPage=$("<li></li>").append($("<a></a>").append("&raquo;"));
        if(!result.map.pageInfo.hasNextPage){
            endPage.addClass("disabled");
            nextPage.addClass("disabled");
        }else{
            endPage.click(function () {
                to_pn(result.map.pageInfo.pages);
            });
            nextPage.click(function () {
                to_pn(result.map.pageInfo.pageNum+1);
            });
        }
        $.each(result.map.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.map.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function (){
                to_pn(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPage).append(endPage);
        var navEle=$("<nav></nav>").append(ul);
        $("#page_info_nav").append(navEle);

    }
</script>
</body>
</html>