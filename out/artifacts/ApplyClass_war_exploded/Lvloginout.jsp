<%@ page import="Dao.Jiaocaikesubmitdao" %>
<%--
  Created by IntelliJ IDEA.
  User: zhiyou
  Date: 15-4-23
  Time: 下午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% if(session.getAttribute("currentUser")==null) {
      response.sendRedirect("Lvlogin.jsp");
      return;
    }
    %>
    <script type="text/javascript">//页面index.jsp页面会被加载到但前页面
        function sayScript(){
            alert("<\/script>")//"\表示转意字符"
        }
    </script>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.6/themes/icon.css">
    <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="vakata-jstree-2f630b4%20(2)/dist/jstree.js"></script>
    <style>
        *{margin: 0;padding:0}

        th{background-color:deepskyblue;color: black}
        table#table3{background-color: blanchedalmond;
            color: black;width: 500px;}
            .s-teacher .s-table{width:950px;
                background-color:bisque;}
        .head{width:100%;height:70px;background-color: aquamarine;
            margin: 0 auto;position:relative; }
        .head .h-logo .h-chain{width:1000px;height:70px;
            margin:0 auto;}
        .s-teacher{ width:100%;height:600px; position:absolute;
            padding-top:5px;}
        .head .h-logo .h-chain .h-desc{font-size: 20px;
            line-height:100% ;color:#FF1C24;
            float: right;padding-top: 20px;padding-right: 320px;}

    </style>
</head>
<body>
<!--todo 被移到下面-->
<%--<form action="loging3" method="post">--%>
<div class="head">
    <div class="h-logo">
        <div class="h-chain">
        <a href="http://lib.sdut.edu.cn/index.html">
            <img src="img/sdut.jpg" alt="美丽的图书馆"  width="150px" height="70px">
        </a>
            <div class="h-desc">
                点击左侧图片访问山东理工大学图书馆
            </div>
        </div>

    </div>
</div>
    <div align="center"  class="s-teacher">
            <img border="0" src="img/am.jpg" width="100%" height="100%"
                 style='position: absolute;left:0px;top:0px;z-index: -1'/>
            <div class="s-table">
                <!--开始注释-->
            <%--<%=Jiaocaikesubmitdao.show2()%>--%>

                <table id="dg" title="申请教室审核后名单" class="easyui-datagrid" fitColumns="true"  pagination="true"
                    rownumbers="true"   url="apply_paging"  toolbar="#tb">
                    <thead>
                    <tr>
                        <th field="username" width="30">姓名</th>
                        <th field="reason" width="120">理由</th>
                        <th field="classnumber" width="25">教室</th>
                        <th field="applytime1" width="80">时间</th>
                        <%--<th field="temail" width="100">邮箱</th>--%>
                        <th field="unit" width="90">学院</th>
                        <th field="phone" width="50">个人电话</th>
                        <th field="fixedphone" width="50">单位电话</th>

                    </tr>
                    </thead>
                </table>
            </div>
      <form action="loging3" method="post">
            <table id="table3">

                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用人：</td>
                    <td><input type="text"  name="name1"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>

                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用教室：</td>
                    <td><input type="text"  name="classrooml"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>

                <tr>
                    <td width="40%"></td>
                    <td width="25%">借用时间：</td>
                    <td><input type="text"  name="applytimel"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="25%">学院：</td>
                    <td><input type="text"  name="unit"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>

                <tr>
                    <td width="40%"></td>
                    <td width="30%">借用人电话：</td>
                    <td><input type="text"  name="phone"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>

                <tr>
                    <td width="40%"></td>
                    <td width="25%">单位电话：</td>
                    <td><input type="text"  name="fixedphone"></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>



                <tr>
                    <td width="40%"></td>
                    <td width="25%">
                        <font >审批：</font></td>
                    <td><label>同意</label><input type="radio" value="同意" name="agree">
                        <label>不同意</label><input type="radio" value="不同意" name="agree"></td></br>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <td width="5%"><input type="submit" value="确定"></td>
                    <td><a href="index.jsp">返回登录</a></td>
                    <td width="30%"></td>
                </tr>
                <tr></tr>
                <tr>
                    <td width="40%"></td>
                    <font color="red">${ error}</font>
                </tr>
                <tr>
                    <td width="40%"></td>
                    <font color="red">${ success}</font>
                </tr>
            </table>
      </form>
    </div>
</body>
</html>
