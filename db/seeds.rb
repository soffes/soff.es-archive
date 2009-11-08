# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Post.delete_all


# Oldest
Post.create({
  :title  => "iPhone Plist Tutorial",
  :content => "Many people transfer data to and from web services to the iPhone via JSON. This is a much better way than using XML. Parsing XML on the iPhone just plain sucks. It's overly complicated and super confusing. Currently the [YouVersion][] app, [Bible][], uses JSON to transfer everything back and forth from the server and it all works great.\n\nSo you're probably thinking, \"So, great I'll just keep doing that.\" I did too until I went to one of the Apple iPhone Tech Talks. I learned a ton about how to optomize iPhone apps. One of the big things they hit on was using plists to transfer data back and forth instead of JSON or XML.\n\nThe huge benefit to using plists over JSON is that you *don't have to parse them, they are 100% native*. You can initialize an `NSDictionary` or `NSArray` with just one method.\n\n    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];\n    NSArray *array = [NSArray arrayWithContentsOfURL:plistURL];\n\nThis is a super simple and easy way to do this. I would recommend using `NSURLConnection` to pull down your plist file to the temp directory and the run `initWithContentsOfFile:` instead of using the `initWithContentsOfURL:`. `NSURLConnection` provides some great added features, like being asynchronous and handeling HTTP auth, etc.\n\nFeel free to grab the iPhone Plist Tutorial project source code on GitHub at [http://github.com/samsoffes/iphone-plist](http://github.com/samsoffes/iphone-plist). It's pretty straight forward. I tried to make it as simple as possible.\n\n### Now What?\nYou're probably thinking, \"Great, so how do I get my data into a plist?\" Well, all you have to do is google up a parser for your language. I started writing one for PHP because that is what I use. It takes a PHP array (associative or nonassociative) and converts it into a plist string. You can find it in the helpers folder in [this repo](http://github.com/lifechurch/core-module/).\n\n### Anyone Else Doing This?\nI wish. It would be great if more web services offered a plist version of their API. In the new YouVersion API, we will be offering a plist format. Hopefully as the iPhone grows in popularity, this will become more and more common.\nIf you don't really have a choice, at least use JSON. Here is [a great library for JSON](http://code.google.com/p/json-framework/) that I currently use in [Bible][]. The next version of [Bible][] will be all plist using the new [YouVersion][] API. I can't wait :)\n\n[YouVersion]: http://youversion.com/\n[Bible]: http://youversion.com/iphone"
})

Kernel::sleep 1
Post.create({
  :title => "I Like Gowalla",
  :content => "[Gowalla][] is a cool newish iPhone game from [Alamofire][] (I love those guys). Here's the official blurb:\n\n> [Gowalla][] is about going new places, doing remarkable things and meeting great people along the way.\n\nI really enjoy using it. I took a small vacation with [my mother](http://www.facebook.com/dsoffes) to Denver, CO this week. We were hanging out in Estes Park wondering where to eat. I popped open [Gowalla][] and found a [nice little place](http://gowalla.com/spots/17941) to eat dinner. After we ate, we walked around town and got all of the [other spots](http://twitpic.com/hdtso) in Estes Park (I even [created one](http://gowalla.com/spots/24508)).\n\nNow I'm hooked. I have the urge to hit ever spot around me to get the stamp on [my Gowalla password](http://gowalla.com/samsoffes). I'm a sucker for points and achievements. Not to mention there's the whole items part, which is a lot of fun.\n\nGo give [Gowalla][] a try and [friend me up](http://gowalla.com/samsoffes). It's fun. I promise.\n\n[Gowalla]: http://gowalla.com/\n[Alamofire]: http://alamofire.com/"
})

Kernel::sleep 1
Post.create({
  :title => "Markdownr.com",
  :content => "[Markdownr.com][] is a neat little tool I wrote in a couple of hours for myself. I wanted a quick way to preview [markdown][] (if you don't know what markdown is, you should [go read about it](http://daringfireball.net/projects/markdown)) since I write all of my blog posts in [markdown][].\n\nIt's a pretty simple site. Just type on the left, and see your rendered HTML on the right. All of the parsing is done with [Maruku](http://maruku.rubyforge.org/) in a [Rails Metal](http://weblog.rubyonrails.org/2008/12/17/introducing-rails-metal), so it's real fast.\n\nI wanted to be a good citizen, and give it all away, so you can get all of my code [on GitHub](http://github.com/samsoffes/markdownr.com). Feel free to fork and improve.\n\n[Markdownr.com]: http://markdownr.com\n[markdown]: http://daringfireball.net/projects/markdown"
})

Kernel::sleep 1
Post.create({
  :title => "New Blog on GitHub and Jekyll",
  :content => "So today I moved my blog from [Ruby on Rails](http://rubyonrails.org) on [SliceHost](http://slicehost.com) to [Jekyll][] on [GitHub](http://github.com). It only took a two hours to figure it out and move everything over.\n\nThe main reason for moving to the new setup (besides the fact that I love redoing my blog for some reason) was being able to manage all of my posts via [Markdown][] files locally, then pushing then up with [Git](http://git-scm.com) when I had a good version. [Jekyll][] lets me do this easily and quickly.\n\nI'm going to give this a shot for now. I don't really want to write a blogging platform, even thought I've written a ton. I just like programming. Now that I have more projects than I have time for, I'm looking for something simple that I can simply post with. When I roll my own solution, I end up working on it for a few hours each time instead of just writing my post.\n\nAnyway, enjoy the new blog and feel free to checkout the [source code on GitHub](http://github.com/samsoffes/samsoffes.github.com).\n\n[Jekyll]: http://github.com/mojombo/jekyll\n[Markdown]: http://daringfireball.net/projects/markdown"
})

# Newest
Kernel::sleep 1
Post.create({
  :title => "Parsing JSON with the iPhone's Private JSON Framework",
  :content => "So my post on [Cocoa web services](http://samsoff.es/post/web-services-with-cocoa-surprise/) got a lot of attention when [Gruber linked me](http://daringfireball.net/linked/2009/10/29/soffes-json-plist) the other day. This started a conversation on [Twitter](http://twitter.com/samsoffes) and basically ended up landing on using binary property lists over JSON for size and parsing, but that's for another blog post.\n\nAll of this got me thinking about how Apple does their JSON parsing, since they are obviously using JSON in several of the built in apps. I happened to notice that there was a `JSON.framework` in the Private Frameworks folder this evening. I tried [class-dump](http://www.codethecode.com/projects/class-dump/)ing it and it surprising worked! (Most of the other private frameworks I tried to class-dump didn't produce any results.)\n\nI figured what the heck, might as well try it. It turns out that it was really easy to implement. I posted a [sample project demonstrating this on GitHub](http://github.com/samsoffes/private-json-test).\n\nIt really sucks that this is private. It works really well. I wish Apple would open this up. I know a lot of people would benefit from it. I've heard that if you link against any private frameworks in your app, it will automatically get rejected. I haven't been brave enough to test this yet.\n\nAnyway, it's kinda a cool discovery. *[Check out my sample project on GitHub](http://github.com/samsoffes/private-json-test)*."
})
