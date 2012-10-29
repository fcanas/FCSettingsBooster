//
//  FCViewController.m
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import "FCViewController.h"

#import "FCSwitchCell.h"
#import "FCColorPickerCell.h"

@interface FCViewController ()

@end

@implementation FCViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configure:@[@{@"sectionName":@"Basic Settings",
   @"settings":@[
   @{@"type":@"FCSwitchCell", @"name":@"The Preference", @"key":@"booleanPref"},
   @{@"type":@"FCColorPickerCell", @"name":@"The Color", @"key":@"colorPref"},
   ]}]];
}


@end
