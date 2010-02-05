---
title: Rejected for Cleverness
layout: post
---

The latest [X3watch iPhone app](http://x3watch.com/) update got rejected. Here some of the highlights from the rejection email:

> We have reviewed your application and have found that it is accessing and displaying the contents of the iPhone OS filesystem outside of your designated container area.  The iPhone Developer Program License Agreement provides specific guidelines about this behavior in section 3.2(e).

<!-- silly markdown -->

> There is no public method for obtaining the device's restriction settings.
You will need to revise your application to read only within your directory container and resubmit your binary to iTunes Connect in order for your application to be reconsidered for the App Store.

They think that I'm using some private API and going outside of the application sandbox to see if Safari is enabled. This made me laugh. I'm just being really clever. Here's the code to see if Safari is enabled:

    + (BOOL)hasSafariEnabled {
    	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://xxxchurch.com"]];
    }

I sent them an email with this code explaining I didn't break any rules. They never replied, but we got an approval email 2 days later. Silly Apple.
