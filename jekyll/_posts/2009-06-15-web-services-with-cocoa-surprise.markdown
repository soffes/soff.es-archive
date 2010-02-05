---
title: Web Services with Cocoa Surprise
layout: post
---

This week I have a talk at the first [Oklahoma City CocoaHeads](http://cocoaokc.org) meeting. I was going to talk about transferring data from web services with plists. I spend most of the day working on SSConnection, my simple Foundation class for easily transferring plist data from a web service to a Cocoa application.

I was so into plists because at the Austin iPhone Tech talk I attended, they encouraged you to transfer data in plists because it had native parsing. I have to admit the native parsing is quite awesome. One method and everything is all parsed and ready.

I was using [JSON](http://www.json.org/) (javascript object notation) to transfer everything with the [JSON Framework][]. I had started switching everything to use plists. I spend a ton of time writing a PHP class to convert arrays to and from plist strings.

When I was preparing for my talk I decided to do some benchmarks to show how much more awesome plists were than JSON. The plist version was about 8 times faster than my [JSON Framework][] version. I was pretty happy with that result. My friend, [Jake](http://twitter.com/withfoam), said he was using [TouchJSON][] to parse JSON in his apps, so I figured I'd go ahead and benchmark that one too. I was expecting [JSON Framework][] to beat it because the interface to the [JSON Framework][] is a lot simpler than the interface to [TouchJSON][].

What I found was **very** surprising. [TouchJSON][] actually beat plists. It was slightly faster in every test I ran. This is awesome because plists have a much larger file size. They are usually about twice as big as JSON files due to all of the extra markup.

I am keeping everything using JSON now instead of switching to plist. JSON will transfer twice as fast and parse faster than plists do. Awesome.

Sorry to everyone I preached plists to. I assumed Apple would be correct. They were not.

**Update 10/29/09:** Several people have suggested using binary plists instead, as they are actually much smaller than XML. I chose the XML style ones because they were much easier to manipulate. Hopefully there is an implementation of `plutil -convert` for Ruby out there.

[TouchJSON]: http://code.google.com/p/touchcode/
[JSON Framework]: http://code.google.com/p/json-framework
