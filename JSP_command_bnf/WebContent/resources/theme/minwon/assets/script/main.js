"use strict";

document.addEventListener("DOMContentLoaded", function(){
	
	var TopBanner = document.querySelector(".top-banner");
	
	$(TopBanner).on("init", function(event, slick){
		var isAuto = slick.options.autoplay;
			
		var controls = document.createElement("div");
		controls.classList.add("slick-controls");
		
		var prev = document.createElement("button");
		prev.classList.add("slick-prev");
		prev.innerText = "이전 배너";
		
		var next = document.createElement("button");
		next.classList.add("slick-next");
		next.innerText = "다음 배너";
		
		var play = document.createElement("button");
		play.classList.add("slick-play");
		play.dataset.played = isAuto;
		play.innerText = isAuto ? "자동 슬라이드 정지하기" : "자동 슬라이드 시작하기";
		
		prev.addEventListener("click", function(){
			$(TopBanner).slick("slickPrev");
		});
		
		next.addEventListener("click", function(){
			$(TopBanner).slick("slickNext");
		});
		
		play.addEventListener("click", function(){
			
			isAuto = Boolean(this.dataset.played === 'true');
			
			if(isAuto){
				$(TopBanner).slick("slickPause");
			} else {
				$(TopBanner).slick("slickPlay");
			}

			play.innerText = !isAuto ? "자동 슬라이드 정지하기" : "자동 슬라이드 시작하기";
			this.dataset.played = String(!isAuto);

		});
		
		
		controls.appendChild(prev);
		controls.appendChild(play);
		controls.appendChild(next);
		
		TopBanner.appendChild(controls);
	});
	
	$(TopBanner).slick({
		dots: false,
		arrows:false,
		autoplay: true,
		speend: 1000,
		autoplaySpeed: 5000
	});
});
  