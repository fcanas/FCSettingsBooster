//
//  FCColorPickerCell.m
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/21/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import "FCColorPickerCell.h"

@implementation FCColorPickerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier labelText:(NSString *)label andKey:(NSString *) key {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
  if (self) {
    self.textLabel.text = label;
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
