//
//  FCAppDelegate.h
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCViewController;

@interface FCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FCViewController *viewController;

@end
