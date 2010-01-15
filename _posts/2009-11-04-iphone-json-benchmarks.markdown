---
title: iPhone JSON Benchmarks
layout: post
---

Yesterday I wrote [a post on parsing JSON with Apple's private framework](http://samsoff.es/post/parsing-json-with-the-iphones-private-json-framework). I thought it might be worth benchmarking [TouchJSON][], [JSON Framework][], and [Apple JSON][] (what I'm calling the private framework). *My results were very interesting.*

![JSON Benchmarks](http://samsoff.es/images/posts/iphone-json-benchmarks.png)

I know I [posted awhile ago that TouchJSON was really fast](http://samsoff.es/post/web-services-with-cocoa-surprise/), but I guess I got my numbers mixed up. This time I ran each test 100 times and took the average. These are the numbers from [TouchJSON][] [1.0.6](http://code.google.com/p/touchcode/downloads/list) and [JSON Framework][] [2.2.2](http://code.google.com/p/json-framework/downloads/list) running on my iPhone 3GS compiled for iPhone OS 3.1. [You can get the code on GitHub](http://github.com/samsoffes/json-benchmarks) and see for yourself.

In conclusion, *it looks like [JSON Framework][] is the one to use*, since you probably shouldn't use [Apple JSON][] in a shipping app. [JSON Framework][] was always my favorite for the clean, category-style interface. I only tested [Apple JSON][] to see how the other implementations compared to it.

[TouchJSON]: http://code.google.com/p/touchcode/
[JSON Framework]: http://code.google.com/p/json-framework/
[Apple JSON]: http://samsoff.es/post/parsing-json-with-the-iphones-private-json-framework
