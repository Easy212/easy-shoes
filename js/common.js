$(function (){
    $('.mainMenu>li').eq(0).hover(function(){
        $('header').stop().animate({
            height: 210
        },300).css("oparcity","0.5");
    }, function(){
        $('header').stop().animate({
            height: 110
        },300);
    });

    $('.mainMenu>li').eq(1).hover(function(){
        $('header').stop().animate({
            height: 160
        },300);
    }, function(){
        $('header').stop().animate({
            height: 110
        },300);
    });

    $('.mainMenu>li').eq(2).hover(function(){
        $('header').stop().animate({
            height: 210
        },300);
    }, function(){
        $('header').stop().animate({
            height: 110
        },300);
    });

    $('.mainMenu>li').eq(3).hover(function(){
        $('header').stop().animate({
            height: 265
        },300);
    }, function(){
        $('header').stop().animate({
            height: 110
        },300);
    });

    $('.mainMenu>li').eq(4).hover(function(){
        $('header').stop().animate({
            height: 245
        },300);
    }, function(){
        $('header').stop().animate({
            height: 110
        },300);
    });
});

$(function (){
    /*여기서부터
    var size = $('.main_img').css('width');
    $('.main_img').append($('.viimg').first().clone());
    $('.main_img').prepend($('.viimg').eq(-2).clone());

    $('.right_control').click(function(){
            $('.viimg').animate({
                left: '-=' + size
            });
    });

    $('.left_control').click(function(){
        $('.viimg').animate({
            left: '+=' + size
        });
        
    });
    function moveSlider(index){
        $('.main_img').animate({
                left: -(index*600)
            },'slow');
        }
    
   여기까지 재확인 */
    
    var size = parseInt($('.main_img>img').css('width'));
    $('.main_img').append($('.viimg').first().clone());
    $('.main_img').prepend($('.viimg').eq(-2).clone());
    var index = 1
    $('.main_img').css('left', -1811);
    
    $('.left_control').click(function(){
        if(index > 1){
            index--
            moveSlider(index);
        }else{
            $('.main_img').css('left', -10826);
            index = 5;
            moveSlider(index);
        }
    })

    $('.right_control').click(function(){
        if(index < 5){
            index++
            moveSlider(index);
        }else{
            $('.main_img').css('left',0);
                index = 1; 
                moveSlider(index);
        }
    })
    function moveSlider(index){
        $('.main_img').animate({
                left: -(index*size+(10))
        },500)
    }
});