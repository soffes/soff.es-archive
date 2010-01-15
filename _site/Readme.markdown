# samsoff.es

This is my blog. You can read it at <http://samsoff.es>.

It's running on [Jekyll][] (blog-aware, static site generator) and [Markdown](http://daringfireball.net/projects/markdown).

I used a lot of ideas from [Tom Preston-Werner](http://github.com/mojombo/mojombo.github.com), [Tom Ward](http://github.com/tomafro/tomafro.net), and [Alex Payne](http://github.com/al3x/al3x.github.com).

Feel free to use anything here except my posts without asking.

### Running Locally

Be sure you have all of the gems required by running

    sudo rake gems:install

To start the server, run

    rake server

This will start the server at <http://localhost:4000/>.

You will probably want to [Compass][] in watch mode as well. Run this command to have [Compass][] watch the sass directory.

    rake compass:watch

[Jekyll]: http://github.com/mojombo/jekyll
[Compass]: http://compass-style.org/
