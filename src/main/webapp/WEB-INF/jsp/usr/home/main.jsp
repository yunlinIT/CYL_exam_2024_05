<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>


<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<style>
.big-outer-box {
	width: auto;
	height: 1500px;
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
}

.small-outer-box {
	width: 100%;
	height: 100%;
	display: flex;
	margin-top: 50px;
	flex-direction: column;
	margin-bottom: 250px;
}

.search-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
	padding-top:40px;
}

.area-search-box {
	height: auto;
	margin-top: 50px;
}

.search-input {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-btn {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.content-box {
	display: flex;
	justify-content: center; /* 좌우 가운데 정렬 */
	width: 100%; /* 부모 요소의 전체 너비를 사용 */
}

.area-outer-box {
	width: 50%;
}

/* 날씨 박스  */
.weather-outer-box {
	display: flex;
	justify-content: center; /* 좌우 가운데 정렬 */
	width: 100%; /* 부모 요소의 전체 너비를 사용 */
	margin-top: 20px;
}

.weather-info {
	width: 150px;
	height: 150px;
	border: none;
	border-radius: 12px;
	font-weight: bold;
	color: black;
	background-color: ffdfd4;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
	font-size: 20px;
	line-height: 1.6;
}

.weather-info div {
	margin: 10px 0;
}

/* 대전 관광지 목록  */
.tour-spot-box {
	display: none; /* 초기 상태에서는 숨김 */
	width: 100%;
	height: 80%;
	display: flex;
	justify-content: center;
	margin-top: 50px;
}

.tour-spot-small-box {
	width: 90%;
	height: 50%;
	display: flex;
	justify-content: center;
}

.tour-info-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.tour-info-table, .tour-info-table th, .tour-info-table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.tour-info-table th {
	background-color: #f3f4f6; /* 연한 회색 배경 */
	color: #333; /* 어두운 글씨 */
}

.area-select-box {
text-align: center;
}

h1 {
	text-align: center;
	margin-top: 50px; /* margin-top을 50px로 줄였습니다. */
	font-size: 18px;
	color: black;
	font-weight: bold; /* 글씨를 두껍게 만듭니다. */
}
</style>





<div class="big-outer-box">
	<div class="small-outer-box">
		<!-- FAQ 검색창 및 버튼 -->
		<h1>질문을 해주세요</h1>
		<div class="search-container">
			<form action="../FAQ/search" method="POST">
				<input name="searchKeyword" type="text" id="faq-search" class="search-input" placeholder="FAQ 검색">
				<button type="submit" class="search-btn" style="background-color: #ffdfd4;">검색</button>
			</form>
		</div>


		<h1>지역별 날씨와 관광지를 찾아보세요</h1>

		<!-- 날씨 SELECT -->
		<div class="weather-outer-box">
			<div class="weather-small-outer-box">
				<!-- 날씨 정보 표시 요소 -->
				<div id="weather-info" class="weather-info mt-4 text-center">
					<p id="city" style="font-size: 12px;"></p>
					<p id="temperature"></p>
					<p id="description" style="font-size: 13px;"></p>
				</div>
			</div>
		</div>
		<div class="content-box">
			<div class="area-outer-box">
				<!-- 지역 select 박스 -->
				<div class="area-select-box mt-4">
					<select id="region-select" class="search-input" onchange="fetchWeather(); handleRegionChange();">
						<option value="" selected disabled>지역을 선택해주세요</option>
						<option value="Daejeon">대전</option>
						<option value="Seoul">서울</option>
						<option value="Busan">부산</option>
						<option value="Los Angeles">로스앤젤레스</option>
						<option value="Paris">파리</option>
						<option value="Bangkok">방콕</option>
						<option value="Tokyo">도쿄</option>
						<option value="Moscow">모스크바</option>
						<option value="Madrid">마드리드</option>
						<option value="Paris">파리</option>
					</select>
				</div>
			</div>
		</div>

		<div class="tour-spot-box" id="tour-spot-box">
			<div class="tour-spot-small-box">
				<table class="tour-info-table">
					<thead>
						<tr>
							<th style="background-color: #ffdfd4;">위치</th>
							<th style="background-color: #ffdfd4;">전화번호</th>
							<th style="background-color: #ffdfd4;">한줄소개</th>
							<th style="background-color: #ffdfd4;">관광시간</th>
							<th style="background-color: #ffdfd4;">홈페이지</th>
						</tr>
					</thead>
					<tbody>
						<!-- 첫 번째 행 -->
						<tr>
							<td>대전 시립미술관</td>
							<td>042-123-4567</td>
							<td>현대미술 중심의 전시 공간</td>
							<td>09:00 - 18:00</td>
							<td>
								<a href="http://museum.daejeon.go.kr">방문하기</a>
							</td>
						</tr>
						<!-- 두 번째 행 -->
						<tr>
							<td>대전 과학기술 박물관</td>
							<td>042-860-2200</td>
							<td>과학의 원리를 체험하고 배울 수 있는 공간</td>
							<td>09:00 - 17:00</td>
							<td>
								<a href="http://science.daejeon.go.kr">방문하기</a>
							</td>
						</tr>
						<!-- 세 번째 행 -->
						<tr>
							<td>한밭수목원</td>
							<td>042-270-8485</td>
							<td>자연과 함께하는 힐링의 장소</td>
							<td>08:00 - 19:00</td>
							<td>
								<a href="http://hanbat.daejeon.go.kr">방문하기</a>
							</td>
						</tr>
						<!-- 네 번째 행 -->
						<tr>
							<td>대전 동물원</td>
							<td>042-580-4820</td>
							<td>다양한 동물들을 가까이에서 만나볼 수 있는 동물원</td>
							<td>09:00 - 17:00</td>
							<td>
								<a href="https://zoo.daejeon.go.kr">방문하기</a>
							</td>
						</tr>
						<!-- 다섯 번째 행 -->
						<tr>
							<td>엑스포 과학공원</td>
							<td>042-250-1234</td>
							<td>과학과 예술이 어우러진 창의적인 놀이 공간</td>
							<td>10:00 - 18:00</td>
							<td>
								<a href="http://expo.daejeon.go.kr">방문하기</a>
							</td>
						</tr>
					</tbody>

				</table>
			</div>

		</div>
	</div>
</div>


<script>
	function handleRegionChange() {
		var selectedRegion = document.getElementById("region-select").value;
		var tourSpotBox = document.getElementById("tour-spot-box");

		// "대전"이 선택되었을 때만 tour-spot-box를 보여줌
		if (selectedRegion === "Daejeon") {
			tourSpotBox.style.display = "flex"; // 관광지 목록 보이기
		} else {
			tourSpotBox.style.display = "none"; // 관광지 목록 숨기기
		}
	}

	// 페이지 로드 시 초기 상태 확인
	document.addEventListener('DOMContentLoaded', handleRegionChange);
</script>



<script>
	// 검색 함수
	function searchFAQ() {
		// 입력된 검색어 가져오기
		var searchQuery = document.getElementById("faq-search").value;

		// 여기서 검색 로직을 추가하고 검색 결과를 보여줄 수 있도록 구현
		// 예: AJAX 요청을 사용하여 서버에서 검색 결과를 가져와서 동적으로 화면에 표시
		// 검색 결과는 ".news" 클래스를 가진 요소 안에 추가되도록 설정
	}
</script>



<script>
    function fetchWeather() {
        var city = document.getElementById('region-select').value;
        var apiKey = "4aeb4c84293bc9b4109638849c3b309c";
        var lang = "kr";
        var apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&lang=" + lang + "&units=metric";

        fetch(apiUrl)
            .then(function(response) {
                return response.json();
            })
            .then(function(data) {
                console.log(data); // 데이터를 콘솔에 출력합니다.

                // 받아온 데이터를 HTML에 삽입합니다.
                document.getElementById('city').textContent = data.name;
                document.getElementById('temperature').textContent = data.main.temp + "°C";
                document.getElementById('description').textContent = data.weather[0].description;
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
    }

    // 페이지 로드 시 날씨 데이터를 가져옵니다.
    window.onload = fetchWeather;
</script>