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
#import "NSUserDefaults+UIColor.h"

@interface FCSettingsViewController ()
@property (nonatomic, strong) NSArray *configuration;
@property (nonatomic, strong) NSString *controllerKey;
@end

@implementation FCSettingsViewController

- (id)initWithConfiguration:(NSArray *) config andStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    if (self.tableView == nil) {
      self.tableView = [[UITableView alloc] init];
      self.modalPresentationStyle = UIModalPresentationCurrentContext;
      self.definesPresentationContext = YES;
    }
    
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
  
  cell.labelText = cellSettings[@"name"];
  cell.key = cellSettings[@"key"];
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *cellConfiguration = [self cellConfigurationAtIndexPath:indexPath];
  NSString *cellClass = cellConfiguration[@"type"];
  if ([cellClass isEqualToString:@"FCColorPickerCell"]) {
    [self pushColorPickerForKey:cellConfiguration[@"key"]];
  }
}

#pragma mark - Configuration Convenience Methods

- (NSDictionary *)cellConfigurationAtIndexPath:(NSIndexPath *)indexPath {
  return ((NSArray *)((NSDictionary *)_configuration[indexPath.section])[@"settings"])[indexPath.row];
}

#pragma mark - Picker Methods

- (void)pushColorPickerForKey:(NSString *)key {
  self.controllerKey = key;
  
  FCColorPickerViewController *colorPicker = [[FCColorPickerViewController alloc] initWithNibName:@"FCColorPickerViewController" bundle:nil];
  colorPicker.color = [[NSUserDefaults standardUserDefaults] colorForKey:key];
  colorPicker.delegate = self;
  [self presentViewController:colorPicker animated:YES completion:nil];
}

#pragma mark - Color Picker Delegate Methods

- (void)colorPickerViewController:(FCColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setColor:color forKey:self.controllerKey];
  [self dismissViewControllerAnimated:YES completion:nil];
  self.controllerKey = nil;
  [self.tableView reloadData];
}

- (void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
  [self dismissViewControllerAnimated:YES completion:nil];
  self.controllerKey = nil;
}


@end
