# samsoff.es

**Note: This is a massive work in progress. Pretty much everything is broken or incomplete.**

This is my new blog I am rewriting in Rails. I [moved my blog to Jekyll](http://samsoff.es/post/new-blog-on-github-and-jekyll/) a few weeks ago and really missed playing with a Rails app, so I'm moving it back and starting from scratch.

My current blog is still at <http://samsoff.es>. You can see this version at <http://new.samsoff.es> until I make it live.

## Running Locally

I'm very proud to be using the new [Bundler](http://github.com/wycats/bundler) (which you need to install if you haven't already). I'm also using Postgres. If you don't have it already, you'll need to install it. I wrote [a blog post on how to install Nginx and Postgres](http://samsoff.es/post/running-rails-local-development-with-nginx-postgres-and-passenger-with-homebrew/) that might be helpful. You can skip over the Nginx parts if you want.

Run the following queries to setup the user in Postgres:

    $ psql postgres
    # CREATE USER samsoffes SUPERUSER;
    # \q

Now all you need to do to get going, all you need to is bundle and setup the database:

    $ gem bundle
    $ rake db:create
    $ rake db:schema:load

If you have issues getting it up and running, [send me an email](mailto:sam@samsoff.es).

## Goals for new version

* Use [Heroku](http://heroku.com) for hosting
* Use [Cucumber](http://cukes.info) for integration testing
* Use [RSpec](http://rspec.info) for unit testing
* Use something like [Jammit](http://github.com/documentcloud/jammit) or [Heroku Asset Packager](http://github.com/amasses/heroku_asset_packager) for assets
* Use [Bundler](http://github.com/wycats/bundler) for gem awesomeness
* Cleaner backend
* Tags with [virtual attributes](http://railscasts.com/episodes/167-more-on-virtual-attributes)
* New homepage
* Integrate music podcast into app
* Move music to [the sky is blue](http://blue.samsoff.es)
* Create podcast for screencasts
* Support old URLs and move to new restful URLs
* Implement [CanCan](http://github.com/ryanb/cancan) for admin permissions
* Show recent social activity
    * [Twitter](http://twitter.com/samsoffes) - most recent tweet
    * [Last.fm](http://last.fm/user/samsoffes) - most listened to band for this week
    * [Flickr](http://www.flickr.com/photos/samsoffes) - recent photos

### Dream goals

* Use [Cappuccino](http://cappuccino.org) for admin
* Implement custom music player
