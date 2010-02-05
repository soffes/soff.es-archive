---
title: Customize UIKit with Method Swizzling
layout: post
---

Have you ever wanted to override some functionality in UIKit that was in a hard to reach place? A lot of applications on the App Store have custom `UINavigationBar`'s. I really wanted to do this one of [my company](http://tastefulworks.com)'s upcoming apps.

A popular solution for this creating a category and overriding the method you want to change in it. For this the example, we'll make a `UINavigationBar` green instead (obviously you could do something cool here instead). The category way would look something like this:

{% highlight c %}
@interface UINavigationBar (CustomBackground)
@end


@implementation UINavigationBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
    [[UIColor greenColor] set];
    CGRect fillRect = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);
	CGContextFillRect(UIGraphicsGetCurrentContext(), fillRect);
}

@end
{% endhighlight %}

This approach works very well, but there are two issues with it: overriding methods with a category is an Objective-C no no and if you need to call the default implementation, you can't.

In my app, I wanted to change most of the navigation bars in all of the navigation controllers. I am using a `UIImagePickerController` in part of the app and it was customized to. I really wanted to keep it the translucent style instead of the style for the rest of my app.

I decided any `UINavigationBar` with `UIBarStyleDefault` as its style, I want to override and everything else leave alone. There is no way to do this with the category approach. You can't call `[self drawRect:rect]` because it would infinitely call itself since you replaced it with the method you are calling it from.

### Method swizzling

After some googling and some help from #macdev on Freenode, I changed my solution to use method swizzling. [Method swizzling](http://www.cocoadev.com/index.pl?MethodSwizzling), in short, is switching methods at runtime. So you can say for `UINavigationBar` don't use the standard `drawRect:`, but instead swap it with a different one. (This is kinda confusing, but hang in there. It's not that hard.)

I updated my category to look like this:

{% highlight c %}
@interface UINavigationBar (CustomBackground)

- (void)drawRectCustomBackground:(CGRect)rect;

@end


@implementation UINavigationBar (CustomBackground)

- (void)drawRectCustomBackground:(CGRect)rect {

	if (self.barStyle == UIBarStyleDefault) {
	    [[UIColor greenColor] set];
        CGRect fillRect = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);
	    CGContextFillRect(UIGraphicsGetCurrentContext(), fillRect);
	    return;
	}
	
	// Call default implementation
	[self drawRectCustomBackground:rect];
}

@end
{% endhighlight %}

I then updated `main.m` to look like this:

{% highlight c %}
#import <objc/runtime.h>
#import "UINavigationBar+CustomBackground.h"

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	// Swizzle the nav bar
	Method drawRectCustomBackground = class_getInstanceMethod([UINavigationBar class], @selector(drawRectCustomBackground:));
	Method drawRect = class_getInstanceMethod([UINavigationBar class], @selector(drawRect:));
	method_exchangeImplementations(drawRect, drawRectCustomBackground);

	int retVal = UIApplicationMain(argc, argv, nil, @"AppDelegate");

    [pool release];
    return retVal;
}
{% endhighlight %}

So this kinda hurt my head when I was first looking at all of this. In `main.m`, before the application starts, I swizzle the `UINavigationBar` methods. `method_exchangeImplementations()` switches my `drawRectCustomBackground:` with `drawRect:` in 
`UINavigationBar`. When I call the default implementation in `drawRectCustomBackground:`, it looks like I'm calling the same method, but I am actually calling the default implementation because it swapped them.

This is pretty crazy and a little confusing (especially with someone new to Objective-C), but really powerful. You can use this approach to customize a lot of things Apple didn't intend for you to mess with. Go out and make something cool!
