<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>


<script src='vuejs/components/App.vue'></script>
<script src='vuejs/route/router.js'></script>
<div id="app">
    <h1>Hello App!</h1>
    <p>
        <!-- 네비게이션을 위해 router-link 컴포넌트를 사용합니다. -->
        <!-- 구체적인 속성은 `to` prop을 이용합니다. -->
        <!-- 기본적으로 `<router-link>`는 `<a>` 태그로 렌더링됩니다.-->
        <router-link to="/foo">Go to Foo</router-link>
        <router-link to="/bar">Go to Bar</router-link>
    </p>
    <!-- 라우트 아울렛 -->
    <!-- 현재 라우트에 맞는 컴포넌트가 렌더링됩니다. -->
    <router-view></router-view>
</div>