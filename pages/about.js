import Page from '../components/page'
import { Follow } from 'react-twitter-widgets'

export default () => (
  <Page>
    <p>I am a <a href="https://github.com/soffes" rel="external nofollow">Swift and Ruby engineer</a>, <a href="https://soundcloud.com/soffes" rel="external nofollow">musician</a>, <a href="https://dribbble.com/soffes" rel="external nofollow">wanna be designer</a>, overly passionate motorcycles and <a href="https://unsplash.com/soffes" rel="external nofollow">scuba</a>. I currently live in San Francisco.</p>

    <p>When the iPhone SDK first came out in 2008, I wrote this app called <a href="https://youversion.com/mobile" rel="external nofollow">Bible</a> that launched on day one of the App Store. There are hundreds of millions of people using it now—which is really humbling. I used to own a few companies, freelance, and work at a few startups. Notably, <a href="https://venmo.com" rel="external nofollow">Venmo</a>, <a href="http://hipstamatic.com" rel="external nofollow">Hipstamatic</a> and <a href="http://scribd.com" rel="external nofollow">Scribd</a>. I used to work on an app called <a href="https://cheddarapp.com" rel="external nofollow">Cheddar</a> a lot of people used to like. <a href="https://twitter.com/intent/tweet?screen_name=soffes" rel="external nofollow">Ask me anything on Twitter</a> if you’re curious.</p>

    <p>The best way to get to know me is to listen to <a href="http://5by5.tv/founderstalk/38" rel="external nofollow">part 1</a>, <a href="http://5by5.tv/founderstalk/39" rel="external nofollow">part 2</a>, and <a href="http://5by5.tv/founderstalk/40" rel="external nofollow">part 3</a> of the Founders Talk about my life, <a href="http://nothingmagical.com" rel="external nofollow">Nothing Magical</a>, and making <a href="https://cheddarapp.com" rel="external nofollow">Cheddar</a>. You can also listen to my weekly podcast called <a href="http://immutable.fm" rel="external nofollow">Immutable</a>.</p>

    <p>My email is <a href="mailto:sam@soff.es">sam@soff.es</a>. Here’s my PGP <a href="/soffes.asc">public key</a>.</p>

    <Follow username="soffes" options={{size: "large"}} />
  </Page>
)
