---
title: App Store Rejection
layout: post
---

December was a month of rejection for me. The [X3watch app][] another of my client's apps, and [LifeChurch.tv][]'s [Bible app](http://youversion.com/iphone) (which I wrote most of but am no longer a part of) got rejected.

### What Changed

*Apple changed the rules recently*, which is fine. They change the App Store every month or so. Normally, you just click accept to the new terms and go about your business. Do you ever read EULAs? I don't. Basically the same thing.

The important change to note (that they obviously didn't highlight, but expected you to read the massive terms in legal speak) was their new policy on undocumented APIs. Before, *private APIs* were not allowed and *undocumented APIs* were just frowned upon but still allowed.

#### The Difference Between Private and Undocumented

Private APIs are basically anything in a Private Framework (found in `/System/Library/PrivateFrameworks` on the device) like [`JSON.framework`](http://samsoff.es/post/parsing-json-with-the-iphones-private-json-framework/) or `XMPP.framework`. Undocumented APIs are APIs found in one of the public frameworks (found in `/System/Library/Frameworks` on the device) that are not in the header files or documentations. (You go about finding this with a neat tool called [class-dump](http://www.codethecode.com/projects/class-dump/)).

### Why Apple Did This

Apple's rules for the App Store are intended to keep the apps in it good and the garbage out (one could argue to make developers lives horribly, but I'll leave that to your judgement). The reason for an API being undocumented is that Apple could change it whenever they want because they haven't taken the time to really finalize it. This means that an update could break your app because they changed something. They don't want apps that will randomly break on updates in the store, I get that.

### Why I Care So Much

I understand Apple's reasoning for this, but I don't like it. There are a lot of things that many apps rely on that are undocumented. Even worse, Apple will let [certain apps use undocumented APIs](http://daringfireball.net/2008/11/google_mobile_uses_private_iphone_apis) which is so unfair. *We just want consistency Apple.*

All of the apps that I mentioned earlier that got rejected, got rejected for `UIWebView` (the view that shows Safari-like content in an app) undocumented APIs. [Bible][] was using undocumented methods for scrolling. Without the use of these undocumented APIs, the ability to scroll the webview without the user is impossible. [X3watch][] got rejected for the same thing undocumented API (as well their keywords). My other client's app got rejected for disabling the scrolling of a webview with an undocumented API. So frustrating.

### One Warning

I contacted my friends at [LifeChurch.tv][] when the [X3watch][] app got rejected, because I remembered using very similar undocumented APIs in [Bible][] when I was still working on it. They informed me that they were rejected for using the undocumented APIs that I mentioned earlier. A few minutes later, they received an approval email saying their app had been approved and that they needed to take out the undocumented APIs before submitting another update or it would not be allowed into the store.

I guess it's kinda cool that Apple gives you a little grace if you were already in the store. My client and the [X3watch app][] weren't already in the store, so they were just rejected.

### Thoughts To Apple

Apple, a lot of developers rely on undocumented APIs. We understand why you won't allow them. We are just ask that you start documenting popular ones. I know a lot of people really want so see the scrolling and `UIScroller` in `UIWebView` documented, methods in `UIApplication` for airplane mode prompts, and many others. Please start an effort to documented these methods. Any effort to try to more clearly communicate App Store policy changes like this besides having us read the massive agreement would also be very welcome.

[X3watch app]: http://itunes.apple.com/us/app/x3watch/id337170101?mt=8
[LifeChurch.tv]: http://lifechurch.tv
[Bible]: http://youversion.com/iphone
[X3watch]: http://itunes.apple.com/us/app/x3watch/id337170101?mt=8
