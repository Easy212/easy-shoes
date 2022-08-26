//스마트폰 감지
let smartPhones = ['iphone', 'ipod', 'ipad', 'opera mini', 'opera mobi', 'nokia', 'android', 'webos', 'windows ce', 'blackberry', 'imobile', 'sonyericssion'];

//스마트폰 구분
for(let i in smartPhones){
    if(navigator.userAgent.toLowerCase().match(new RegExp(smartPhones[i]))){ // .toLowerCase() > 대문자를 소문자로
        document.location='http://gxwlgns.dothome.co.kr/mindex.html';
    } 
}



//alert(navigator.userAgent); //위 폰들을 제외하고 다른폰 종류의 이름을 확인하는법