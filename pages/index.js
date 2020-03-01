import Page from '../components/page'
import Apps from '../components/apps'
import App from '../components/app'
import MacApp from '../components/mac-app'
import Link from 'next/link'

export default () => (
  <Page>
    <p>I’m a software engineer living in San Francisco. You can follow me on <a href="https://twitter.com/soffes" rel="external nofollow" style={{ color: "#1DA1F2" }}>Twitter</a>, see my code on <a href="https://github.com/soffes" rel="external nofollow" style={{ color: "#4078C0" }}>GitHub</a>, and watch my videos on <a href="https://youtube.com/samsoffes" rel="external nofollow" style={{ color: "#cd201f" }}>YouTube</a>. I occasionally <a href="https://soffes.blog" rel="external">blog</a> too.</p>

    <p>I’ve been working with iOS since its release in 2008—and macOS before that. Here is some of my past work. Some were full time jobs, some were for clients, and some were my own projects.</p>

    <Apps>
      <MacApp name="Contrast" image_url="/contrast.svg" url="https://usecontrast.com" />
      <App name="Bible" image_url="/bible.jpg" url="https://itunes.apple.com/app/bible/id282935706?mt=8&uo=4&at=1l3vmtU" />
      <App name="Venmo" image_url="/venmo.jpg" url="https://venmo.com/" />
      <App name="Hipstamatic" image_url="/hipstamatic.jpg" url="https://itunes.apple.com/app/hipstamatic/id342115564?mt=8&uo=4&at=1l3vmtU" />
      <App name="Litely" image_url="/litely.jpg" url="https://itunes.apple.com/app/litely/id850707754?mt=8&amp;uo=4&amp;at=1l3vmtU" />
      <App name="Houseparty" image_url="/houseparty.svg" url="https://joinhouse.party" />
      <App name="Over" image_url="/over.jpg" url="https://itunes.apple.com/app/over/id535811906?mt=8&amp;uo=4&amp;at=1l3vmtU" />
      <App name="Cheddar" image_url="/cheddar.jpg" url="https://soffes.blog/parting-ways-with-cheddar" />
      <App name="Canvas" image_url="/canvas.svg" url="https://github.com/usecanvas/ios-v1" />
      <App name="Tiiny" image_url="/tiiny.svg" url="https://medium.com/@kevinrose/we-re-shutting-down-tiiny-14254524f9b6" />
      <App name="Shares" image_url="/shares.svg" url="https://soffes.blog/shares-2" />
      <App name="Old Sport" image_url="/old-sport.svg" url="https://itunes.apple.com/app/old-sport/id1041222643?mt=8&amp;at=1l3vmtU" />
      <App name="Roon" image_url="/roon.jpg" url="https://blog.ghost.org/roon" />
      <App name="IncrediBooth" image_url="/incredibooth.jpg" url="https://itunes.apple.com/app/incredibooth/id378754705?mt=8&amp;uo=4&amp;at=1l3vmtU" />
      <App name="Obaby" image_url="/obaby.jpg" url="https://itunes.apple.com/app/obaby/id738877924?mt=8&amp;uo=4&amp;at=1l3vmtU" />
      <App name="Cape Town" image_url="/capetownlove.jpg" url="https://itunes.apple.com/app/cape-town-love/id704402892?mt=8&amp;uo=4&amp;at=1l3vmtU" />
      <App name="Coins" image_url="/coins.svg" url="https://github.com/nothingmagical/coins" />
      <App name="Seesaw" image_url="/seesaw.jpg" url="https://soffes.blog/onward" />
      <App name="Everlapse" image_url="/everlapse.jpg" url="https://soffes.blog/onward" />
      <MacApp name="Whiskey" image_url="/whiskey.png" url="http://usewhiskey.com" />
      <MacApp name="Redacted" image_url="/redacted-mac.svg" url="https://useredacted.com" title="Redacted for macOS" />
      <App name="Redacted" image_url="/redacted.svg" url="https://itunes.apple.com/app/redacted-easily-obscure-parts-of-an-image/id992003008?mt=8&amp;at=1l3vmtU" title="Redacted for iOS" />
      <MacApp name="Spotlight Tools" image_url="/spotlight-tools.png" url="https://spotlight.tools" />
    </Apps>

    <p>Feel free to email me at <a href="mailto:sam@soff.es">sam@soff.es</a> or read more <Link href="/about"><a>about me</a></Link>. 👋</p>
  </Page>
)
