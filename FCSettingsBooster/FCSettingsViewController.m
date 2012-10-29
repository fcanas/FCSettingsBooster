//
//  FCSettingsViewController.m
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/27/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import "FCSettingsViewController.h"
#import "FCSwitchCell.h"
#import "FCColorPickerCell.h"

@interface FCSettingsViewController ()
@property (nonatomic, strong) NSArray *configuration;
@end

@implementation FCSettingsViewController

- (id)initWithConfiguration:(NSArray *) config andStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    [self configure:config];
  }
  return self;
}

- (void)configure:(NSArray *) config {
  [self.tableView registerClass:[FCSwitchCell class] forCellReuseIdentifier:@"FCSwitchCell"];
  [self.tableView registerClass:[FCColorPickerCell class] forCellReuseIdentifier:@"FCColorPickerCell"];
  self.configuration = config;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return _configuration.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return ((NSArray *)_configuration[section][@"settings"]).count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return _configuration[section][@"sectionName"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  NSDictionary *cellSettings = ((NSArray *)((NSDictionary *)_configuration[indexPath.section])[@"settings"])[indexPath.row];
  
  NSString *cellIdentifier = cellSettings[@"type"];
  UITableViewCell<FCBoosterCell> *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  
  NSArray *boosterSet = @[@"FCSwitchCell", @"FCColorPickerCell"];
  
  if (cell==nil) {
    for (NSString *s in boosterSet) {
      if ([s isEqualToString:cellIdentifier]) {
        cell = [[NSClassFromString(s) alloc] initWithReuseIdentifier:s labelText:cellSettings[@"name"] andKey:cellSettings[@"key"]];
      }
    }
  }
  
  cell.labelText = cellSettings[@"name"];
  cell.key = cellSettings[@"key"];
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

@end
