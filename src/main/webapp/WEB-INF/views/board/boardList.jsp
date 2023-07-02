<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	#container {
		width: 1000px;
		margin: auto;
	}
	table {
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		border: 1px solid black;
		padding: 8px;
		text-align: center;
	}
	th {
		background-color: #f2f2f2;
	}
	td a {
		color: black;
		text-decoration: none;
	}
	.btn {
		padding: 5px 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		background-color: #fff;
		cursor: pointer;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>

<div id="container">
	<table class="table">
		<tr>
			<td colspan="6" align="right">
				<button type="button" class="btn btn-outline-secondary" id="enrollBtn">글쓰기</button>
			</td>
			</tr>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">첨부파일</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.bNo}</td>
					<td><a href="${pageContext.request.contextPath}/board/boardDetail.bo?boardNo=${board.bNo}">${board.bTitle}</a></td>
					<td>${board.bWriter}</td>
					<td>
						<c:if test="${not empty board.originalFilename}">
							<img src="${pageContext.request.contextPath}/resources/img/file.png" alt="파일" width="20px">  <!-- 글쓰기에 파일아이콘-->
						</c:if>
					</td>
					<td>${board.bCreate}</td>
					<td>${board.bCount}</td>
				</tr>
			</c:forEach>	
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pi.nowPage ne 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${pi.nowPage-1}" >Previous</a>
					</li>
				</c:if>
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<c:choose>
						<c:when test="${p eq pi.nowPage}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${p}">${p}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${p}">${p}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${ pi.nowPage ne pi.totalPage }">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${pi.nowPage+1}">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
	<script>
		document.querySelector("#enrollBtn").addEventListener('click', (e) => {
			location.href='${pageContext.request.contextPath}/board/boardForm.bo';
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
