<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
html, body, div, a {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-weight: inherit;
	font-style: inherit;
	vertical-align: baseline;
}

#gateway_warp * {
	font-family: dotum, sans-serif;
}

#gateway_warp {
	text-align: center;
	height: 32px;
	border-bottom: 1px solid #e9edf3;
	background: #f4f6f9;
}

#gateway_warp.welcome {
	height: 33px;
	border-bottom: 0;
}

#gateway_warp #gateway_con {
	width: 980px !important;
	margin: 0 auto;
}

#gateway_warp.toy #gateway_con {
	width: 1045px !important;
}

#gateway_con .gnbArea_left {
	float: left;
}

* html #gateway_con .gnbArea_left {
	width: 310px;
}

#gateway_con .gnbArea_left ul {
	*zoom: 1;
	border-right: 1px solid #e9edf3;
}

#gateway_con .gnbArea_left ul:after {
	display: block;
	content: "";
	clear: both;
}

#gateway_con .gnbArea_left li {
	float: left;
	width: 60px;
	height: 32px;
	border-left: 1px solid #e9edf3;
}

#gateway_con .gnbArea_left li a {
	display: block;
	height: 20px;
	padding-top: 12px;
	font-size: 11px;
	line-height: 14px;
	color: #666;
}

#gateway_con .gnbArea_left li a:hover {
	text-decoration: none
}

#gateway_warp ul, #gateway_warp li, #gateway_warp dl, #gateway_warp dt,
	#gateway_warp dd {
	margin: 0;
	padding: 0;
	font-size: 12px;
	list-style: none;
}

#gateway_con .gnbArea_right {
	float: right;
	height: 31px;
}

#gateway_con .gnbArea_right * {
	font-family: dotum, verdana, sans-serif !important;
}

#gateway_warp #gateway_con .gnbArea_right a {
	display: block;
	padding-bottom: 5px;
	_padding-bottom: 0;
	font-size: 11px;
	line-height: 14px;
	color: #777;
	letter-spacing: -1px;
}

#gateway_con .gnbArea_right li {
	float: left;
	margin: 0 12px 0 0;
	line-height: 14px;
	background: none;
}

#gateway_con .gnbArea_right #gnbArea_link>ul {
	margin-top: 12px
}

ul {
	list-style: none;
}

a {
	font-family: NanumGothic, "Nanum Gothic", dotum, "돋움", sans-serif;
	text-decoration: none;
	color: #222;
}

#logo{
	text-align: left;
	margin-left: 200px;
	margin-top: 10px;
	float: left;
}

#search {
  margin-left: 80px;
  margin-top: 20px;
  background-color: #f1f1f1;
  padding: 12px 45px 14px 21px;
  border: none;
  border-radius: 50px;
  width: 350px;
  height: 20px;
  outline: none;
  
}
#petSearch{
	float: left;
}

#petInsert > a{
	padding-top: 10px;
	padding-left: 60px;
}

#header{
	position: relative;
}

#petSearch > a {
    top: 1px;
    right: 4px;
    display: block;
    width: 22px;
    height: 22px;
    padding: 11px 10px 12px 11px;
    background: url(http://openimage.interpark.com/.ui/pet/common/pet_searchIcon.png) 11px 11px no-repeat;
    float: right;
}

#searchButton{
	margin-top: 20px;
}

#menu{
	width: 1000px;
	margin-left: 200px;
	margin-right: 10px;
}

.menu1{
	float: left;
	margin-right: 10px;
	margin-bottom: 10px;
	margin-top: 5px;
}


#footer {
    text-align: center;
    height: 32px;
    border-bottom: 1px solid #e9edf3;
    background: #f4f6f9;
}

#footer {
    clear: both;
    height: 100px;
    font-size: 11px;
    color: #8d8d8d;
    letter-spacing: -1px;
    border-top: 2px solid #DAEAAA;
    top: 7px;  
}

#footer > ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
}
#footer > ul > li {
    float: left;
} 

#footer > ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
    position: relative;
    left: 8px;
}
#footer > ul > li {
    float: left;
    padding: 6px 12px 6px 8px;
    background: url('../images/circle.gif') no-repeat 0 50%;
}
#footer > ul > li > a {
    color: #8D8D8D;
    text-decoration: none;
}
#footer > ul > li > a:hover {
    text-decoration: underline;
}
#footer > ul > li#company-info {
    margin-left: 350px;
    margin-top:10px;
    margin-bottom : 10px;
    letter-spacing: 0;
    background: none;
    width: 600px;
}


a.innerborder, a.innerborder img { 
        float: left; 
        overflow:hidden;
              
} 
a.innerborder:hover { 
        border-top: 10px solid #ffe100; 
        border-radius:10px;
        box-shadow:3px 3px 10px #E6E2AF;
} 
a.innerborder:hover img { 
        margin: -2px; 
} 
    