# soff.es

This is my blog. It's pretty simple. It stores all of the posts in Redis. They are updated via GitHub post-commit hook. My posts are stored [here](https://github.com/soffes/blog).

## Running Locally

**Note:** I am using Ruby 2.0.0 both on Heroku and locally.

Get the source (obviously)

    $ git clone https://github.com/soffes/soff.es.git
    $ cd soff.es

Import my posts:

    $ rake import

Now you can start the server with [Foreman](https://github.com/ddollar/foreman):

    $ bundle exec shotgun

Then open <http://localhost:9292> in your browser to see it running. If you have issues getting it up and running, [send me an email](mailto:sam@soff.es).
