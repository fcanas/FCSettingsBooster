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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 1) {
    return [[FCSwitchCell alloc] initWithReuseIdentifier:@"b" labelText:@"My Preference" andKey:@"preferenceKey"];
  } else {
    return [[FCColorPickerCell alloc] initWithReuseIdentifier:@"b" labelText:@"My Preference" andKey:@"colorPreferenceKey"];
  }
  
}

@end
