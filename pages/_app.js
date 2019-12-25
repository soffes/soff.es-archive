import App from 'next/app'
import Head from 'next/head'
import React from 'react'

export default class MyApp extends App {
  static async getInitialProps ({ Component, router, ctx }) {
    let pageProps = {}

    if (Component.getInitialProps) {
      pageProps = await Component.getInitialProps(ctx)
    }

    return { pageProps }
  }

  render () {
    const { Component, pageProps } = this.props

    return (
      <div>
        <Head>
          <meta name="viewport" content="initial-scale=1.0, width=device-width" />
          <title>Sam Soffes</title>
          <link rel="mask-icon" sizes="any" href="/favicon.svg" color="#f6291d" />
          <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
          <link rel="apple-touch-icon" href="/apple-touch-icon-192x192.png" sizes="192x192" />
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
          <link rel="stylesheet" type="text/css" href="/base.css" />
        </Head>
        <Component {...pageProps} />
      </div>
    )
  }
}

