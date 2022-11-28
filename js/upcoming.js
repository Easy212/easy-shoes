        $(function (){
            var index=0;
        $('#btnNewMore').click(function(){
            index = $('#newShoseArea').css('height');
            if(parseInt(index)  < 2800){
                $('#newShoseArea').animate({
                    height: '+=' + 500
                });
                }else{
                    $('#btnNewMore').html('발매 예정 상품이 없습니다')
                    .css({
                        color: '#FF2424',
                        fontSize: 3+'em',
                        cursor: 'default',
                        letterSpacing: '2px',
                        'margin-bottom': '20px'
                    });
                }
        });
        });