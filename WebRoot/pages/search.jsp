<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">

<title>简随记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">

<script src="js/js_1.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
<script src="js/search.js"></script>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2 "
	data-js-module="" data-locale="zh-CN" id="my-vueJS">
	<c:if test="${userNameInSession == null}">
		<div class="wrap-btn">
			<div class="article-related pull-left">
				<a class="collection-menu-btn" data-toggle="modal"
					data-target="#collection-menu" href="javascript:void(null);"> <i
					class="fa fa-th"></i>
				</a> <a class="notebooks-menu-btn" data-toggle="modal"
					data-target="#notebooks-menu" href="javascript:void(null);"><i
					class="fa fa-list-ul"></i></a>
				<div class="related-avatar-group activities"></div>
			</div>
			<a class="login" data-signup-link="true" data-toggle="modal"
				href="register.html"> <i class="fa fa-user"></i> 注册
			</a> <a class="login" data-signin-link="true" data-toggle="modal"
				href="login.html"> <i class="fa fa-sign-in"></i> 登录
			</a>
		</div>
	</c:if>
	<c:if test="${userNameInSession != null}">
		<my-login-top-sidebar img-src="${userImagePathInSession}"></my-login-top-sidebar>
	</c:if>
	<c:if test="${userNameInSession == null}">
		<my-nologin-sidebar></my-nologin-sidebar>
	</c:if>
	<c:if test="${userNameInSession != null}">
		<my-login-sidebar></my-login-sidebar>
	</c:if>

	<div class="row-fluid">
		<div class="search-page" data-js-module="search-show">
			<div class="span3">
				<ul class="nav nav-list">
					<li id="essay_li" data-type="notes" class="active"><a
						href="javascript:void(0)" onclick="searchEssay();">文章</a></li>
					<li id="corpus_li" data-type="notebooks" class=""><a
						href="javascript:void(0)" onclick="searchCorpus();">文集</a></li>
					<li id="user_li" data-type="users" class=""><a
						href="javascript:void(0)" onclick="searchUser();">作者</a></li>
				</ul>
			</div>

			<div class="span7">
				<div class="page-title clearfix">
					<div class="input-prepend pull-right">
						<form>
							<div class="btn-group">
								<button id="choose_button_content" class="btn dropdown-toggle"
									data-toggle="dropdown" type="button">
									文章 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li id="choose_essay_li" data-type="notes"
										style="display: none;"><a href="javascript:void(0)"
										onclick="showEssayButton()">文章</a></li>
									<li id="choose_corpus_li" data-type="notebooks"><a
										href="javascript:void(0)" onclick="showCorpusButton()">文集</a></li>
									<li id="choose_user_li" data-type="users"><a
										href="javascript:void(0)" onclick="showUserButton()">作者</a></li>
								</ul>
							</div>
							<input id="hideSearchKeyword" type="hidden"
								value="${searchKeyword}"> <input id="searchKeyword"
								name="searchKeyword" type="search" placeholder="搜索"
								class="input-medium"
								onkeypress="if(event.keyCode==13) {search();return false;}">
							<span class="search_trigger"><i class="fa fa-search"
								onclick="search();"></i></span>
						</form>
					</div>
				</div>

				<div class="search-results-container">
					<ul id="search_ul" class="unstyled list">
						<c:forEach items="${essayList}" var="essay" varStatus="status">
							<li>
								<h4 class="title">
									<a href="essay.html?id=${essay.id}" target="_blank"> <i
										class="fa fa-file-text"></i> ${essay.essayTitle}
									</a>
								</h4>
								<p>${essay.essayContent}</p>
								<div class="list-footer">
									<a href="">${essay.userName}</a> <a href="">· 阅读
										${essay.essayReadingNumber}</a> <a href="">· 评论
										${essay.essayCommentNumber}</a> <span>·
										喜欢${essay.essayGoodNumber} </span> · <span data-timeago=""
										title="2015-05-17T03:57:08.000Z">大约1年之前</span>
								</div>
							</li>
						</c:forEach>
					</ul>
					<c:if test="${essayList.size() == 0 || essayList == null}">
						<div id="no_find" class="no-results text-center">
							<i class="fa fa-search fa-2x"></i>
							<h5>未找到相关内容</h5>
						</div>
					</c:if>
					<c:if test="${essayList.size() != 0}">
						<div id="no_find" class="no-results text-center"
							style="display: none">
							<i class="fa fa-search fa-2x"></i>
							<h5>未找到相关内容</h5>
						</div>
					</c:if>
					<!-- <div class="pagination">
						<ul>
							Prev
							On the left
							<li class="active"><a href="javascript:void(null)">1</a></li>
							On the right
							<li data-page="2"><a href="javascript:void(null)">2</a></li>
							<li data-page="3"><a href="javascript:void(null)">3</a></li>
							<li data-page="4"><a href="javascript:void(null)">4</a></li>
							<li data-page="5"><a href="javascript:void(null)">5</a></li>
							<li data-page="6"><a href="javascript:void(null)">6</a></li>
							<li data-page="7"><a href="javascript:void(null)">7</a></li>
							<li data-page="8"><a href="javascript:void(null)">8</a></li>
							<li data-page="9"><a href="javascript:void(null)">9</a></li>
							<li data-page="10"><a href="javascript:void(null)">10</a></li>
							Next
							<li data-page="2"><a href="javascript:void(null)">下一页</a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>