# soff.es

This is my website. It's pretty simple. My blog is [on Ghost](http://blog.soff.es).

## Running Locally

**Note:** I am using Ruby 2.0.0 both on Heroku and locally.

Get the source (obviously)

    $ git clone https://github.com/soffes/soff.es.git
    $ cd soff.es

Import my latest posts:

    $ rake update_post

Now you can start the server with [Shotgun](https://github.com/rtomayko/shotgun):

    $ bundle exec shotgun

Then open <http://localhost:9393> in your browser to see it running. If you have issues getting it up and running, [send me an email](mailto:sam@soff.es).
