$(function(){

	/*  Initiation of Countdown (time in timestamp)  */
    var start = (new Date("2016/06/16 08:00:00").getTime()/1000);
    var end = new Date("2016/06/16 08:00:00");
    end.setDate(end.getDate() + 30);
    end = end.getTime()/1000;
    var today = new Date();
	$('.countdown').final_countdown({
      'start': start,
      'end': end,
      'now': today.getTime()/1000
  });

	/*  Background slide  */
	if($('body').attr('data-page') == 'coming-soon'){
		$.backstretch([
			"assets/img/background/05.png",
			"assets/img/background/04.png", 
			"assets/img/background/06.png",
		  "assets/img/background/07.png", 
		  "assets/img/background/08.png"], 
		  {
		    fade: 3000,
		    duration: 0 
		});
	}

});


