//
//  wit.m
//  wit
//
//  Created by Michael Nisi on 21.11.13.
//  Copyright (c) 2013 Michael Nisi. All rights reserved.
//

#import "wit.h"
#include <UIKit/UIKit.h>

static void wit_logex(NSException *ex);
static void writejson(NSData *);
static NSString *now(void);
static NSDictionary *dict(NSException *ex);
static NSData *json(NSException *ex);
static NSString *file(void);

void wit_install() {
  NSSetUncaughtExceptionHandler(&wit_logex);
}

static void wit_logex(NSException *ex) {
  writejson(json(ex));
}

static NSString *now() {
  return [NSDateFormatter localizedStringFromDate:[NSDate date]
                                        dateStyle:NSDateFormatterShortStyle
                                        timeStyle:NSDateFormatterShortStyle];
}

static NSDictionary *device() {
  UIDevice *dev = [UIDevice currentDevice];
  return @{@"name":dev.systemName,
           @"model":dev.model,
           @"version":dev.systemVersion,
           };
}

static NSDictionary *dict(NSException *ex) {
  return @{@"date":now(),
           @"name":ex.name,
           @"reason":ex.reason,
           @"stacktrace":ex.callStackSymbols,
           @"device":device()
           };
}

static NSData *json(NSException *ex) {
  NSDictionary *d = dict(ex);
  NSError *er;
  NSData *json = [NSJSONSerialization dataWithJSONObject:d options:0 error:&er];
  if (er || !json) {
    NSString *m = @"{\"message\":\"weird error\"}";
    json = [m dataUsingEncoding:NSUTF8StringEncoding];
  }
  return json;
}

static NSString *file() {
  NSString *dir = NSTemporaryDirectory();
  return [[dir stringByAppendingPathComponent:@"wit"] stringByAppendingPathExtension:@"json"];
}

static void writejson(NSData *json) {
  NSString *f = file();
  NSFileManager *fm = [NSFileManager defaultManager];
  [fm createFileAtPath:f contents:json attributes:nil];
}
