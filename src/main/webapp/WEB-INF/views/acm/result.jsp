<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String location = (String)session.getAttribute("location"); %>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Booking Form HTML Template</title>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<style>
#map {
	width: 33%;
    height: 990px;
    background-color: grey;
    display: inline-block;
}

#myTable {
	width: 65%;
	height: 990px;
	display: inline-block;
}

.booking-container{
	width: 100%;
}

.booking-form{
	width: 100%;
	padding: 50px;
}


.result-container{
}

.formLayout{
	width: 25%;
    float: left;

}

.width400{
	width: 400px;
}
</style>

    
</head>

<body>

	<div class="row">
		<div class="booking-container">
			<form class="booking-form" action="/acm/result" method='get' onsubmit="return checkValidation()">
				<div class="result-container">				
					<div class="">
						<div class="no-margin">
							<div class="formLayout">
								<div class="form-group width400">
								<div id="pac-container">
									<span class="form-label">Location</span> 
        <input class="form-control" id="pac-input" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'
            placeholder="Enter a location">
      </div>
									<input type="hidden" value="CW" name="type">
									
								</div>
							</div>
							
							<div class="formLayout">
								<div class="form-group form-group-3">
									<span class="form-label">Check In</span> 
									<div class="ui calendar" id="rangestart">
										<div class="ui input left icon width400">
											<i class="calendar icon"></i> 
											<input type="text" placeholder="Start" id="in" name="in" value="<c:out value="${pageMaker.cri.in}"/>">
										</div>
									</div>
								</div>
							</div>
							<div class="formLayout">
								<div class="form-group form-group-3">
									<span class="form-label">Check out</span> 
									<div class="ui calendar" id="rangeend">
										<div class="ui input left icon width400">
											<i class="calendar icon"></i> 
											<input type="text" placeholder="End" id="out" name="out" value="<c:out value="${pageMaker.cri.out}"/>">
										</div>
									</div>
								</div>
							</div>
							<div class="formLayout">
								<div class="form-group form-group-3 width400">
									<span class="form-label">Guests</span>
												<select class="form-control" id="person" name="person">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
												</select>
									<span class="select-arrow"></span>
								</div>
							</div>
						
						</div>
					</div>
					<div class="">
						<div class="form-btn form-group-1">

							<button class="submit-btn btn btn-primary btn btn-search text-uppercase" id="submitBtn" type="submit">Check
								availability</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- end of row -->


	<div id="myTable">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>숙소사진</th>
				<th>숙소 이름</th>
				<th>주소</th>
				<th>숙소설명</th>
			</tr>
		</thead>

		<c:forEach items="${list }" var="acm">
		  
			<tr class='move' href='<c:out value="${acm.acmNum}"/>' onclick="location.href='<c:out value="${acm.acmNum}"/>'" style="cursor:pointer;"> 
				<td><img alt="" src="<c:out value="${acm.acmPurl}"/>s\<c:out value="${acm.acmPname}"/>" width="100"></td>
				<td><c:out value="${acm.acmName}" /></td>
				<td><c:out value="${acm.acmCity }" /> <c:out value="${acm.acmDistr }" /> <c:out value="${acm.acmDetailaddr }" /></td>
				<td><c:out value="${acm.acmDesc }" /></td>
			</tr>
			<input type="hidden" id="latitude"
				value='<c:out value="${acm.latitude }" />'>
			<input type="hidden" id="longitude"
				value='<c:out value="${acm.longitude }" />'>
		</c:forEach>
	</table>
	<div class='pull-right'>
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} "><a
					href="${num}">${num}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>
		</ul>
	</div>

	<form id='actionForm' action="/acm/result" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
		<input type='hidden' name='person' value='<c:out value="${pageMaker.cri.person}"/>'>
		<input type='hidden' name='in' value='<c:out value="${pageMaker.cri.in}"/>'>
		<input type='hidden' name='out' value='<c:out value="${pageMaker.cri.out}"/>'>	
	</form>
	
	</div>

	
	 <div class="pac-card" id="pac-card">
      <div>
        <div id="title">
          Autocomplete search
        </div>
        <div id="type-selector" class="pac-controls">
          <input type="radio" name="type" id="changetype-all" checked="checked">
          <label for="changetype-all">All</label>

          <input type="radio" name="type" id="changetype-establishment">
          <label for="changetype-establishment">Establishments</label>

          <input type="radio" name="type" id="changetype-address">
          <label for="changetype-address">Addresses</label>

          <input type="radio" name="type" id="changetype-geocode">
          <label for="changetype-geocode">Geocodes</label>
        </div>
        <div id="strict-bounds-selector" class="pac-controls">
          <input type="checkbox" id="use-strict-bounds" value="">
          <label for="use-strict-bounds">Strict Bounds</label>
        </div>
      </div>
      <div id="pac-container">
        <input id="pac-input" type="text"
            placeholder="Enter a location">
      </div>
    </div>
    <div id="map"></div>
    <div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div>

    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() {
    	  var acmNum = "${acmNum}";
			console.log(acmNum);
			var latitude = document.getElementById("latitude").value;
			var longitude = document.getElementById("longitude").value;
			
			//숙소번호로 해당 위도,경도 값 가져옴
			<c:forEach items="${list }" var="acm">
			if("${acm.acmNum}"===acmNum){
				var latitude = ${acm.latitude};
				var longitude = ${acm.longitude};
			}
			</c:forEach>
			
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
    	  var mapLocation = {
  				lat : latVal,
  				lng : lngVal
  			};
    	  
        var map = new google.maps.Map(document.getElementById('map'), {
          center: mapLocation,
          zoom: 15
        });
        
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var types = document.getElementById('type-selector');
        var strictBounds = document.getElementById('strict-bounds-selector');

        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);

        // Set the data fields to return when the user selects a place.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
		var size_y = 60;
        var image = new google.maps.MarkerImage(
				'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',

				new google.maps.Size(size_x, size_y),
				'',
				'',
				new google.maps.Size(size_x, size_y));
        
        <c:forEach items="${list }" var="acm">
        
        var latLng = {lat:parseFloat(${acm.latitude}), lng:parseFloat(${acm.longitude})};
		var marker;

		marker = new google.maps.Marker({
			position : latLng, // 마커가 위치할 위도와 경도(변수)
			map : map,
			icon : image, // 마커로 사용할 이미지(변수)
			title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
		});
		</c:forEach>
		
       /*  var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        }); */

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);

        document.getElementById('use-strict-bounds')
            .addEventListener('click', function() {
              console.log('Checkbox clicked! New state=' + this.checked);
              autocomplete.setOptions({strictBounds: this.checked});
            });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&libraries=places&callback=initMap"
        async defer></script>
	
	<script>
    $(document).ready(function() { $("#e1").select2(); });
    
 	/* 날짜 선택(수희) */
		var today = new Date();
		
		$("#out").datepicker({
			minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()+1),
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()),
			dateFormat: 'yy-mm-dd'
		});
		$("#in").datepicker({
			minDate: 0,
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()-1),
			onSelect: function(selectedDate) {
				var nextDay = new Date(selectedDate);
				nextDay.setDate(nextDay.getDate() + 1);
			  $("#out").datepicker("option","minDate", nextDay);
				var nextMonth = new Date(selectedDate);
				nextMonth.setDate(nextMonth.getDate() + 90);
			  $("#out").datepicker("option","maxDate", nextMonth);
			},
			dateFormat: 'yy-mm-dd'
		});

		// 구글맵 api
		var address = null;

		/*  function getAddr(){
		
		     $.ajax({
		           type:'post',
		           headers:{
		               "Content-Type":"application/json"
		           },
		           async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.
		           url:"/board/category/getAddr?userId=${boardDTO.userId}",
		           dataType:"text",
		           success : function(result){
		               if ( result != null ){
		                   console.log("넘어온 값 : " + result);
		                   address = result;  
		               }
		           }
		       });
		 }; */

		function initMap1() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
/*
			getAddr();

			var latVal = $
			{
				boardDTO.lat
			}
			; // 게시글 DTO에서 위도값을 가져옴

			var lngVal = $
			{
				boardDTO.lon
			}
			; // 게시글 DTO에서 경도값을 가져옴
*/			
			var acmNum = "${acmNum}";
			console.log(acmNum);
			var latitude = document.getElementById("latitude").value;
			var longitude = document.getElementById("longitude").value;
			
			//숙소번호로 해당 위도,경도 값 가져옴
			<c:forEach items="${list }" var="acm">
			if("${acm.acmNum}"===acmNum){
				var latitude = ${acm.latitude};
				var longitude = ${acm.longitude};
			}
			</c:forEach>
			
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
			console.log('initMap');
			
			var mapLocation = {
				lat : latVal,
				lng : lngVal
			}; // 위도, 경도를 가지는 객체를 생성

			/*     var map = new google.maps.Map(document.getElementById('map'), { // 위의 div id="map" 부분에 지도를 추가하는 부분
			      zoom: 18, // 확대 정도(ZOOM)
			      center: uluru // 지도에 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함
			    });
			
			 */

			var mapOptions = {

				center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
				zoom : 15, // 지도 zoom단계
				mapTypeId : google.maps.MapTypeId.ROADMAP

			};

			var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
			mapOptions);

			var size_x = 60; // 마커로 사용할 이미지의 가로 크기
			var size_y = 60; // 마커로 사용할 이미지의 세로 크기

			// 마커로 사용할 이미지 주소

			var image = new google.maps.MarkerImage(
					'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',

					new google.maps.Size(size_x, size_y),
					'',
					'',
					new google.maps.Size(size_x, size_y));

			<c:forEach items="${list }" var="acm">
			var latLng = {lat:parseFloat(${acm.latitude}), lng:parseFloat(${acm.longitude})};
			
			var marker;

			marker = new google.maps.Marker({
				position : latLng, // 마커가 위치할 위도와 경도(변수)
				map : map,
				icon : image, // 마커로 사용할 이미지(변수)
				title : "${acm.acmName}" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
			});
			</c:forEach>
			var content = "${acm.acmName}" ; // 말풍선 안에 들어갈 내용

			// 마커를 클릭했을 때의 이벤트. 말풍선

			var infowindow = new google.maps.InfoWindow({
				content : content
			});

			google.maps.event.addListener(marker, "click", function() {
				infowindow.open(map, marker);
			});

			/*
			 단순한 마커로 default로 표시할 때 쓰는 마커 세팅
			var marker = new google.maps.Marker({
			    position: uluru,
			    map: map
			  });
			 */

		}
	</script>
	<!--
                    아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
                    key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
                 -->
	
	<script type="text/javascript">
		$("#person").val('<c:out value="${pageMaker.cri.person}"/>');
		$("#e1").val('<c:out value="${pageMaker.cri.keyword}"/>');
	
		$(document)
				.ready(
						function() {
							history.replaceState({}, null, null);

							var actionForm = $("#actionForm");
							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							 $(".move").on("click",function(e) {
												e.preventDefault();
												actionForm.append("<input type='hidden' name='acmNum' value='"
																+ $(this).attr("href")
																+ "'>");
												actionForm.attr("action","/acm/detail");
												actionForm.submit();
											}); 
						});
	</script>
	<%@include file="../includes/footer.jsp"%>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->


</html>