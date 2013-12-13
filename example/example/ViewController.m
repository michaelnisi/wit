//
//  ViewController.m
//  example
//
//  Created by Michael Nisi on 22.11.13.
//  Copyright (c) 2013 Michael Nisi. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)crash:(id)sender {
    NSException *exc
    = [NSException exceptionWithName:@"DeliberateException"
                              reason:@"Deliberately thrown exception to test wit"
                            userInfo:nil];
    @throw exc;
}

@end
