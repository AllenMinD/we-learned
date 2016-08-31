<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html;
        charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        <title>${user.userName} - 简随记</title>
        <link href="<%=path%>/css/css_1.css" rel="stylesheet" media="all">
        <link href="<%=path%>/css/css_2.css" rel="stylesheet" media="all">
        <link href="<%=path%>/css/css_3.css" rel="stylesheet" media="all">
        <link href="<%=path%>/images/favicon.ico" rel="icon">
        <script src="<%=path%>/js/js_1.js"></script>
        <script src="<%=path%>/js/vue.js"></script>
        <script src="<%=path%>/js/my-vue.js"></script>
      </head>
      
      <body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show" data-locale="zh-CN" id="my-vueJS">
        <c:if test="${userNameInSession == null}">
          <my-nologin-top-sidebar login-path="<%=path%>/login" register-path="<%=path%>/register"></my-nologin-top-sidebar>
          <my-nologin-sidebar index-path="<%=path%>/index" login-path="<%=path%>/login"></my-nologin-sidebar>
        </c:if>
        <c:if test="${userNameInSession != null}">
          <my-login-top-sidebar img-src="<%=path%>/${userImagePathInSession}" writer-path="<%=path%>/writer" user-path="<%=path%>/user" favourite-path="<%=path%>/favourite" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting"></my-login-top-sidebar>
          <my-login-sidebar index-path="<%=path%>/index" writer-path="<%=path%>/writer" user-path="<%=path%>/user" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting"></my-login-sidebar>
        </c:if>
        <div class="row-fluid">
       	  <!-- aside -->
          <div class="user-aside span3">
            <div class="people">
              <div class="basic-info">
                <div class="avatar">
                  <img src="<%=path%>/${user.userImagePath}" alt="100"></div>
                <h3>
                  <a href="users/${user.userName}">${user.userName}</a></h3>
                <div class="btn-group" id="follow_mail_block_user_1534944">
                  <c:if test="${!user.isFocused}">
                  	<div id="focus_at_users" class="btn btn-small btn-success follow">
                    	<a id="focus_at_users_a" href="addFocusAtUsers(${user.id});" hidefocus="true" onFocus="this.blur()">
                      		<i id="focus_at_users_i" class="fa fa-plus"></i>
                      	<span>添加关注</span></a>
                  	</div>
                  </c:if>
                  <c:if test="${user.isFocused}">
                  	<div id="focus_at_users" class="btn btn-small follow following">
							<a id="focus_at_users_a" href="removeFocus(${user.id});" hidefocus="true" onFocus="this.blur()"><i
								id="focus_at_users_i" class="fa fa-check"></i> 正在关注</a>
						</div>
                  </c:if>
                  <a class="btn btn-small btn-list btn-success" data-toggle="dropdown" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                    <i class="fa fa-bars"></i>
                  </a>
                  <ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
                    <li>
                      <a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                        <i class="fa fa-fw fa-envelope"></i>写简信</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                      <a id="" data-remote="true" rel="nofollow" data-method="post" href="" hidefocus="true" onFocus="this.blur()">
                        <i class="fa fa-fw fa-lock"></i>加入黑名单</a>
                    </li>
                    <li class="dropdown-submenu" data-js-module="report">
                      <a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                        <i class="fa fa-fw fa-flag-o"></i>举报用户</a>
                      <ul class="dropdown-menu">
                        <li>
                          <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">广告或垃圾信息</a></li>
                        <li>
                          <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">抄袭或未授权转载</a></li>
                        <li>
                          <a data-toggle="modal" href="">其他</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
                <div class="about">
                  <p class="intro">${user.userIntroduce}</p></div>
                <div class="sns"></div>
              </div>
              <div class="user-stats">
                <ul class="clearfix">
                  <li>
                    <a href="javascript:void(0)">
                      <b>0</b>
                      <span>关注</span></a>
                  </li>
                  <li>
                    <a href="javascript:void(0)">
                      <b>0</b>
                      <span>粉丝</span></a>
                  </li>
                  <br>
                  <li>
                    <a href="users/${user.userName}">
                      <b>${essayList.size()}</b>
                      <span>文章</span></a>
                  </li>
                  <li>
                    <a href="javascript:void(0)">
                      <b>0</b>
                      <span>字数</span></a>
                  </li>
                  <li>
                    <a href="javascript:void(0)">
                      <b>0</b>
                      <span>收获喜欢</span></a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="my-books">
              <h5 class="title">我的文集：</h5>
              <ul class="unstyled">
                <c:forEach items="${corpusList}" var="corpus">
                  <li>
                    <a class="fa fa-book" href="<%=path%>/corpus/${corpus.id}"> ${corpus.corpusName}</a></li>
                </c:forEach>
              </ul>
            </div>
          </div>
          
          <!-- content -->
          <div class="span9 offset3 recent-post">
            <!-- navigation -->
            <ul class="nav nav-tabs nav-articles">
              <li class="active">
                <a data-pjax="list-container" href="">
                  <i class="fa fa-file-text-o"></i>最新文章</a>
              </li>
              <li class="">
                <a data-pjax="list-container" href="">
                  <i class="fa fa-users"></i>最新动态</a>
              </li>
              <li class="">
                <a data-pjax="list-container" href="">
                  <i class="fa fa-signal"></i>热门文章</a>
              </li>
            </ul>
            <div class="tab-content">
              <div id="list-container" class="tab-pane active">
                <ul class="article-list latest-notes">
                  <c:forEach items="${essayList}" var="essay">
                    <li class="have-img">
                      <%-- <a class="wrap-img" href="users.html?userName=${essay.userName}">
                        <img src="${user.userImagePath}" alt="300"></a>--%>
                        <div>
                          <p class="list-top">
                            <a class="author-name blue-link" target="_blank" href="<%=path%>/users/${essay.userName}">${essay.userName}</a>
                            <em>·</em>
                            <span class="time">${essay.subEssayTime}</span></p>
                          <h4 class="title">
                            <a target="_blank" href="<%=path%>/essay/${essay.id}">${essay.essayTitle}</a></h4>
                          <div class="list-footer">
                            <span>阅读 ${essay.essayReadingNumber}</span>
                            <span>· 评论 ${essay.essayCommentNumber}</span>
                            <span>· 喜欢 ${essay.essayGoodNumber}</span></div>
                        </div>
                    </li>
                  </c:forEach>
                </ul>
                <div class="hidden">
                  <div class="pagination">
                    <ul class="pagination">
                      <li class=" active">
                        <a data-remote="true" href="javascript:null;">1</a></li>
                      <li class="">
                        <a rel="next" data-remote="true" href="">2</a></li>
                      <li class="">
                        <a data-remote="true" href="">3</a></li>
                      <li class="">
                        <a data-remote="true" href="">4</a></li>
                      <li class="">
                        <a data-remote="true" href="">5</a></li>
                      <li class="next">
                        <a rel="next" data-remote="true" href="">下一页</a></li>
                      <li class="last">
                        <a data-remote="true" href="">终页</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>