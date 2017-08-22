const express = require('express')
const next = require('next')
const path = require('path')

const dev = process.env.NODE_ENV !== 'production'
const app = next({ dev })
const handle = app.getRequestHandler()

const redirects = [
  { from: '/music', to: 'https://soundcloud.com/soffes' },
  { from: '/talks', to: 'https://speakerdeck.com/soffes' },
  { from: '/resume', to: 'https://github.com/soffes/resume/blob/master/Sam%20Soffes%20Resume.pdf?raw=true' },
  { from: '/clock', to: 'https://github.com/soffes/clock-saver' },
  { from: '/blog', to: 'https://soffes.blog' }
]

const oldPostSlugs = ['the-motorola-rokr', 'ipod-scare', 'apple-boot-camp-public-beta1', 'quote-of-the-week', 'quote-of-the-week-2', 'new-bravia-video', 'web-20-look-coming', 'wwdc-2006-and-new-at-apple', 'treo-600', 'facebook-makes-me-smile', 'idvd-6-awesome-crap', 'new-get-a-mac-ads', 'using-garageband-as-a-guitar-pedal', 'i-got-accepted-to-taylor-university', 'my-quote-of-the-week-4', 'my-quote-of-the-week-3', 'why-i-click-google-ads', 'my-quote-of-the-week-2', 'quote-of-the-week-3', 'famous-quote-of-the-week', 'apple-is-amazing', 'my-quote-of-the-week', 'apple-slaps-vista-in-the-face', 'i-give-up', 'i-got-an-iphone', 'coming-soon', 'the-oo-page', 'sidebar-widgets', 'internet-explorer-is-stupid', 'iphone-update-1-1-1-and-installer-app', 'installer-app-on-iphone-1-1-1-finally', 'logic-pro-studio-is-awesome', 'goodbye-codeigniter-hello-expressionenginer', 'xbox-360-and-hd-tv', 'new-design-coming-soon-with-sifr', 'lets-end-the-browser-war-and-just-comply-with-standards', 'i-love-panic', 'ie-firefox-why-would-you-want-this', 'my-name-is-kevin-smith-only-at-gamestop-though', 'google-is-awesome', 'life-updates', 'new-contact-information', 'data-portability', 'expressionengine-kills-my-pagerank', 'social-graph-api', 'the-idisk-sucks', 'first-countdown-maker-sale', 'i-am-addicted-to-redoing-my-blog', 'yay-for-rss-and-kohana', 'the-experiment', 'glad-i-chose-programmer-over-musician', 'simple-pagination-and-commenting-ideas', '3-easy-steps-to-optimize-web-apps-for-iphone', 'five-instead-of-four', 'music-podcast-and-years', 'twitter-from-quicksilver', 'samsoffes', 'being-19-with-a-career-sucks', 'soundcloud-is-pretty-sweet', 'how-to-sync-your-itunes-with-dropbox-in-3-steps', 'fun-unicode-domains', 'video-why-i-love-remember-the-milk', 'back-to-wordpress', 'new-music-to-wait-a-lifetime', 'why-a-mac-app-store-would-suck', 'eleven-at-night', 'counting-to-infinity', 'hello-world-again', 'iphone-plist-tutorial', 'linus-torvalds-on-git', 'openbeta-and-okccoco', 'my-take-on-using-ruby-on-rails', 'i-dont-have-a-boss-anymore', 'moving-to-louisville', 'scratch-that-im-staying-in-oklahoma-city', 'why-i-do-not-profit-share', 'web-services-with-cocoa-surprise', 'how-to-tether-iphone-3-0-without-jailbreaking', 'cocoa-makes-it-easy', 'mobilelex-2009', 'moving-to-dallas', 'new-blog-on-github-and-jekyll', 'i-like-gowalla', 'iphone-push-development-issues', 'markdownr-com', 'parsing-json-with-the-iphones-private-json-framework', 'iphone-json-benchmarks', 'easy-deployment-with-heroku', 'i-released-an-iphone-push-notification-gem', 'customize-uikit-with-method-swizzling', 'app-store-approval-process', 'screencast-reuse-code-across-iphone-applications-with-a-static-library-and-git', 'running-rails-local-development-with-nginx-postgres-and-passenger-with-homebrew', 'app-store-rejection', 'moved-to-heroku', 'trying-to-teach-web-development', 'rejected-for-cleverness', 'what-i-do', 'old-people-and-the-other-side', 'hosting-frustrations', 'archiving-nsmanagedobject-with-nscoding', 'homepage-albums', 'new-server-script', 'wwdc-2010-predictions', 'two-videos-you-need-to-watch', 'updated-iphone-json-benchmarks', 'archiving-objective-c-objects-with-nscoding', 'hello-internet-iphone-4', 'hello-internet-old-spice-guy-and-retweet-contests', 'how-to-learn-rails', 'hello-internet-pro-apps', 'sync-your-fonts-with-dropbox-tutorial', 'hello-internet-iphone-screens', 'hello-internet-apple', 'on-my-own-again', 'thoughts-on-writing-code-for-money', 'hello-internet-throwback-mountian-dew', 'web-app-vs-native-app', 'hello-internet-microcell', 'hello-internet-the-government', 'hello-internet-mac-app-store', 'hello-internet-twitter', 'why-crazy-column-designs-are-bad', 'im-moving-to-san-francisco', 'miracles-happen', 'shapes-app', 'some-sstoolkit-additions', '52-profiles-video', 'how-to-drastically-improve-your-app-with-an-afternoon-and-instruments', 'typical-sam', 'clean-up-your-project', 'custom-cloud-app-viso', 'four-years', 'moving-on', 'hipstamatic', 'compass-and-rails-3-1', 'notebooks', 'hey-synthetic', 'how-to-rock-at-craigs-list', 'the-worst-recruiters', 'face-detection-at-hipstamatic', 'removed-facebook-comments', 'easy-syntax-highlighting', 'make-ichat-better', 'genius-launch', 'how-to-install-ruby-193', 'my-deploy-script', 'open-source-is-rewarding', 'always-initialize-to-nil', 'uitableviewcell-silly-magic', 'on-managing-money', 'automatic-reference-counting', 'constantly-changing', 'here-we-go-again', 'hello-internet-selling-my-stuff', 'image-optimization-on-ios', 'introducing-shares', 'hire-sam', 'unjarring-the-responsive-web', 'announcing-cheddar', 'the-industry-podcast-8', 'rubymotion-review', 'progress-in-ios', 'cheddar-lessons-so-far', 'google-knowledge-graph', 'ruby-in-the-browser', 'sass-vs-less', 'sspulltorefresh', 'strapless-ipod-nano-watch', 'the-balance', 'zendesk-careers-video', 'webkit-css-variables', 'why-the-facebook-ipo-matters', 'coda-2', 'pulp-25', 'having-less', 'part-of-rubymotion-open-sourced', 'my-grid-system', 'using-people', 'dealing-with-emoji', 'learn-ios', 'staying-strong', 'yammer-sells-for-12-billon', 'developer-and-designer', 'dont-censor-me', 'boredom-and-change', 'ask-me-something-about-cheddar', 'scaling-cheddar', 'founders-talk-interview', 'behind-cheddars-server', 'hello-internet-nexus-7', 'acquisitions', 'those-were-the-days', 'how-to-learn', 'retiring-at-25', 'the-tech-block-podcast-73112', 'founders-talk-part-1', 'wrangling-svgs', 'one-thousand-dollars-an-hour', 'founders-talk-part-2', 'app-net-is-dreaming-small', 'the-east-wing', 'developer-id-and-10-8', 'testing-retina-graphics-with-resolutiontab', 'a-good-talk-show-episode-1', 'reverse-minimalism', 'changes', 'founders-talk-part-3', 'ship-it', 'mac-app-store', 'superconf', 'introducing-quesadilla', 'hello-world', 'new-blog', 'ipad-stylus-review', 'sublime-text-configuration', 'springboard-episode-3', 'how-to-build-a-ruby-gem', 'how-i-design-for-ios', 'why-i-dont-use-interface-builder', 'my-dna', 'engagement', 'wwdc-2013-predictions', 'space', 'new-homepage', 'polish', 'parting-ways-with-cheddar', 'tearing-up-the-carpet', 'making-roon-faster', 'sleep-schedule', 'setting-up-open-source-and-live-coding-part-1', 'setting-up-open-source-and-live-coding-part-2', 'everlapse', 'fat', 'onward', 'founders-talk-part-4', 'shares-2', 'motivation', 'picking-good-clients', 'snapchat', 'tin-can', 'custom-controls-in-footage', 'raising-your-profile', 'does-free-diminish-value', 'valio-con-2013', 'coins', 'happy-monday', 'the-east-wing-part-3', 'how-to-hold-a-pencil', 'parting-ways-with-execute-ios', 'ios-resources', 'sstoolkit-2-0', 'twenty-five', 'coins-for-android', 'apple-developer-tools', 'litely', 'the-mother-futon-news', 'quantum-data-teleportation', 'swift', 'four-questions', 'value-of-beta', 'questions-part-2', 'personal-sam', 'nsregularexpression-notes', 'desk-headphones', 'redacted-for-mac-launch', 'automatic-ui-updates-with-value-types', 'syntaxkit', 'network-testing-in-swift-with-dvr', 'string-homogeneousness', 'nerd-blog', 'static', 'what-color-is-it', 'automated-bundle-version', 'widest-roman-prime', 'mic-setup']

app.prepare().then(() => {
  const server = express()

  server.get('/soffes.asc', (req, res) => {
    res.sendFile(path.resolve('static', 'soffes.asc'))
  })

  redirects.forEach(({ from, to, type = 301, method = 'get' }) => {
    server[method](from, (req, res) => {
      res.redirect(type, to)
    })
  })

  oldPostSlugs.forEach((slug) => {
    server.get('/' + slug, (req, res) => {
      res.redirect(301, 'https://soffes.blog/' + slug)
    })

    server.get('/posts/' + slug, (req, res) => {
      res.redirect(301, 'https://soffes.blog/' + slug)
    })

    server.get('/post/' + slug, (req, res) => {
      res.redirect(301, 'https://soffes.blog/' + slug)
    })
  })

  server.get('*', (req, res) => {
    return handle(req, res)
  })

  server.listen(3000, err => {
    if (err) {
      throw err
    }
    console.log('> Ready on http://localhost:3000')
  })
})
