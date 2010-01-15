---
title: I Released an iPhone Push Notification Gem
layout: post
---

I forked a Rails plugin for sending push notifications with Rails awhile back for a client project. I've had a few people fork and add cool little fixes.

I've been wanting to play with [GemCutter][] for awhile now. How hard could it be to release a Rails plugin as a gem, right? I sat down and rewatched a [Railscast](http://railscasts.com/episodes/183-gemcutter-jeweler) on how to build a gems with [Jeweler][] and push it to [GemCutter][]. It turns out, that was the easy part. [GemCutter][] and [Jeweler][] made it so easy to publish my plugin as gem.

So I know this is very backwards, but *after* it was on [GemCutter][] I tested it my new gem. (Yes, many smacks on the hand for not writing test. I'm still learning all of that.) It turns out, that it was completely broken. I started to try and fix things, but ended up doing a complete rewrite.

Before, it would add the model in the plugin to your search path and then you would have to run a custom rake task in the plugin to add the table and migrate the database for the model. This always felt a little dirty, so I abstracted it all out. Now you can do:

{% highlight ruby %}
class Device < ActiveRecord::Base
    acts_as_pushable
end
{% endhighlight %}

Pretty cool, right? Now sending is as easy as

{% highlight ruby %}
d.send_notification :alert => "Hello world!"
{% endhighlight %}

(`d` being an instance of `Device` of course). You can read the [full readme on GitHub](http://github.com/samsoffes/apple_push_notification). (Yes, another smack on the hand for no RDoc.)

Anyway, my code is probably very bad, as I'm pretty new to Ruby and Rails. I was very proud of myself for figuring it out. *[Check out the gem](http://github.com/samsoffes/apple_push_notification)* and let me know if you find it useful or stupid.



[GemCutter]: http://gemcutter.org
[Jeweler]: http://github.com/technicalpickles/jeweler