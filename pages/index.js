import Header from '../components/header'
import Footer from '../components/footer'
import Section from '../components/section'
import Apps from '../components/apps'
import App from '../components/app'
import Heading from '../components/heading'
import SubHeading from '../components/subheading'

export default () => (
  <div>
    <Header />
    <Section>
      <Heading>Hello</Heading>
      <p>I'm a software engineer living in Louisville, KY. I currently work as a Swift freelancer. I co-host two weekly podcasts: <a href="http://immutable.fm" rel="external nofollow">Immutable</a> &amp; <a href="http://runtime.fm" rel="external nofollow">Runtime</a>. I also really enjoy motorcycles and a good burger. If you're curious, find out <a href="/about">more about me</a>.</p>

      <Heading>Apps</Heading>
      <p>I started developing for iOS the day the SDK was released way back in 2008. Here are some of the best apps I've worked on. I'm no longer involved in the development of several of these since some belong to previous employers.</p>

      <Apps>
        <App name="Bible" image_url="/static/bible.jpg" url="https://itunes.apple.com/app/bible/id282935706?mt=8&uo=4&at=1l3vmtU" />
        <App name="Hipstamatic" image_url="/static/hipstamatic.jpg" url="https://itunes.apple.com/app/hipstamatic/id342115564?mt=8&uo=4&at=1l3vmtU" />
        <App name="IncrediBooth" image_url="/static/incredibooth.jpg" url="https://itunes.apple.com/app/incredibooth/id378754705?mt=8&amp;uo=4&amp;at=1l3vmtU" />
        <App name="Litely" image_url="/static/litely.jpg" url="https://itunes.apple.com/app/litely/id850707754?mt=8&amp;uo=4&amp;at=1l3vmtU" />
        <App name="Over" image_url="/static/over.jpg" url="https://itunes.apple.com/app/over/id535811906?mt=8&amp;uo=4&amp;at=1l3vmtU" />
        <App name="Obaby" image_url="/static/obaby.jpg" url="https://itunes.apple.com/app/obaby/id738877924?mt=8&amp;uo=4&amp;at=1l3vmtU" />
        <App name="Cape Town" image_url="/static/capetownlove.jpg" url="https://itunes.apple.com/app/cape-town-love/id704402892?mt=8&amp;uo=4&amp;at=1l3vmtU" />
      </Apps>

      <SubHeading>Retired Apps</SubHeading>
      <p>Much of my past work is no longer available. Here‘s some highlights from the graveyard.</p>

      <Apps>
        <App name="Old Sport" image_url="/static/old-sport.svg" url="https://itunes.apple.com/app/old-sport/id1041222643?mt=8&amp;at=1l3vmtU" />
        <App name="Cheddar" image_url="/static/cheddar.jpg" url="https://soffes.blog/parting-ways-with-cheddar" />
        <App name="Shares" image_url="/static/shares.svg" url="https://soffes.blog/shares-2" />
        <App name="Roon" image_url="/static/roon.jpg" url="https://blog.ghost.org/roon" />
        <App name="Coins" image_url="/static/coins.svg" url="https://github.com/nothingmagical/coins" />
        <App name="Seesaw" image_url="/static/seesaw.jpg" url="https://soffes.blog/onward" />
        <App name="Everlapse" image_url="/static/everlapse.jpg" />
        <App name="Canvas" image_url="/static/canvas.svg" url="https://github.com/usecanvas/ios-v1" />
      </Apps>
    </Section>
    <Footer />
  </div>
)
