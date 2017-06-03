import Header from '../components/header'
import Footer from '../components/footer'
import Section from '../components/section'
import { Follow } from 'react-twitter-widgets'

export default () => (
  <div>
    <Header />
    <Section>
      <p>I am a <a href="https://github.com/soffes" rel="external nofollow">Swift and Ruby engineer</a>, <a href="/music">musician</a>, <a href="https://dribbble.com/soffes" rel="external nofollow">wanna be designer</a>, overly passionate motorcycles, scuba, and burgers.</p>

      <p>When the iPhone SDK first came out in 2008, I wrote this app called <a href="https://youversion.com/mobile">Bible</a> that launched day one of the App Store. There are hundreds of millions of people using it now, which is really humbling. I used to own a few companies, freelanced, and worked at some startups. Notably, <a href="https://venmo.com" rel="external nofollow">Venmo</a>, <a href="http://hipstamatic.com" rel="external nofollow">Hipstamatic</a> and <a href="http://scribd.com" rel="external nofollow">Scribd</a>. Recently, I sold an app I built, <a href="https://cheddarapp.com" rel="external nofollow">Cheddar</a>, to some cool folks. <a href="https://twitter.com/intent/tweet?screen_name=soffes" rel="external nofollow">Ask me about it on Twitter</a> if you’re curious.</p>

      <p>The best way to get to know me is to listen to <a href="http://5by5.tv/founderstalk/38" rel="external nofollow">part 1</a>, <a href="http://5by5.tv/founderstalk/39" rel="external nofollow">part 2</a>, and <a href="http://5by5.tv/founderstalk/40" rel="external nofollow">part 3</a> of the Founders Talk about my life, <a href="http://nothingmagical.com" rel="external nofollow">Nothing Magical</a>, making <a href="https://cheddarapp.com" rel="external nofollow">Cheddar</a>, and what I’m doing now.</p>

      <p>My email is <a href="mailto:sam@soff.es">sam@soff.es</a>. Here’s my PGP <a href="/soffes.asc">public key</a>.</p>

      <Follow username="soffes" options={{size: "large"}} />
    </Section>
    <Footer />
  </div>
)
