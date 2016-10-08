# Hello!

This website is a submission to A List Apart's [10K Apart](https://a-k-apart.com/), a competition to inspire the web in just 10K. 

Because [small is beautiful](https://en.wikipedia.org/wiki/Small_Is_Beautiful), this site does all that in just 7.7KB, without a single line of JavaScript. Reducing transfer size helps make the web more affordable and accessible for people on low-data plans, and is good for the environment.

The site has:

* A slick custom animated entrance for the header (slide in and jiggle)
* A web font for the header (stripped down from an 11K .otf font to a 2K .woff2 file). This is small enough that hopefully on most devices / connections the font is loaded in time to be used in that animation just a moment after the page shows.
* Flexible typography, using locks (read [how that works](http://blog.typekit.com/2016/08/17/flexible-typography-with-css-locks/))
* A [star spangled list](http://codepen.io/techieshark/pen/EgkObw) on large enough screens

Because the process of streamlining websites should be accessible to other developers, I've included the minification process as just a list of commands in a Makefile so you can see how it works (see the `build` target). I'm using `html-minifier` and `postcss` to minifiy HTML & CSS. 
I'm using `uncss` to strip out any unused CSS rules, which is great. The only tricky thing is I had to keep my animations in a separate CSS file not processed by `uncss` since it seems to have a bug which results in removing all but the first step in multi-step animations.

Check out [the site](https://10k-portfolio-example-10kapart2016.azurewebsites.net/) and if you like it, I'd greatly appreciate your vote here: https://a-k-apart.com/gallery/10k-portfolio-example.

Questions / comments? Tweet me at [@techieshark](http://twitter.com/techieshark).

Thanks!

~ Peter
