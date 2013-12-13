# wit - write uncaught exception

The wit [iOS](http://www.apple.com/ios/) library writes the last uncaught exception to a file. Sure, in most cases the beautiful [crashlytics](http://try.crashlytics.com/) is the best choice, but if you hesitate to add dependencies to your code (like me) and just want to keep track of crashes in the wild, you might want something simpler. For this case I wrote this tiny library, which installs an uncaught exception handler, to write some (JSON formatted) information about the exception to a file—with the idea, of course, to do something with it after the next startup (sending it to your server for example).

> Can you kick it like I kick it when I kick this,
can I get a witness?  (Yes you can!)

## Usage

```objc
#import "AppDelegate.h"
#import <wit.h>

@implementation AppDelegate

- (BOOL)
application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    wit_install();
    return YES;
}

@end
```
## Output

After an uncaught exception crashed your app, in `Documents/wit.json` you'll find:

```json
{
  "name": "DeliberateException",
  "reason": "Deliberately thrown exception to test wit",
  "device": {
    "version": "7.0.3",
    "name": "iPhone OS",
    "model": "iPhone Simulator"
  },
  "stacktrace": [
    "0   CoreFoundation                      0x017395e4 __exceptionPreprocess + 180",
    "1   libobjc.A.dylib                     0x014bc8b6 objc_exception_throw + 44",
    "2   example                             0x00002194 -[ViewController crash:] + 148",
    "3   libobjc.A.dylib                     0x014ce874 -[NSObject performSelector:withObject:withObject:] + 77",
    "4   UIKit                               0x0022c0c2 -[UIApplication sendAction:to:from:forEvent:] + 108",
    "5   UIKit                               0x0022c04e -[UIApplication sendAction:toTarget:fromSender:forEvent:] + 61",
    "6   UIKit                               0x003240c1 -[UIControl sendAction:to:forEvent:] + 66",
    "7   UIKit                               0x00324484 -[UIControl _sendActionsForEvents:withEvent:] + 577",
    "8   UIKit                               0x00323733 -[UIControl touchesEnded:withEvent:] + 641",
    "9   UIKit                               0x0026951d -[UIWindow _sendTouchesForEvent:] + 852",
    "10  UIKit                               0x0026a184 -[UIWindow sendEvent:] + 1232",
    "11  UIKit                               0x0023de86 -[UIApplication sendEvent:] + 242",
    "12  UIKit                               0x0022818f _UIApplicationHandleEventQueue + 11421",
    "13  CoreFoundation                      0x016c283f __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 15",
    "14  CoreFoundation                      0x016c21cb __CFRunLoopDoSources0 + 235",
    "15  CoreFoundation                      0x016df29e __CFRunLoopRun + 910",
    "16  CoreFoundation                      0x016deac3 CFRunLoopRunSpecific + 467",
    "17  CoreFoundation                      0x016de8db CFRunLoopRunInMode + 123",
    "18  GraphicsServices                    0x0368e9e2 GSEventRunModal + 192",
    "19  GraphicsServices                    0x0368e809 GSEventRun + 104",
    "20  UIKit                               0x0022ad3b UIApplicationMain + 1225",
    "21  example                             0x0000251d main + 141",
    "22  libdyld.dylib                       0x01d75725 start + 0",
    "23  ???                                 0x00000001 0x0 + 1"
  ],
  "date": "11/22/13, 8:39 PM"
}
```
## Installation

With [CocoaPods](http://cocoapods.org) add this to your Podfile:
```
pod "witness"
```

## License

[MIT License](https://raw.github.com/michaelnisi/wit/master/LICENSE)
