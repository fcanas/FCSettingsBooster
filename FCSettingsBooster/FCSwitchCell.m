//
//  FCSwitchCell.m
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import "FCSwitchCell.h"

@interface FCSwitchCell () {
  NSString *_key;
  NSString *_labelText;
}

@property (nonatomic, assign) UISwitch *theSwitch;

@end

@implementation FCSwitchCell

@synthesize key=_key;
@synthesize labelText=_labelText;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.accessoryView = [[UISwitch alloc] init];
    self.theSwitch = (UISwitch *)self.accessoryView;
    [_theSwitch addTarget:self action:@selector(setDefaults) forControlEvents:UIControlEventValueChanged];
  }
  return self;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier labelText:(NSString *)label andKey:(NSString *) key {
  self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
  if (self) {
    self.textLabel.text = label;
    self.key = key;
    [self fetchDefaults];
  }
  return self;
}

- (void)setLabelText:(NSString *)labelText {
  _labelText = labelText;
  self.textLabel.text = labelText;
}

- (void)setKey:(NSString *)key {
  _key = key;
  [self fetchDefaults];
}

- (void)fetchDefaults {
  [[NSUserDefaults standardUserDefaults] synchronize];
  _theSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:_key];
}

- (void)setDefaults {
  [[NSUserDefaults standardUserDefaults] setBool:_theSwitch.on forKey:_key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)value {
  return _theSwitch.on;
}

- (void)setValue:(BOOL)newValue {
  _theSwitch.on = newValue;
  [self setDefaults];
  if (_valueChanged) {
    _valueChanged(newValue);
  }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

@end
