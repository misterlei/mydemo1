$('.small').mousemove(function(e){
				$('.jing').show();
				$('.bigt').show();
				func(e);
			})
			// 绑定鼠标移除事件
			$('.small').mouseout(function(){
				$('.jing').hide();
				$('.bigt').hide();
			})
			//绑定鼠标
			$('.cha img').dblclick(function(){
					// alert(1)
					var cl=$(this).attr('src');
					console.log(cl)
					// $('small img').addClass(src,).siblings()
					$('.ztu').attr('src',cl);
					$('.bimg').attr('src',cl)
				})

			var px=0;
			var py=0;
			// 获取鼠标的位置


			function func(e){
				var x=e.clientX;
				var y=e.clientY;
				// console.log(x)

				// 获取小jing的长宽的一半；
				var xw=$('.jing').width()/2
				var yh=$('.jing').height()/2

				// 设计小jing的移动
				var xzou=x-xw;
				var yzou=y-yh;
				// 获取小图的偏移量
				var sx=$('.small').position().left;
				var sy=$('.small').position().top;
				// 在获取小jing在小图中的偏移
				 px=xzou-sx;
				 py=yzou-sy;
				// console.log(sx,sy,'---')
				// console.log(xzou,yzou,'ss')
				// console.log(px,py,'pp')
				// 不让小jing走出去
				if(px<=0){px=0};
				if(py<=0){py=0};
				var maxx=$('.small').width() - $('.jing').width();
				var maxy=$('.small').height() - $('.jing').height();
				if(px>=maxx){px=maxx}
				if(py>=maxy){py=maxy}
				$('.jing').css({top:py+'px',left:px+'px'})
				//获取大图显示的宽高 以及高显示的宽
				var bw= $('.bigt').width();
				var bh= $('.bigt').height();
				console.log(bw,bh)
				// 大图的宽高
				var biw=$('.bimg').width();
				var bih=$('.bimg').height();
				// 设计比例
				// 获取左边的宽高
				var zw= $('.small').width();
				var zh= $('.small').height();

				// x/zw=biw/bw
				// y/zh=bih/bh

				var o=zw*(bw/biw);
				var p=zh*(bh/bih);
				// console.log(x,y,'小jing的宽高')

				// px/zw=x/bw
				// var x=bw*(px/zw)
				// var y=bh*(py/zh)
				$('.jing').css({width:o+'px',height:p+'px'})


				// px/zw=x/bw
				var x=biw*(px/zw)
				var y=bih*(py/zh)
				// 右边走的div


				$('.bimg').css({top:-y+'px',left:-x+'px'})
			}