#import "FCSwitchCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FCSwitchCellSpec)

describe(@"FCSwitchCell", ^{
  __block FCSwitchCell *model;
  static NSString *preferenceKey = @"preferenceKey";
  
  beforeEach(^{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:preferenceKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    model = [[FCSwitchCell alloc] init];
    model.key = preferenceKey;
  });
  
  describe(@"init", ^(){
    it(@"should show the correct name in its label", ^(){
      model.labelText = @"Preference Name";
      [model.textLabel.text isEqualToString:@"Preference Name"] should be_truthy;
      
    });
    
    it(@"should have a UISwitch as an accessory view", ^(){
      model.accessoryView should be_instance_of([UISwitch class]);
      
    });
    
  });
  
  describe(@"Interaction with User Defaults", ^(){
    it(@"should reflect the state of the user preference", ^(){
      BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:preferenceKey];
      
      model.value should equal(value);
    });
    
    it(@"should change the user defaults for the key when its state is changed", ^(){
      model.value = NO;
      BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:preferenceKey];
      value should equal(NO);
      
      model.value = YES;
      value = [[NSUserDefaults standardUserDefaults] boolForKey:preferenceKey];
      value should equal(YES);

    });
    
    it(@"should", ^(){
      ((UISwitch *)model.accessoryView).on = NO;
      [((UISwitch *)model.accessoryView) sendActionsForControlEvents:UIControlEventValueChanged];
      
      BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:preferenceKey];
      value should equal(NO);

    });
    
  });
  
});

SPEC_END
