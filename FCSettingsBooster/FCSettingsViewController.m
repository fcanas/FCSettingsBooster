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

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell<FCBoosterCell> *cell = (UITableViewCell<FCBoosterCell> *)[tableView cellForRowAtIndexPath:indexPath];
  if ([cell conformsToProtocol:@protocol(FCBoosterCell)]) {
    if ([cell respondsToSelector:@selector(valueControllerForSettingsController:)]) {
      return YES;
    }
  }
  return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell<FCBoosterCell> *cell = (UITableViewCell<FCBoosterCell> *)[tableView cellForRowAtIndexPath:indexPath];
  if ([cell conformsToProtocol:@protocol(FCBoosterCell)]) {
    if ([cell respondsToSelector:@selector(valueControllerForSettingsController:)]) {
      [self presentViewController:[cell valueControllerForSettingsController:self] animated:YES completion:nil];
    }
  }
}

#pragma mark - Configuration Convenience Methods

- (NSDictionary *)cellConfigurationAtIndexPath:(NSIndexPath *)indexPath {
  return ((NSArray *)((NSDictionary *)_configuration[indexPath.section])[@"settings"])[indexPath.row];
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
