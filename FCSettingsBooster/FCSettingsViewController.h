//
//  FCSettingsViewController.h
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/27/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCSettingsViewController : UITableViewController

- (id)initWithConfiguration:(NSArray *) config andStyle:(UITableViewStyle)style;

- (void)configure:(NSArray *) config;

@end