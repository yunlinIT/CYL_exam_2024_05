<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="WEATHER API TEST"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather</title>
    <script>
        function fetchWeather() {
            var city = "Daejeon";
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
</head>
<body>
    <h1>Weather Information</h1>
    <div style="margin: 20px;">
        <p><strong>City:</strong> <span id="city"></span></p>
        <p><strong>Temperature:</strong> <span id="temperature"></span></p>
        <p><strong>Description:</strong> <span id="description"></span></p>
    </div>
    <button onclick="fetchWeather()" style="margin-top: 20px;">Get Weather</button>
</body>
</html>
