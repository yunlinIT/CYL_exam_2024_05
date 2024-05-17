<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="FAQ"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.btn {
	background-color: #ffdfd4
}

.btn:hover {
	background-color: #fad2c3;
	border: solid 1px #fad2c3;
}
</style>

</head>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">


		<div class="area-for-badge mx-auto" style="width: 50%; position: relative;">
			<button class="btn btn-sm " type="button" onclick="history.back();">뒤로가기</button>
			<br>
			<br>
			<div class="badge badge-outline" style="margin-bottom: 10px;">${faqCount }개</div>
		</div>


		<!-- 검색창 -->
		<div class="mb-4 flex justify-center" style="margin-top: 50px;">
			<div class="flex"></div>
			
			<form action="">
				<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="검색어를 입력해주세요"
					class="input-sm input input-bordered w-48 max-w-xs" style="margin-top: 5px;" />
				<button class="btn btn-ghost btn-sm" type="submit">검색</button>
			</form>
			
		</div>
	</div>
	<table class="table-box-1 table mx-auto custom-table" style="width: 50%;">
		<colgroup>
			<col style="width: 8%" />
			<col style="width: 50%" />
			<col style="width: 50%" />
		</colgroup>
		<thead>
			<tr>
				<th style="background-color: #ffdfd4;">번호</th>
				<th style="text-align: center; background-color: #ffdfd4;">질문</th>
				<th style="background-color: #ffdfd4;">답변</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="faq" items="${FAQ }">
				<tr class="hover">
					<td>${faq.id }</td>
					<td>${faq.question }</td>
					<td>${faq.answer }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>



<%@ include file="../common/foot.jspf"%>