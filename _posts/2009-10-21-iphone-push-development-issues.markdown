---
title: iPhone Push Development Issues
layout: post
---

To the wayward googler, if you are getting this error:

    Failed to register for remote notificaitons. Error: Error Domain=NSCocoaErrorDomain Code=3000 UserInfo=0x2782a0 "no valid 'aps-environment' entitlement string found for application"

You need to make sure that your provisioning profile has the app id of the app you have setup push for. Double check that you are actually building with it. 

If it still doesn't work, you probably created the provisioning profile before you enabled push on that app id. Modify it (just uncheck and recheck a box to enabled the save button) and save, then download and reinstall. You'll need to delete the old one so you don't get it confused with the new one. If that doesn't work, double check everything and try clean building.
