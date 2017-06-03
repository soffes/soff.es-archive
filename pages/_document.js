import Document, { Head, Main, NextScript } from 'next/document'
import { ServerStyleSheet } from 'styled-components'

export default class MyDocument extends Document {
  render () {
    // Hack to prevent unstyled flash with styled-components.
    // From https://github.com/zeit/next.js/blob/master/examples/with-styled-components/pages/_document.js
    const sheet = new ServerStyleSheet()
    const main = sheet.collectStyles(<Main />)
    const styleTags = sheet.getStyleElement()
    return (
      <html>
        <Head>
          <meta name="viewport" content="initial-scale=1.0, width=device-width" />
          <title>Sam Soffes</title>
          <link rel="me" href="https://www.google.com/profiles/samsoffes" />
          <link rel="author" type="text/plain" href="/humans.txt" />
          <meta property="fb:admins" content="1203270129" />
          <meta property="og:site_name" content="Sam Soffes" />
          <meta property="og:title" content="Sam Soffes" />
          <meta property="og:type" content="profile" />
          <meta property="og:locale" content="en_US" />
          <link rel="canonical" href="https://soff.es" />
          <meta property="og:url" content="https://soff.es" />
          <meta property="og:image" content="https://soffes-assets.s3.amazonaws.com/images/Sam-Soffes.jpg" />
          <meta property="og:image:secure_url" content="https://soffes-assets.s3.amazonaws.com/images/Sam-Soffes.jpg" />
          <meta property="og:image:width" content="600" />
          <meta property="og:image:height" content="600" />
          <meta property="og:image:type" content="image/png" />
          <meta property="profile:first_name" content="Sam" />
          <meta property="profile:last_name" content="Soffes" />
          <meta property="profile:gender" content="male" />
          <meta property="profile:username" content="soffes" />
          <link rel="stylesheet" type="text/css" href="https://cloud.typography.com/619254/777982/css/fonts.css" />
          <link rel="stylesheet" type="text/css" href="/static/base.css" />
          {styleTags}
        </Head>
        <body>
          <div className='root'>
            {main}
          </div>
          <NextScript />
        </body>
      </html>
    )
  }
}
