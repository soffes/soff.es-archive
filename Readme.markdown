# samsoff.es

This is my blog. You can read it at <http://samsoff.es>.

It's running on [Jekyll][] (blog-aware, static site generator) on [Sinatra][] with [Markdown](http://daringfireball.net/projects/markdown).

I used a lot of ideas from [Tom Preston-Werner](http://github.com/mojombo/mojombo.github.com), [Tom Ward](http://github.com/tomafro/tomafro.net), and [Alex Payne](http://github.com/al3x/al3x.github.com). I also used the technique for running Jekyll on Sinatra from [Jesse Storimer's blog](http://jstorimer.com/2009/12/29/jekyll-on-heroku.html).

Feel free to use anything here except my posts without asking.

## Running Locally

Be sure you have all of the gems required by running

    gem bundle

To start, run `rake jekyll:auto` in one tab, and `rake server` in another.

This will start the server at <http://localhost:9393/>.

You will probably want to [Compass][] in watch mode as well. Run this command to have [Compass][] watch the sass directory. You'll need to restart the server each time you change a sass file though (which sucks, I know).

    rake compass:watch

Running `rake jekyll` will remove the [Jekyll][] cache and rebuild it. You can read [Rakefile](http://github.com/samsoffes/samsoff.es/blob/master/Rakefile) for more information.

[Jekyll]: http://github.com/mojombo/jekyll
[Sinatra]: http://sinatrarb.com
[Compass]: http://compass-style.org
