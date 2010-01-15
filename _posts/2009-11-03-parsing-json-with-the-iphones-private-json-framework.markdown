---
title: Parsing JSON with the iPhone's Private JSON Framework
layout: post
---

So my post on [Cocoa web services](http://samsoff.es/post/web-services-with-cocoa-surprise/) got a lot of attention when [Gruber linked me](http://daringfireball.net/linked/2009/10/29/soffes-json-plist) the other day. This started a conversation on [Twitter](http://twitter.com/samsoffes) and basically ended up landing on using binary property lists over JSON for size and parsing, but that's for another blog post.

All of this got me thinking about how Apple does their JSON parsing, since they are obviously using JSON in several of the built in apps. I happened to notice that there was a `JSON.framework` in the Private Frameworks folder this evening. I tried [class-dump](http://www.codethecode.com/projects/class-dump/)ing it and it surprising worked! (Most of the other private frameworks I tried to class-dump didn't produce any results.)

I figured what the heck, might as well try it. It turns out that it was really easy to implement. I posted a [sample project demonstrating this on GitHub](http://github.com/samsoffes/private-json-test).

It really sucks that this is private. It works really well. I wish Apple would open this up. I know a lot of people would benefit from it. I've heard that if you link against any private frameworks in your app, it will automatically get rejected. I haven't been brave enough to test this yet.

Anyway, it's kinda a cool discovery. *[Check out my sample project on GitHub](http://github.com/samsoffes/private-json-test)*.
