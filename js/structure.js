// Generated by CoffeeScript 1.4.0
(function(){var e,t,n,r,i,s,o,u,a,f;i=document.getElementById("structure-sidebar");if(typeof Touch=="object"){i.classList.add("touch-enabled");n={x:void 0,y:void 0,timestamp:void 0};e={x:0,y:0,timestamp:0};s={x:50,y:50};o={timeout:300,y_threshold:3,x_threshold:3};f=function(e){if(e.touches.length===1){n.x=e.touches[0].pageX;n.y=e.touches[0].pageY;return n.timestamp=e.timeStamp}};a=function(t){if(t.touches.length===1){e.x=t.touches[0].pageX-n.x;return e.y=t.touches[0].pageY-n.y}};u=function(u){e.timestamp=u.timeStamp-n.timestamp;e.timestamp<o.timeout&&e.x*e.x<o.x_threshold*o.x_threshold&&e.y*e.y<o.y_threshold*o.y_threshold&&(i.contains(u.target)||t(u));if(e.x*e.x>s.x*s.x||e.y*e.y>s.y*s.y)if(e.x*e.x>e.y*e.y)if(n.x<15||n.x>i.offsetWidth-50&&n.x<i.offsetWidth+20){e.x>0&&r(u);e.x<0&&t(u)}e.x=0;return e.y=0};r=function(e){var t;if(i.classList.contains("active"))return!1;e.preventDefault();i.classList.add("active");return t=!0};t=function(e){var t;if(!i.classList.contains("active"))return!1;e.preventDefault();i.classList.remove("active");return t=!1};document.addEventListener("touchstart",f);document.addEventListener("touchend",u);document.addEventListener("touchmove",a)}}).call(this);