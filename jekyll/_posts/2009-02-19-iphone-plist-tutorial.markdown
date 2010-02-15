---
title: iPhone Plist Tutorial
layout: post
---

Many people transfer data to and from web services to the iPhone via JSON. This is a much better way than using XML. Parsing XML on the iPhone just plain sucks. It's overly complicated and super confusing. Currently the [YouVersion][] app, [Bible][], uses JSON to transfer everything back and forth from the server and it all works great.

So you're probably thinking, "So, great I'll just keep doing that." I did too until I went to one of the Apple iPhone Tech Talks. I learned a ton about how to optomize iPhone apps. One of the big things they hit on was using plists to transfer data back and forth instead of JSON or XML.

The huge benefit to using plists over JSON is that you *don't have to parse them, they are 100% native*. You can initialize an `NSDictionary` or `NSArray` with just one method.

{% highlight c %}
NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
NSArray *array = [NSArray arrayWithContentsOfURL:plistURL];
{% endhighlight %}

This is a super simple and easy way to do this. I would recommend using `NSURLConnection` to pull down your plist file to the temp directory and the run `initWithContentsOfFile:` instead of using the `initWithContentsOfURL:`. `NSURLConnection` provides some great added features, like being asynchronous and handeling HTTP auth, etc.

Feel free to grab the iPhone Plist Tutorial project source code on GitHub at [http://github.com/samsoffes/iphone-plist](http://github.com/samsoffes/iphone-plist). It's pretty straight forward. I tried to make it as simple as possible.

### Now What?
You're probably thinking, "Great, so how do I get my data into a plist?" Well, all you have to do is google up a parser for your language. I started writing one for PHP because that is what I use. It takes a PHP array (associative or nonassociative) and converts it into a plist string. You can find it in the helpers folder in [this repo](http://github.com/lifechurch/core-module/).

### Anyone Else Doing This?
I wish. It would be great if more web services offered a plist version of their API. In the new YouVersion API, we will be offering a plist format. Hopefully as the iPhone grows in popularity, this will become more and more common.

If you don't really have a choice, at least use JSON. Here is [a great library for JSON](http://code.google.com/p/json-framework/) that I currently use in [Bible][]. The next version of [Bible][] will be all plist using the new [YouVersion][] API. I can't wait :)

**Update:** I have discovered since writing this that JSON is a better way to go. You can [read my post about this](http://samsoff.es/post/web-services-with-cocoa-surprise). I no longer work on [YouVersion][], but I know they never released their API to the public (after I spent forever documenting it) and dropped plist support as well.

[YouVersion]: http://youversion.com/
[Bible]: http://youversion.com/iphone
