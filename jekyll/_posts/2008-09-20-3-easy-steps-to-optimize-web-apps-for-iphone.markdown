---
title: 3 Easy Steps to Optimize Web Apps for iPhone
layout: post
---

So I recent improved how my blog looks and works on iPhone in just a few lines of code.  The iPhone web browser is awesome, but for large websites, it is really hard to read something without panning around vertically and then scrolling horizontally. Solving these issues will make your site way more useable on Mobile Safari.

* *Add an iPhone specific stylesheet.* Something you will probably want to do is make your site narrower. The wider your layout is, the smaller everything has to be. It is much easier to scroll just vertically than vertically and horizontally. Something else to watch out for is mixing font sizes between px and em. You'll probally get some weird scalling issues if you mix units. You might also watch out for positioning issues due to Mobile Safari's scaling.

    You might also want to adjust your font sizes a bit. I know I had to make my footer a tad smaller. In your case, you might want to make important things like navigation larger and easier to tap. Feel free to check out my iPhone specific stylesheet at [http://samsoffes.com/css/iphone.css](http://samsoffes.com/css/iphone.css).

* *Add a viewport meta tag.* This will tell Mobile Safari how to intelligently scale to fit your page. It's super easy to do and it will help a lot. My iPhone stylesheet makes my site 320px wide so I set my viewport to 320 to give a new bit of padding around my main content area. Here's the code:
    {% highlight html %}<meta name="viewport" content="width=320" />{% endhighlight %}
    
Remember if you have something that is wider than your viewport, it will automatically expand, so be sure to resize it in your iPhone specific stylesheet.

* *Add a homescreen icon.* When a user adds your website to their homescreen, you want it have a facny icon. You can easily do this by putting a 57px x 57px png named `apple-touch-icon.png` at the root of your website. For example mine is at [http://samsoffes.com/apple-touch-icon.png](http://samsoffes.com/apple-touch-icon.png). You can also put it at a different location with this link tag:

    {% highlight html %}<link rel="apple-touch-icon" href="custom-icon.png" />{% endhighlight %}

Doing these three simple things will make your web app way more useable on the iPhone. You can do most of this in about 10 minutes like I did. If your layout is overlly complex and can't be made narrower and simplier easily, then you'll have a lot more work than 10 minutes of course. Have at it!

Oh, and don't forget a [favicon.ico](http://en.wikipedia.org/wiki/Favicon) for your desktop users.
