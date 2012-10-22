//
//  NSUserDefaults+UIColor.m
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import "NSUserDefaults+UIColor.h"

@implementation NSUserDefaults (UIColor)

- (UIColor *)colorForKey:(NSString *)defaultName {
  NSData *colorData = [self objectForKey:defaultName];
  if (colorData!=nil) {
    return (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
  } else {
    return nil;
  }
}

- (void)setColor:(UIColor *)value forKey:defaultName {
  NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:value];
  [self setObject:colorData forKey:defaultName];
}

@end
