//
//  FCColorPickerCell.m
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import "FCColorPickerCell.h"

#import <iOS-Color-Picker/FCColorSwatchView.h>
#import <iOS-Color-Picker/FCColorPickerViewController.h>
#import "NSUserDefaults+UIColor.h"

@interface FCColorPickerCell () {
  NSString *_key;
  NSString *_labelText;
}

@end

@implementation FCColorPickerCell

@synthesize key=_key;
@synthesize labelText=_labelText;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self setupAccessoryView];
  }
  return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier labelText:(NSString *)label andKey:(NSString *) key {
  self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
  if (self) {
    self.textLabel.text = label;
    self.key = key;
  }
  return self;
}

- (void)setupAccessoryView {
  self.accessoryView = [[FCColorSwatchView alloc] initWithFrame:CGRectMake(0, 0, 79, 27)];
}

- (void)setKey:(NSString *)key {
  _key = key;
  ((FCColorSwatchView *)self.accessoryView).color = [[NSUserDefaults standardUserDefaults] colorForKey:_key];
}

- (void)setLabelText:(NSString *)labelText {
  self.textLabel.text = labelText;
}

- (id)valueControllerForSettingsController:(id<FCSettingsBoosterController>)settingsController {
  FCColorPickerViewController *c = [[FCColorPickerViewController alloc] initWithNibName:@"FCColorPickerViewController" bundle:nil] ;
  
  settingsController.controllerKey = self.key;
  c.color = [[NSUserDefaults standardUserDefaults] colorForKey:self.key];
  c.modalPresentationStyle = UIModalPresentationCurrentContext;
  
  if ([settingsController conformsToProtocol:@protocol(ColorPickerViewControllerDelegate)]) {
    c.delegate = (id<ColorPickerViewControllerDelegate>)settingsController;
  }
  
  return c;
}

@end
