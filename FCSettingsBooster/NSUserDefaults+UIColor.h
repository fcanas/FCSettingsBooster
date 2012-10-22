//
//  NSUserDefaults+UIColor.h
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (UIColor)

- (UIColor *)colorForKey:(NSString *)key;

- (void)setColor:(UIColor *)color forKey:key;

@end
