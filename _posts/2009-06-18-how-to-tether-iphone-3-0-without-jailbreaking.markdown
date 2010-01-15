---
title: How To Tether iPhone 3.0 Without Jailbreaking
layout: post
---

**Update:** This no longer works on 3.1.

**Update:** There are simpler instructions at <http://9to5mac.com/iPhone-3G-tethering>. I have heard rumors that this no longer works with iTunes 8.2. I personally haven't tried it in awhile.

So with iPhone 3.0 you can tether you computer to your iPhone, but not yet for some carriers. It's pretty dang sweet and works really well so let's do it early. It's actually pretty easy to get setup. I would write an app to automate it, but I'm sure Apple will release an update and break all of this soon, so follow my steps to get going.

I did this with iTunes 8.2 (23) on OS 10.6 (10A380) on AT&T with iPhone 3.0 (7A341), but I'm quite confident it works with iTunes 8.2 on Leopard and most carries (we'll look up a list later). You will need to make sure you are running the 3.0 firmware on your iPhone. I'll try to keep this pretty basic so you don't need technical knowledge. There are a lot of steps because I am very specific for people that are not familar with editing these kind of files. Don't be intimidated. It's pretty straight forward.

1. Quit iTunes and open up Terminal (/Applications/Utilities/Terminal.app)

2. Run the following command to enable carrier testing. We'll need this later
        defaults write com.apple.iTunes carrier-testing -bool TRUE

3. Now we need to get the list of carriers. Run this command:
        curl -s -L http://phobos.apple.com/version | grep -i carrier

4. That command will return a big list of ipcc files. Look for the one that ends in your carrier. If you have AT&T, it will be called `ATT_US.ipcc`. Copy that URL between the `<string>` tags.

5. Now type the last portion of the URL before `.ipcc` where it says `YOUR CARRIER` (mine would be `ATT_US`)
        declare CARRIER="YOUR CARRIER"
    So for AT&T, it would look like
        declare CARRIER="ATT_US"

6. Type the following commands in Terminal. (Obviously paste the URL where it says.)
        cd ~/Desktop
        curl [PASTE URL HERE] > $CARRIER.zip
        unzip $CARRIER.zip
        rm -f $CARRIER.zip
        open Payload

7. There should now be a folder on your desktop named `Payload` that just opened. (If there is not, start back at step one and carefully follow the instructions this time.)

8. Right click on the .bundle file in that folder and choose `Show Package Contents`. We're going to edit a few files in here. You will need to have the developer tools installed to get Apple's Property List Editor utility. If you do not have these tools, go to [http://developer.apple.com/mac](http://developer.apple.com/mac), sign up for an account, download Xcode, and install it. Once you do this, it will install Property List Editor in `/Developer/Applications/Utilities/Property List Editor.app`.

9. Right click `Info.plist`, choose `Open With`, then choose `Property List Editor`.

10. Once the Property List Editor is open, choose `Show Raw Key/Values` from the `View` menu in the menubar. The Property List Editor is pretty straight forward so don't be scared :)

11. Change `CFBundleVersion` to `5.0`. Now save and close `Info.plist`.

12. Now open `version.plist` with Property List Editor, change `CFBundleVersion` to `5.0`, save and close `version.plist`.

13. Now for the fun one :) Open `carrier.plist` with Property List Editor, click the triangle next to `apns` to show its contents. This will probably be the first item.

14. Click on `apns` and click the button that appears out to the right. It will have three horizontal lines on it.

15. Change the type of the item you just created to `Dictionary` in the type column. Click the triangle next to the `Item 0` (the item you created in step 14). The button out the right will have have that same three horizontal lines icon. Click this button to make a new entry in that dictionary.

16. In this entry, make the key `apn` and the value `internet`. Leave the type as `String`.

17. Make another entry by clicking that same three horizontal lines icon. This time make the key `password` and the value `password`. Leave the type as `String` again.

18. Make another entry by clicking that same three horizontal lines icon. This time make the key `username` and the value `iphone`. Leave the type as `String` again.

19. Now click the triangle next to `Item 1`. You should see the key `apn` with the value containing `wap.` and your carrier. For me this is `wap.cingular`. Click on `Item 1` and make another entry by clicking that same three horizontal lines icon. This time make the key `type-mask` and the value `-2`. This time change the type to `Number`. If you don't one of the items in the `apns` dictionary who's `apn` value has `wap.` in it, simply do this for all of the items in that `apns` dictionary.

20. Now click on `Root` at the very top of the file. Click that same three horizontal lines icon. This time make the key `AllowEDGEEditing`. Change the type to `Boolean` and check the box in the value column. Save and quit Property List Editor. We're done with all of that. Phew.

21. Back in Terminal, run the following command
        zip $CARRIER.ipcc Payload

22. Now you can quit Terminal and open iTunes and connect your iPhone.

23. Go to the iPhone summary by selecting the iPhone from the source list on the left. Hold down option and click on `Check for Update`. This will open up a window to choose a file. Choose the ipcc file on your desktop. If you cannot select ipcc files here, be sure you did step 2 while iTunes was not running. You could try running this command again and restarting iTunes if you still can't select ipcc files in this dialog. If you still can't select ipcc files after this, then Apple has probably closed up this hole. Sorry.

24. If the window just goes away, then you did it! Simply restart your iPhone.

25. Open up the Settings app on your iPhone. Choose `General` > `Network` > `Internet Tethering` to configure it. Enjoy!
