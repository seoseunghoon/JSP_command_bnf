"use strict";

//브라우저 메소드 처리
if(!Element.prototype.matches){
	Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSeletor;
}

document.addEventListener("DOMContentLoaded", function(){
	
	var orgWidth = window.innerWidth;
	
	var Header = document.querySelector("#header");
	var Search = Header.querySelector(".header-search-btn");
	var Nav = Header.querySelector(".header-nav");
	var Menu = Header.querySelectorAll(".header-nav-menu > li > a");
	var Back = Header.querySelector(".header-nav-back");
	var NavBtn = Header.querySelector(".btn-nav");
	var DropDown = Header.querySelectorAll(".dropdown");
	var LastMenu = Nav.querySelectorAll("a")[Nav.querySelectorAll("a").length-1];
	var Skip = document.querySelector("#skipNav > a");
	
	//이벤트 핸들러
	var eventHandle = {
			//PC버전 메뉴 드롭다운
			menuMouseOver : function(){
				var e = this;
				var isActive = Header.matches(".active");
				
				if(!isActive){
					Header.classList.add("active");
					
					var hasSub = this.nextElementSibling;
					var subMenu = Nav.querySelectorAll(".header-nav-sub");
					var heightArr = new Array();
					
//					Nav.removeEventListener("mouseleave", eventHandle.navMouseLeave);
					
					Array.prototype.forEach.call(subMenu, function(obj,index){
						obj.style.height = "auto";
						obj.style.padding = "1em";
						
						heightArr.push(obj.offsetHeight);
						
						obj.removeAttribute("style");
						
						obj.style.height = "0";
						obj.style.padding = "0 1em";
						obj.style.overflow = "hidden";
					});
					
					heightArr.sort(function(a, b){
						return b - a;
					});
					
					setTimeout(function(){
						
						Array.prototype.forEach.call(Menu, function(obj,index){
							obj.parentElement.querySelector(".header-nav-sub").style.transition = "all 0.5s ease";
							obj.parentElement.querySelector(".header-nav-sub").style.height = heightArr[0]+"px";
							obj.parentElement.querySelector(".header-nav-sub").style.padding = "1em";
							obj.removeEventListener("mouseover", eventHandle.menuMouseOver);
						});
						
						Back.style.height = heightArr[0]+"px";
						
						setTimeout(function(){
//							Nav.addEventListener("mouseleave", eventHandle.navMouseLeave);
							
							Array.prototype.forEach.call(Menu, function(obj,index){
								obj.parentElement.querySelector(".header-nav-sub").style.overflow = "auto";
							});
						}, 500);
					}, 100);
				}
			},
			//PC버전 메뉴 드롭업
			navMouseLeave : function(){
				var subMenu = Nav.querySelectorAll(".header-nav-sub");
				var isActive = Header.matches(".active");
				
				if(isActive){
					Header.classList.remove("active");
					
					setTimeout(function(){
						
						Array.prototype.forEach.call(subMenu, function(obj,index){
							obj.style.height = "0px";
							obj.style.padding = "0 1em";
							obj.style.overflow = "hidden";
						});
						
//						Array.prototype.forEach.call(Menu, function(obj,index){
//							obj.parentElement.classList.remove("active");
//						});
						
						Back.removeAttribute("style");
						
						setTimeout(function(){
							
							Array.prototype.forEach.call(subMenu, function(obj,index){
								obj.removeAttribute("style");
							});
							
							Array.prototype.forEach.call(Menu, function(obj,index){
								obj.parentElement.classList.remove("active");
								obj.addEventListener("mouseover", eventHandle.menuMouseOver);
							});
							
							
						}, 500);
					}, 100);
				}
			},
			//모바일 버전 메뉴 열기/닫기
			navBtnClick : function(){
				var isActive = Header.matches(".active");
				if(isActive){
					Header.classList.remove("active");
				} else {
					Header.classList.add("active");
					eventHandle.activeMenuEvent();
				}
			},
			//모바일 서브메뉴 드롭다운
			dropDownClick : function(){
				var e = this;
				var subMenu = this.parentElement.querySelector("ul");
				var isActive = this.parentElement.classList.contains("active");

				var el = e;
				var orgMenuHeight = 0;
				var parentSubNav = null;
				
				while((el = el.parentElement)){
					/*if(el.classList.contains("header-nav-sub")){
						parentSubNav = el;
					}*/
					if(el.matches(".header-nav-sub")){
						parentSubNav = el;
					}
				}
				
				if(parentSubNav){
					orgMenuHeight = parentSubNav.offsetHeight;
				}
				
				
				if(isActive){
					var subMenuHeight = subMenu.offsetHeight;
					
					if(parentSubNav){
						parentSubNav.style.height = (orgMenuHeight - subMenuHeight) + "px";
					}
					
					e.innerText = "하위메뉴 열기";
					
					subMenu.style.height = "0px";
					
					setTimeout(function(){
						e.parentElement.classList.remove("active");
						subMenu.removeAttribute("style");
					}, 500);
					
				} else {
					this.parentElement.classList.add("active");

					e.innerText = "하위메뉴 닫기";
					
					subMenu.style.height = "auto"
						
					var subMenuHeight = subMenu.offsetHeight;
					
					subMenu.style.height = "0px";
					
					setTimeout(function(){
						
						if(parentSubNav){
							parentSubNav.style.height = (orgMenuHeight + subMenuHeight) + "px";
						}
						
						subMenu.style.height = subMenuHeight+"px";
					}, 100);
					
				}
			},
			//건너뛰기 링크
			skipNavClick : function(e){
				e.preventDefault();
				
				var id = this.getAttribute("href");
				
				document.querySelector(id).setAttribute("tabindex",0);
				document.querySelector(id).focus();
				document.querySelector(id).removeAttribute("tabindex");
			},
			//모바일 검색창 열기/닫기
			searchShowHide : function(){
				var Area = this.nextElementSibling;
				var isActive = this.matches(".active");
				
				if(isActive){
					this.classList.remove("active");
				} else {
					this.classList.add("active");
				}
			},
			//브라우저 창 크기 변경시 이벤트 초기화/재할당
			resizeEventHandle : function(){
				if(orgWidth != window.innerWidth){
					orgWidth = window.innerWidth;
					responseEventHandle();
				}
			},
			//현재 메뉴 엑티브
			activeMenuEvent : function(){
				var activeMenu = Nav.querySelectorAll("li.superActive");
				
				Array.prototype.forEach.call(activeMenu, function(obj,index){
					obj.classList.add("active");
				});
				
				Array.prototype.forEach.call(activeMenu, function(obj,index){
					var ul = obj.querySelector("ul");
					
					if(ul){
						var height = ul.offsetHeight;
						console.log(height)
						ul.style.height = height+"px";
					}
				});
			}
	}
	
	//초기실행 이벤트
	var init = function(){
		
		Skip.addEventListener("click", eventHandle.skipNavClick);
		
		Search.addEventListener("click", eventHandle.searchShowHide);
		
		Array.prototype.forEach.call(DropDown, function(obj,index){
			obj.addEventListener("click", eventHandle.dropDownClick);
		});
		
		window.addEventListener("resize", eventHandle.resizeEventHandle);
		
		responseEventHandle();
	}
	
	//반응형 이벤트핸들
	function responseEventHandle(){
		resetActiveStyle();
		resetEventHandle();
		
		if(orgWidth > 1200){
			
			Array.prototype.forEach.call(Menu, function(obj,index){
				obj.addEventListener("mouseover", eventHandle.menuMouseOver);
				obj.addEventListener("focus", eventHandle.menuMouseOver);
			});
			
			Nav.addEventListener("mouseleave", eventHandle.navMouseLeave);
			LastMenu.addEventListener("focusout", eventHandle.navMouseLeave);
		} else {
			NavBtn.addEventListener("click", eventHandle.navBtnClick);
		}
		
	}
	
	//스타일/클래스 초기화 핸들
	function resetActiveStyle(){
		Header.classList.remove("active");
		Search.classList.remove("active");
		Back.removeAttribute("style");
		
		Array.prototype.forEach.call(Nav.querySelectorAll(".header-nav-sub"), function(obj,index){
			var uls = obj.querySelectorAll("ul");
			
			obj.removeAttribute("style");
			
			Array.prototype.forEach.call(uls, function(ul, indx){
				ul.removeAttribute("style");
			})
		});
		
		Array.prototype.forEach.call(Nav.querySelectorAll("li"), function(obj,index){
			obj.classList.remove("active");
			obj.removeAttribute("style");
		});
	}
	
	//이벤트 초기화 핸들
	function resetEventHandle(){
		Nav.removeEventListener("mouseleave", eventHandle.navMouseLeave);
		NavBtn.removeEventListener("click", eventHandle.navBtnClick);
		LastMenu.removeEventListener("focusout", eventHandle.navMouseLeave);
		
		Array.prototype.forEach.call(Menu, function(obj,index){
			obj.removeEventListener("mouseover", eventHandle.menuMouseOver);
			obj.removeEventListener("focus", eventHandle.menuMouseOver);
		});
	}
	
	//최초 실행
	init();
});