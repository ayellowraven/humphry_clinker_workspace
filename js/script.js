/*  Author:

	Basic media queries, set in pixels to better deal
	with images. I've included a basic image replacement
	examples for responsive images but you'll want to
	edit your own based on how the how the images work
	in your layout.

*/

/*  Sets UA properies as cookies for server-side optimizations
	Call required scripts on page load.
*/
$(document).ready(function() {
	getWindowProperties();
	getScreenProperties();
	$("html").removeClass('no-js');
	if ($('#book_chapter_page').length) { silenceNav(); }

	if ($.cookie('eohc-reading-mode') == 'explore') {
		$("body").removeClass("quiet").addClass("explore");
	}

	if ($.cookie('eohc-reading-mode') == 'quiet') {
		$("body").removeClass("explore").addClass("quiet");
	}

	/* Checking Day/night mode */
	if ($.cookie('night') == 'yes'){
		$("body").addClass('night');
		$("a#day-night").addClass("entypo-light-down").removeClass("entypo-light-up");
	}
	
	$('div#local a, div#local button, div#global a, div#utilities a, div#utilities button').tipsy({trigger:'focus', gravity:'n'});
	$('nav#toc a, nav#toc button').tipsy({trigger:'focus',gravity:'s'});
	$('.vtoc-chapters *').tipsy({trigger:'focus',gravity:'e',html: true});
	$('div#local a, div#local button, div#global a, div#utilities a, div#utilities button').tipsy({gravity:'n'});
	$('nav#toc a, nav#toc button').tipsy({gravity:'s'});
	$('.vtoc-chapters *').tipsy({gravity:'e',html: true});
});
$(window).resize(getWindowProperties);
$(screen).resize(getScreenProperties);

/* Kerning the stupid headlines */
$("article > h1, article > h2").lettering();

/* Help info modal window */
$("a[href=#info]").colorbox({inline:true, href:"#info"});

/* Toggle Permalinks */
$("button#show-permalinks").click(function() {
	$("body").toggleClass("permalinks",750);
});


/* Switch Day/Night mode */
$("button#day-night").click(
	function() {
		var cookieNight = $.cookie('night');
		$("body").toggleClass("night",750);
		$("button#day-night").toggleClass("entypo-light-down").toggleClass("entypo-light-up");

		if (cookieNight === null || cookieNight === 'no') {
			$.cookie('night', 'yes', {path:'/'});
		}

		else if (cookieNight === 'yes') {
			$.cookie('night', 'no', {path:'/'});
		}
});
/* Switch reading mode */
$('button#quiet').click(function() {
	$("body").removeClass('explore').addClass('quiet');
	$.cookie('eohc-reading-mode','quiet', {path:'/'});
	$('button#quiet').addClass('active');
	$('button#explore').removeClass('active');
	$('#toc li a').attr("title",function() {
		var originalTitle = $(this).attr("original-title");
		
	/* Need to replace this with regex when I’m not lazy */
		return originalTitle.replace(" (From Matthew Bramble.)","")
							.replace(" (From Tabitha Bramble.)","")
							.replace(" (From Winifred Jenkins.)","")
							.replace(" (From Winifred Jenkins.)","")
							.replace(" (From Jery Melford.)","")
							.replace(" (From Lydia Melford.)","")
							.replace(" (From Wilson.)","")
							.replace(" (From Jonathan Dustwich)","")
							.replace(" (From Henry Davis.)","");
	});	
});
$('button#explore').click(function() {
	$("body").removeClass('quiet').addClass('explore');
	$.cookie('eohc-reading-mode','explore', {path:'/'});
	$('button#explore').addClass('active');
	$('button#quiet').removeClass('active');
	$('#toc li a').attr("title",function(){
		var originalTitle = $(this).attr("original-title");
		if ($(this).hasClass("matthew-bramble")) {
			return originalTitle + " (From Matthew Bramble.)"
		}
		if ($(this).hasClass("tabitha-bramble")) {
			return originalTitle +  " (From Tabitha Bramble.)"
		}
		if ($(this).hasClass("winifred-jenkins")) {
			return originalTitle +  " (From Winifred Jenkins.)"
		}
		if ($(this).hasClass("jery-melford")) {
			return originalTitle +  " (From Jery Melford.)"
		}
		if ($(this).hasClass("lydia-melford")) {
			return originalTitle +  " (From Lydia Melford.)"
		}
		if ($(this).hasClass("wilson")) {
			return originalTitle +  " (From Wilson.)"
		}
		if ($(this).hasClass("jonathan-dustwich")) {
			return originalTitle +  " (From Jonathan Dustwich)"
		}
		if ($(this).hasClass("henry-davis")) {
			return originalTitle + " (From Henry Davis.)"
		}
	});
});

/* Keyboard shortcuts */
$(document).keypress(function(keypress) {
    if ($(keypress.target).is('input, textarea')) {
    	/* Kills keypress when in an input or textarea */
    }
    
    else {
		switch (keypress.which) {
		
			case 104:
				window.location = $("[role=banner] h1 a").attr('href');
			break;
		
			case 116:
				window.location = $("[role=banner] h1 a").attr('href') + '/chapter/';
			break;
			
			case 102:
				window.location = $("[role=banner] h1 a").attr('href') + '/search/';
			break;
			
			case 112:
				$("body").toggleClass("permalinks",750);
			break;
	
			case 98:
				if($(".back a").length) { window.location = $(".back a").attr('href'); }
			break;
	
			case 110:
				if($(".next a").length) { window.location = $(".next a").attr('href'); }
			break;
	
			case 103:
				window.location = $(".entypo-bookmark").attr('href');
			break;
	
			case 115:
				if($("button#set-bookmark").length) {
					$("button#set-bookmark").trigger('click').attr('disabled', true).attr('title','');
					$("a.entypo-bookmark").addClass('active').attr("href", window.location.pathname).attr("title","You’re Here!");
					$("#toc a.bookmark").removeClass('bookmark');
				}
	
			break;
	
			case 100:
				var cookieNight = $.cookie('night');
				$("body").toggleClass("night",750);
				$("button#day-night").toggleClass("entypo-light-down").toggleClass("entypo-light-up");
	
				if (cookieNight === null || cookieNight === 'no') {
					$.cookie('night', 'yes', {path:'/'});
				}
	
				else if (cookieNight === 'yes') {
					$.cookie('night', 'no', {path:'/'});
				}
			break;
	
			case 113:
				$("body").removeClass('explore').addClass('quiet');
				$.cookie('eohc-reading-mode','quiet', {path:'/'});
				$('button#quiet').addClass('active');
				$('button#explore').removeClass('active');
				$('#toc li a').attr("title",function() {
					var originalTitle = $(this).attr("original-title");
					
				/* Need to replace this with regex when I’m not lazy */
					return originalTitle.replace(" (From Matthew Bramble.)","")
										.replace(" (From Tabitha Bramble.)","")
										.replace(" (From Winifred Jenkins.)","")
										.replace(" (From Winifred Jenkins.)","")
										.replace(" (From Jery Melford.)","")
										.replace(" (From Lydia Melford.)","")
										.replace(" (From Wilson.)","")
										.replace(" (From Jonathan Dustwich)","")
										.replace(" (From Henry Davis.)","");
				});
			break;
	
			case 101:
				$("body").removeClass('quiet').addClass('explore');
				$.cookie('eohc-reading-mode','explore', {path:'/'});
				$('button#explore').addClass('active');
				$('button#quiet').removeClass('active');
				$('#toc li a').attr("title",function(){
					var originalTitle = $(this).attr("original-title");
					if ($(this).hasClass("matthew-bramble")) {
						return originalTitle + " (From Matthew Bramble.)"
					}
					if ($(this).hasClass("tabitha-bramble")) {
						return originalTitle +  " (From Tabitha Bramble.)"
					}
					if ($(this).hasClass("winifred-jenkins")) {
						return originalTitle +  " (From Winifred Jenkins.)"
					}
					if ($(this).hasClass("jery-melford")) {
						return originalTitle +  " (From Jery Melford.)"
					}
					if ($(this).hasClass("lydia-melford")) {
						return originalTitle +  " (From Lydia Melford.)"
					}
					if ($(this).hasClass("wilson")) {
						return originalTitle +  " (From Wilson.)"
					}
					if ($(this).hasClass("jonathan-dustwich")) {
						return originalTitle +  " (From Jonathan Dustwich)"
					}
					if ($(this).hasClass("henry-davis")) {
						return originalTitle + " (From Henry Davis.)"
					}
				});
			break;
			
			case 105:
				$.colorbox({inline:true, href:"#info"});
			break;
		}
    }
});

/* Only < 48em */
if (Modernizr.mq('only screen and (max-width: 767px)')) {

}

/* Anything > 48em */
if (Modernizr.mq('only screen and (min-width: 768px)')) {

	/* Replaces a mobile full-width image at 768px into one at 960px
	
	   Similar to the ideas in
	 - https://github.com/joshje/Responsive-Enhance and
	 - https://github.com/filamentgroup/Responsive-Images
	   but takes advantage of the JIT image manipulation
	   extension that is included by default.
	*/

	$('img').attr('src', function(index, attr) {
		return attr.replace('image/1/768', 'image/1/960');
	});

}

/* Between 48em and 60em */
if (Modernizr.mq('only screen and (min-width: 768px) and (max-width: 960px)')) {

}

/* Anything > 60em */
if (Modernizr.mq('only screen and min-width: 960px)')) {
}


/* High pixel density */
if (window.devicePixelRatio >= 1.5) {

}

/* Portrait orientation */
if (window.orientation == 0 || 180) {

}

/* Landscape orientation */
if (window.orientation == 90 || 240) {

}