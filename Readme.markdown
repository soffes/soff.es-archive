# soff.es

This is my website. It's pretty simple. My blog is at [blog.soff.es](https://blog.soff.es).

## Running Locally

**Note:** I am using Ruby '2.3.1' locally.

Get the source (obviously)

    $ git clone https://github.com/soffes/soff.es.git
    $ cd soff.es

Import my latest posts:

    $ rake update:blog

Now you can start the server with [Foreman](https://github.com/theforeman/foreman):

    $ bundle exec foreman start

Then open <http://localhost:5000> in your browser to see it running. If you have issues getting it up and running, [send me an email](mailto:sam@soff.es).
