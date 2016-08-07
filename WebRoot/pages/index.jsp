<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta content="IE=11.0000" http-equiv="X-Ua-Compatible">
<meta charset="utf-8">
<meta http-equiv="X-Ua-Compatible" content="iE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<title>简笔记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">

<script src="js/js_1.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2"
	data-locale="zh-CN" data-js-module="recommendation" id="my-vueJS"
	v-cloak>
	<c:if test="${userNameInSession == null}">
		<div class="navbar-user">
			<a class="login" data-signup-link="true" data-toggle="modal"
				href="register.html"> <i class="fa fa-user"></i> 注册
			</a> <a class="login" data-signin-link="true" data-toggle="modal"
				href="login.html"> <i class="fa fa-sign-in"></i> 登录
			</a> <a class="daytime set-view-mode pull-right"
				href="javascript:void(0)"><i class="fa fa-moon-o"></i></a>
		</div>
		<my-nologin-sidebar></my-nologin-sidebar>
	</c:if>
	<c:if test="${userNameInSession != null}">
		<div class="navbar-user">
			<a class="user avatar" data-toggle="dropdown"
				href="javascript:void(0)"> <img src="${user.userImagePath}"
				alt="11"> <b class="caret"></b>
			</a>
			<ul class="dropdown-menu arrow-top" role="menu"
				aria-labelledby="dLabel">
				<li><a href="writer.html"><i class="fa fa-pencil"></i> 写文章</a></li>
				<li><a target="_blank"
					href="http://www.jianshu.com/users/af5e3096ebc7"><i
						class="fa fa-user"></i> 我的主页</a></li>
				<li><a href="http://www.jianshu.com/favourites"> <i
						class="fa fa-heart"></i> 我喜欢的
				</a></li>
				<li><a href="http://www.jianshu.com/bookmarks"> <i
						class="fa fa-bookmark"></i> 我的收藏
				</a></li>
				<li><a href="http://www.jianshu.com/notifications"> <i
						class="fa fa-bell"></i> 提醒
				</a></li>
				<li><a href="http://www.jianshu.com/chats"> <i
						class="fa fa-envelope"></i> 简信
				</a></li>
				<li><a href="setting.html"><i class="fa fa-cogs"></i> 设置</a></li>
				<li><a href="http://www.jianshu.com/wallet"> <i
						class="fa fa-credit-card"></i> 钱包
				</a></li>
				<li class="dropdown-submenu"><a tabindex="-1"
					href="http://www.jianshu.com/#"><i
						class="fa fa-question-circle"></i> 帮助</a>
					<ul class="dropdown-menu">
						<li><a href="http://www.jianshu.com/notebooks/547/latest"
							target="_blank">帮助中心</a></li>
						<li><a target="_blank" href="http://www.jianshu.com/contact">联系我们</a></li>
					</ul></li>
				<li><a rel="nofollow" data-method="DELETE" href="logout.do">
						<i class="fa fa-sign-out"></i> 登 出
				</a></li>
			</ul>
		</div>
		<div class="navbar navbar-jianshu expanded">
			<div class="dropdown">
				<a class="active logo" role="button" data-original-title="个人主页"
					data-container="div.expanded" href="index.html"> <b>简</b><i
					class="fa fa-home"></i><span class="title">首页</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="专题" data-container="div.expanded"
					href="http://www.jianshu.com/collections"> <i class="fa fa-th"></i><span
					class="title">专题</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="简友圈" data-container="div.expanded"
					href="http://www.jianshu.com/timeline"> <i class="fa fa-users"></i><span
					class="title">简友圈</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="写文章" data-container="div.expanded"
					href="writer.html"> <i class="fa fa-pencil"></i><span
					class="title">写文章</span>
			</div>
			<div class="nav-user">
				<a data-toggle="tooltip" data-placement="right"
					data-original-title="我的主页" data-container="div.expanded"
					href="http://www.jianshu.com/users/af5e3096ebc7"> <i
					class="fa fa-user"></i><span class="title">我的主页</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="我的收藏" data-container="div.expanded"
					href="http://www.jianshu.com/bookmarks"> <i
					class="fa fa-bookmark"></i><span class="title">我的收藏</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="提醒" data-container="div.expanded"
					href="http://www.jianshu.com/notifications"> <i
					id="notify-icon" class="fa fa-bell"></i><span class="title">提醒</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="简信" data-container="div.expanded"
					href="http://www.jianshu.com/chats"> <i id="chat-message-icon"
					class="fa fa-envelope"></i><span class="title">简信</span>
				</a> <a href="http://www.jianshu.com/#view-mode-modal"
					data-toggle="modal"><i class="fa fa-font"></i><span
					class="title">显示模式</span></a> <a data-toggle="tooltip"
					data-placement="right" data-original-title="设置"
					data-container="div.expanded" href="setting.html"> <i
					class="fa fa-cogs"></i><span class="title">设置</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="登 出" data-container="div.expanded"
					rel="nofollow" data-method="delete" href="logout.do"> <i
					class="fa fa-sign-out"></i><span class="title">登 出</span>
				</a>
			</div>
		</div>
	</c:if>
	<div class="row-fluid">
		<div class="recommended">
			<my-min-pic-bar></my-min-pic-bar>
			<div class="span7 offset3">
				<div class="page-title" style="width: 705px;">
					<ul class="recommened-nav navigation clearfix"
						data-container="#list-container" data-loader=".loader-tiny">
						<li class="active"><A
							href="http://www.jianshu.com/trending/now" data-pjax="true">发现</A>
						</li>
						<c:if test="${userNameInSession != null}">
							<li data-name="subscription_notes" class=""><a
								data-pjax="true" href="/subscription_notes"><i
									class="fa fa-bars"></i> 关注</a></li>
						</c:if>
						<li class="bonus"><A
							href="http://www.jianshu.com/zodiac/2015"><I
								class="fa fa-bars"></I> 2015精选</A></li>
						<c:if test="${userNameInSession != null}">
							<li class="switch-default-tab disabled"><a
								href="javascript:void(null)" data-toggle="tooltip"
								data-placement="right" data-original-title='更改标签页顺序'><i
									class="fa fa-cog"></i></a></li>
						</c:if>
						<li class="search">
							<form class="search-form" action="" method="post" target="_blank"
								accept-charset="UTF-8">
								<input name="q" class="input-medium search-query" type="search"
									placeholder="搜索" value=""> <span class="search_trigger"
									onclick=""><I class="fa fa-search"></I></span>
							</form>
						</li>
					</ul>
				</div>
				<div id="list-container">
					<my-navigation-bar></my-navigation-bar>
					<ul class="article-list thumbnails">
						<c:forEach items="${essayList}" var="essay">
							<li class="have-img"><A class="wrap-img"
								href="http://www.jianshu.com/p/cb254b7647d7"><img alt="300"
									src="images/index/1480410-dc9d2be35d880969.png"></A>
								<div>
									<P class="list-top">
										<A class="author-name blue-link" href="" target="_blank">${essay.userName}</A>
										<EM>·</EM> <span class="time"
											data-shared-at="2016-07-10T14:43:28+08:00"></span>
									</P>
									<H4 class="title">
										<A href="essay.html?id=${essay.id}" target="_blank">${essay.essayTitle}</A>
									</H4>
									<div class="list-footer">
										<A href="http://www.jianshu.com/p/cb254b7647d7"
											target="_blank"> 阅读 ${essay.essayReadingNumber}</A> <A
											href="http://www.jianshu.com/p/cb254b7647d7#comments"
											target="_blank"> · 评论 ${essay.essayReadingNumber}</A> <span>
											· 喜欢 ${essay.essayGoodNumber}</span>
									</div>
								</div></li>
						</c:forEach>
						<li class="have-img"><A class="wrap-img"
							href="http://www.jianshu.com/p/cb254b7647d7"><img alt="300"
								src="images/index/1480410-dc9d2be35d880969.png"></A>
							<div>
								<P class="list-top">
									<A class="author-name blue-link"
										href="http://www.jianshu.com/users/db6171d91553"
										target="_blank">丧心病狂的小坚果儿</A> <EM>·</EM> <span class="time"
										data-shared-at="2016-07-10T14:43:28+08:00"></span>
								</P>
								<H4 class="title">
									<A href="http://www.jianshu.com/p/cb254b7647d7" target="_blank">这些含金量十足的英语证书你一定要考！吐血整理（附真题、答案及听力音频下载）</A>
								</H4>
								<div class="list-footer">
									<A href="http://www.jianshu.com/p/cb254b7647d7" target="_blank">
										阅读 4249 </A> <A
										href="http://www.jianshu.com/p/cb254b7647d7#comments"
										target="_blank"> · 评论 65 </A> <span> · 喜欢 495</span> <span>
										· 打赏 2</span>
								</div>
							</div></li>
						<li class="have-img"><A class="wrap-img"
							href="http://www.jianshu.com/p/83e384033137"><img alt="300"
								src="images/index/1665079-20a33463f8cfb898.jpg"></A>
							<div>
								<P class="list-top">
									<A class="author-name blue-link"
										href="http://www.jianshu.com/users/c8e648cfa354"
										target="_blank">南下的夏天</A> <EM>·</EM> <span class="time"
										data-shared-at="2016-07-10T17:09:30+08:00"></span>
								</P>
								<H4 class="title">
									<A href="http://www.jianshu.com/p/83e384033137" target="_blank">《大鱼·海棠》：他这般风骨，我们却恶意满怀</A>
								</H4>
								<div class="list-footer">
									<A href="http://www.jianshu.com/p/83e384033137" target="_blank">
										阅读 7812 </A> <A
										href="http://www.jianshu.com/p/83e384033137#comments"
										target="_blank"> · 评论 62 </A> <span> · 喜欢 42</span>
								</div>
							</div></li>
						<li class="have-img"><A class="wrap-img"
							href="http://www.jianshu.com/p/557d7fc478ba"><img alt="300"
								src="images/index/2007654-b848ab76317aaba2.jpg"></A>
							<div>
								<P class="list-top">
									<A class="author-name blue-link"
										href="http://www.jianshu.com/users/6fba959c5af0"
										target="_blank">红尘笑笑生</A> <EM>·</EM> <span class="time"
										data-shared-at="2016-07-10T12:52:43+08:00"></span>
								</P>
								<H4 class="title">
									<A href="http://www.jianshu.com/p/557d7fc478ba" target="_blank">想做出颜值一流的PPT，有秋叶老师的这些私家干货就够了</A>
								</H4>
								<div class="list-footer">
									<A href="http://www.jianshu.com/p/557d7fc478ba" target="_blank">
										阅读 399 </A> <A
										href="http://www.jianshu.com/p/557d7fc478ba#comments"
										target="_blank"> · 评论 3 </A> <span> · 喜欢 49</span>
								</div>
							</div></li>
					</ul>
					<div class="load-more">
						<button class="ladda-button " data-style="slide-left"
							data-size="medium" data-color="maleskine" data-method="get"
							data-remote="" data-type="script">
							<span class="ladda-label">点击查看更多</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>