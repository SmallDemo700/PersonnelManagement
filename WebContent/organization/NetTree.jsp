<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="java.util.ArrayList"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件树</title>
    <style>
        ul, li {
            list-style: none;
        }

        ul {
            padding-left: 20px;
        }

        .close {
            display: inline-block;
            width: 15px;
            height: 15px;
            background: url("<%=path %>/images/close.png") no-repeat center;
            background-size: contain;
        }

        .open {
            display: inline-block;
            width: 15px;
            height: 15px;
            background: url("<%=path %>/images/open.png") no-repeat center;
            background-size: contain;
        }

        .leaf {
            display: inline-block;
            width: 15px;
            height: 15px;
            background: url("<%=path %>/images/leaf.png") no-repeat center;
            background-size: contain;
        }

        .leafName {

            color: green;
            padding-left: 10px;
            padding-right: 10px;

        }

        .openTrue {
            color: gray;
        }
    </style>
</head>
<body>
<div id="tree"></div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>

<script type="text/javascript">
<%   
	ArrayList<ArrayList<String>> result = (ArrayList<ArrayList<String>>)request.getSession().getAttribute("netArr");
	if(result==null){
		result = new ArrayList<ArrayList<String>>();
	}
	/* System.out.println(result.get(0).get(1)); */
%> 
var net = new Array();     

<%for(int i=0;i<result.size();i++){  %>
	net[<%=i%>] = new Array();
<%for(int j=0;j<result.get(i).size();j++){%>  
       net[<%=i%>][<%=j%>] = "<%=(String)result.get(i).get(j)%>";     
       <%}%>
 <%}%>   
 const Net = [
     {
         name: "网络部", open: true,
         children: [
             {
                 name: "df",
                 children: [
                     {name: "1", nid: "nid"},
                     {name: ""} ,
                     {name: ""},
                     {name: ""},
                     {name: ""},
                     {name: ""}
                 ]
             },
             {
                 name: "",
                 children: [
                     {name:""},
                     {name:""},
                     {name:""},
                     {name: ""},
                     {name: ""},
                     {name:""}
                 ]
             },
             {
                 name: "",
                 children: [
                     {name:""},
                     {name:""},
                     {name:""},
                     {name: ""},
                     {name: ""},
                     {name:""}
                 ]
             },
             {
                 name: "",
                 children: [
                     {name:""},
                     {name:""},
                     {name:""},
                     {name: ""},
                     {name: ""},
                     {name:""}
                 ]
             },
             {
                 name: "",
                 children: [
                     {name:""},
                     {name:""},
                     {name:""},
                     {name: ""},
                     {name: ""},
                     {name:""}
                 ]
             },
         ]
     }
 ];


 for(var i=0;i<net.length;i++){
     Net[0].children[i].name = net[i][0];
     for(var j=1;j<net[i].length;j++){
         Net[0].children[i].children[j-1].name = net[i][j];
     }
 }
 
 paintingTree(Net, "tree");

 function paintingTree(arr, id) {
     if(arr[0]["pId"]!==undefined){
         arr=removeEmptyFromPaintData(arr)
     }
     var str = ""
     //渲染树
     function createTree(arr) {
         if (arr) {
             var children = arr;
             str += "<ul>";
             for (var j = 0; j < children.length; j++) {
                 str += "<li>"
                 if (children[j]["children"] && children[j]["name"]!="") {
                     if (children[j]["open"]) {
                         str += "<div open='true'><span class='close'></span><span class='openTrue'>" + children[j]["name"] + "</span></div>";
                     } else {
                         str += "<div open='false'><span class='open'></span><span class='openTrue'>" + children[j]["name"] + "</span></div>";
                     }

                 } else if(children[j]["name"]!=""){
                     str += "<div><span class='leaf'></span><span class='leafName'>" + children[j]["name"] + "</div>";
                 }

                 createTree(children[j]["children"])
                 str += "</li>"
             }
             str += "</ul>";
         }
     }

     createTree(arr)
     $("#"+id).hide()
     $("#"+id).html(str)
     $("[open=true]").each(function () {
         $(this).next().show()
     })
     $("[open=false]").each(function () {
         $(this).next().hide()
     })
     $(document).on("click", ".close", function () {
         $(this).parent().next().hide()
         $(this).addClass("open").removeClass("close")
     })
     $(document).on("click", ".open", function () {
         $(this).parent().next().show()
         $(this).addClass("close").removeClass("open")
     })
     $("#"+id).show()
     //把简单的数据转化成渲染数据
     function createPaintDataFromSimpleData(zNodes, Nodes) {
         for (var i = 0; i < zNodes.length; i++) {
             if (!!zNodes[i]) {
                 zNodes[i]["children"] = [];
                 for (var j = 0; j < Nodes.length; j++) {

                     if (!!Nodes[j]) {
                         if (Nodes[j]["pId"] == zNodes[i]["id"]) {
                             if (Nodes[j]) {
                                 zNodes[i]["children"].push(Nodes[j])
                                 Nodes[j] = ""
                             }
                         }
                     }
                 }
                 if (zNodes[i]["children"].length == 0) {
                     zNodes[i]["children"] = false
                 } else {
                     createPaintDataFromSimpleData(zNodes[i]["children"], zNodes)
                 }
             }
         }
         return zNodes
     }
     //对渲染数据清除空元素
     function removeEmptyFromPaintData(nodes) {
         var data = createPaintDataFromSimpleData(nodes, nodes);
         var arr = [];
         for (var i = 0; i < data.length; i++) {
             if (!!data[i]) {
                 arr.push(data[i])
             }
         }
         return arr;
     }
 }
</script>
</body>
</html>