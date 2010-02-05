---
title: My Take on using Ruby on Rails
layout: post
---

So I recently decided to give [Ruby on Rails][] another chance. For many of the same reasons I gave [jQuery][] a chance. I'll use this decision as an example, so bear with me for a second.

I was a huge fan of [MooTools][] (and still am), but I decided to give [jQuery][] a chance. I liked [MooTools][] better. I thought it was superior to [jQuery][] in its organization and many other things. You have to admit that [MooTools][]'s animations look way better.

All of that said, two things made me switch: *the amount of code I didn't have to write* and *the huge community around it*. 

With [jQuery][] you write a lot less code than you do with [MooTools][]. I sometimes feel that its a lot less elegant, but less code equals quicker development time. 

My biggest frustration with [MooTools][] was that they changed major stuff in every release (at least when I was using it about a year ago). This means that if you needed a lightbox, you could find a few, but none of them would work with the current version. If you searched for [jQuery][] ones, you could find tons of them.

### On to Rails

I took the same approach when I was giving [Ruby on Rails][] another chance. I knew the community was huge. It seems Rails is growing in popularity every day. All of the [PHP][] programmers I knew were either dabbling in [WordPress][] or writing really ugly, non-MVC code. It just seems that it's hard to find a PHP programmer doing cool stuff these days. I know a few don't get me wrong, the number just seems less and less.

Any one writing stuff in Rails is doing it in the [MVC (model, view, controller) design pattern](http://en.wikipedia.org/wiki/Model-view-controller). I'm a huge MVC fan, so that was attractive to me. 

### First Impressions

I watched [Creating a weblog in 15 minutes](http://media.rubyonrails.org/video/rails_blog_2.mov) from the [Ruby on Rails][] website. It blew me away. It was amazing how much code you didn't have to write, which is the entire purpose of a framework. A framework is designed to solve common problems so everyone doesn't have to solve them again and again. Rails seemed to solve more of these problems than any other framework I've used, and it did it very well.

I [downloaded Rails](http://rubyonrails.org/download) and gave it a shot. I just followed along with that video to create a simple weblog in an hour or so.  I was really impressed with myself on how quickly I could code it.

### But, Rails isn't as good as PHP is it?

Well that depends on how you define "good". To me a good web development environment is one that lets me develop the quickest. Before [Ruby on Rails][] it was [KohanaPHP][] (which I totally recommend if you're using [PHP][]). If Rails lets me developer faster and write less code (which generally equals less bugs), then to me that makes it a win. I believe it does. There is **way** less code in my Rails version of my blog than my Kohana one.

It has been proven many times that [Ruby][] is slower than [PHP][]. That doesn't bother me at all. If I'm writing a large web app, I'm going to be caching as much as possible anyway, so what's the point. If I can roll out features quicker at a tiny performance hit for when the cache misses, that is a win in my book.

[Ruby on Rails]: http://rubyonrails.org/
[jQuery]: http://jquery.com/
[MooTools]: http://mootools.net/
[PHP]: http://php.net/
[WordPress]: http://wordpress.org/
[KohanaPHP]: http://kohanaphp.com/
[Ruby]: http://ruby-lang.org/
