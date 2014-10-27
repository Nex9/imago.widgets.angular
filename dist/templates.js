angular.module("ImagoWidgetsTemplates", []).run(["$templateCache", function($templateCache) {$templateCache.put("/imagoWidgets/contact-widget.html","<div class=\"nex form\"><form name=\"nexContact\" ng-submit=\"submitForm(nexContact.$valid)\" novalidate=\"novalidate\"><div class=\"nex field\"><label for=\"name\">Name</label><input type=\"text\" name=\"name\" ng-model=\"contact.name\" placeholder=\"Name\" require=\"require\"/></div><div class=\"nex field\"><label for=\"email\">Email</label><input type=\"email\" name=\"email\" ng-model=\"contact.email\" placeholder=\"Email\" require=\"require\"/></div><div class=\"nex field\"><label for=\"message\">Message</label><textarea name=\"message\" ng-model=\"contact.message\" placeholder=\"Your message.\" require=\"require\"></textarea></div><div class=\"nex checkbox\"><input type=\"checkbox\" name=\"subscribe\" ng-model=\"contact.subscribe\" checked=\"checked\"/><label for=\"subscribe\">Subscribe</label></div><div class=\"formcontrols\"><button type=\"submit\" ng-disabled=\"nexContact.$invalid\" class=\"send\">Send</button></div></form><div class=\"sucess\"><span>Thank You!</span></div><div class=\"error\"><span>Error!</span></div></div>");
$templateCache.put("/imagoWidgets/controls-widget.html","<div stop-propagation=\"stop-propagation\" class=\"controls\"><a ng-click=\"togglePlay()\" ng-hide=\"isPlaying\" class=\"video-play fa fa-play\"></a><a ng-click=\"togglePlay()\" ng-show=\"isPlaying\" class=\"video-pause fa fa-pause\"></a><span class=\"video-time\">{{currentTime | time}}</span><span class=\"video-seekbar\"><input type=\"range\" ng-model=\"currentTime\" min=\"0\" max=\"{{duration}}\" ng-change=\"seek(currentTime)\" class=\"seek\"/></span><a ng-click=\"toggleSize()\" class=\"size\">{{wrapperStyle.size}}</a><span class=\"volume\"><span ng-click=\"volumeUp()\" class=\"fa fa-volume-up icon-volume-up\"></span><input type=\"range\" ng-model=\"volumeInput\" ng-change=\"onVolumeChange(volumeInput)\"/><span ng-click=\"volumeDown()\" class=\"fa fa-volume-down icon-volume-down\"></span></span><a ng-click=\"fullScreen()\" class=\"video-fullscreen fa fa-expand\"></a><a class=\"video-screen fa fa-compress\"></a></div>");
$templateCache.put("/imagoWidgets/image-widget.html","<div in-view=\"visible = $inview\" responsive-events=\"responsive-events\" ng-style=\"elementStyle\" ng-class=\"status\" visible=\"visible\" class=\"imagoimage imagowrapper\"><div ng-style=\"imageStyle\" class=\"imagox23\"></div><div class=\"loading\"><div class=\"spin\"></div><div class=\"spin2\"></div></div></div>");
$templateCache.put("/imagoWidgets/search-widget.html","<div class=\"search\"><input/><div class=\"clear\"></div></div>");
$templateCache.put("/imagoWidgets/slider-widget.html","<div ng-class=\"elementStyle\"><div ng-transclude=\"ng-transclude\"></div><div ng-style=\"sliderStyle\" ng-swipe-left=\"goPrev()\" ng-swipe-right=\"goNext()\" class=\"nexslider {{confSlider.animation}}\"><div ng-show=\"confSlider.enablearrows &amp;&amp; loadedData\" ng-click=\"goPrev($event)\" stop-propagation=\"stop-propagation\" class=\"prev\"></div><div ng-show=\"confSlider.enablearrows &amp;&amp; loadedData\" ng-click=\"goNext($event)\" stop-propagation=\"stop-propagation\" class=\"next\"></div><div ng-class=\"{\'active\': $index === currentIndex, \'nextslide\': $index === nextIndex, \'prevslide\': $index === prevIndex}\" ng-repeat=\"slide in slideSource\" ng-show=\"displaySlides($index)\" ng-switch=\"slide.kind\" class=\"slide\"><div imago-video=\"imago-video\" dimensions=\"dimensions\" source=\"slide\" sizemode=\"{{ $parent.confSlider.sizemode }}\" align=\" slide | meta: \'align\' \" ng-switch-when=\"Video\"></div><div imago-image=\"imago-image\" dimensions=\"dimensions\" source=\"slide\" sizemode=\"{{ $parent.confSlider.sizemode }}\" align=\" slide | meta: \'align\' \" ng-switch-default=\"ng-switch-default\"></div></div></div></div>");
$templateCache.put("/imagoWidgets/video-widget.html","<div ng-class=\"{loading: loading}\" in-view=\"visible = $inview\" visible=\"visible\" responsive-events=\"responsive-events\" class=\"imagovideo {{wrapperStyle.backgroundPosition}} {{wrapperStyle.size}} {{wrapperStyle.sizemode}}\"><div ng-style=\"wrapperStyle\" ng-class=\"{playing: isPlaying}\" class=\"imagowrapper\"><a ng-hide=\"loading\" ng-click=\"togglePlay()\" ng-class=\"{playing: isPlaying}\" stop-propagation=\"stop-propagation\" class=\"playbig fa fa-play\"></a><video ng-style=\"videoStyle\"><source ng-repeat=\"format in videoFormats\" src=\"{{format.src}}\" data-size=\"{{format.size}}\" data-codec=\"{{format.codec}}\" type=\"{{format.type}}\"/></video><div imago-controls=\"imago-controls\" ng-style=\"controlStyle\" ng-if=\"controls\" ng-show=\"hasPlayed\"></div></div></div>");}]);