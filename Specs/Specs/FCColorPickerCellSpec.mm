#import "FCColorPickerCell.h"
#import "NSUserDefaults+UIColor.h"
#import <iOS-Color-Picker/FCColorSwatchView.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FCColorPickerCellSpec)

describe(@"FCColorPickerCell", ^{
  __block FCColorPickerCell *model;
  static NSString *preferenceKey = @"colorKey";
  
  beforeEach(^{
    [[NSUserDefaults standardUserDefaults] setColor:[UIColor blueColor] forKey:preferenceKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    model = [[FCColorPickerCell alloc] initWithReuseIdentifier:@"r"
                                                     labelText:@"Color Preference"
                                                        andKey:preferenceKey];
  });
  
  describe(@"init", ^(){
    it(@"should show the correct name in its label", ^(){
      [model.textLabel.text isEqualToString:@"Color Preference"] should be_truthy;
      
    });
    
  });
  
  describe(@"colorSwatch", ^(){
    it(@"should have a FCColorSwatchView for an accessory view", ^(){
      model.accessoryView should be_instance_of([FCColorSwatchView class]);
    });
    
    it(@"should set up a color swatch view of the correct size", ^(){
      model.accessoryView.frame.size.width should equal(79.0f);
      model.accessoryView.frame.size.height should equal(27.0f);
    });
    
    it(@"should have the color that corresponds to the user preference", ^(){
      CGFloat r,g,b,a;
      [((FCColorSwatchView *)model.accessoryView).color getRed:&r green:&g blue:&b alpha:&a];
      r should equal(0.0f);
      g should equal(0.0f);
      b should equal(1.0f);
      a should equal(1.0f);
    });
  });
  
});

SPEC_END
