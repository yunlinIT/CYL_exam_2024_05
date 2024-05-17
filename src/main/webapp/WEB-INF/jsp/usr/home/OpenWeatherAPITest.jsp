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
                    console.log(data); // 여기서는 데이터를 콘솔에 출력할 것입니다. 필요에 따라 원하는 방식으로 데이터를 처리할 수 있습니다.
                })
                .catch(function(error) {
                    console.error('Error:', error);
                });
        }
        
        fetchWeather();
        
    </script>
</head>
<body>
    <h1>Weather Information</h1>
    <button onclick="fetchWeather()" style ="margin-top: 50px; margin-left: 50px;">Get Weather</button>
    
</body>
</html>




