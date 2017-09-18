import Page from '../components/page'
import Apps from '../components/apps'
import App from '../components/app'
import Link from 'next/link'
import { current, past } from '../projects.json'

export default () => (
  <Page>
    <p>I’m a software engineer living in San Francisco. I work on the iOS team at <a href="https://lyft.com" rel="external nofollow" style={{ color: "#FF00BF" }}>Lyft</a>. I host a weekly podcast called <a href="http://immutable.fm" rel="external nofollow" style={{ color: "#E6645E" }}>Immutable</a>. You can follow me on <a href="https://twitter.com/soffes" rel="external nofollow" style={{ color: "#1DA1F2" }}>Twitter</a>, see my code on <a href="https://github.com/soffes" rel="external nofollow" style={{ color: "#4078C0" }}>GitHub</a>, and watch my videos on <a href="https://youtube.com/samsoffes" rel="external nofollow" style={{ color: "#cd201f" }}>YouTube</a>. I occasionally <a href="https://soffes.blog" rel="external">blog</a> too.</p>

    <p>I’ve been working with iOS since its release in 2008—and macOS before that. Here are my current projects:</p>

    <Apps>
      {current.map(({name, title, image_url, url, type}) => (
        <App key={title || name} name={name} image_url={image_url} url={url} type={type} />
      ))}
    </Apps>

    <p>Here is some of my past work. Some were full time jobs, some were for clients, and some were my own projects.</p>

    <Apps>
      {past.map(({name, title, image_url, url, type}) => (
        <App key={title || name} name={name} image_url={image_url} url={url} type={type} />
      ))}
    </Apps>

    <p>Feel free to email me at <a href="mailto:sam@soff.es">sam@soff.es</a> or read more <Link href="/about"><a>about me</a></Link>. 👋</p>
  </Page>
)
