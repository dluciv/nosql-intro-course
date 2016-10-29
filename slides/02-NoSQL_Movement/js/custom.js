// Custom JS code can go here

// You can customize Reveal options:
Reveal.configure({
	center: true,
	minScale: 0.25,
	maxScale: 1.0,
        width:    1600,
        height:   1200,
	dependencies: [
	        { src: 'plugin/zoom-js/zoom.js', async: true },
        	{ src: 'plugin/notes/notes.js', async: true },
		{ src: 'plugin/math/math.js', async: true }
	]
});
Reveal.initialize(); // .configure does not add math...

// (an outdated version of) http://headjs.com/ is also loaded
head.ready("lodash.min.js", function () {
  // LoDash can be used from here
});

head.js("https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min.js");
