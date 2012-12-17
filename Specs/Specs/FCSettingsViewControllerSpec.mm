#import "FCSettingsViewController.h"
#import "FCSwitchCell.h"
#import "FCColorPickerCell.h"
#import <iOS-Color-Picker/FCColorPickerViewController.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FCSettingsViewControllerSpec)

describe(@"FCSettingsViewController", ^{
  __block FCSettingsViewController *model;
  __block NSArray *settings;
  __block UITableViewCell<FCBoosterCell> *cell;
  __block NSIndexPath *firstIndexPath;
  
  beforeEach(^{
    model = [[FCSettingsViewController alloc] init];
    firstIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
  });
  
  describe(@"initialize with configuration", ^(){
    
    beforeEach(^{
      settings = @[
        @{@"sectionName": @"Basic",
        @"settings": @[
          @{@"type":@"FCSwitchCell", @"name":@"The Preference", @"key":@"pref"},
          @"two"
        ]},
        
        @{@"sectionName": @"Advanced",
        @"settings": @[
          @"one", @"two", @"three"
        ]},
      ];
      model = [[FCSettingsViewController alloc] initWithConfiguration:settings andStyle:UITableViewStyleGrouped];
    });
    
    it(@"should have the same number of sections as its configuration", ^(){
      [model numberOfSectionsInTableView:nil] should equal(settings.count);
    });
    
    it(@"should have the correct number of rows for each section", ^(){
      for(NSInteger section = 0; section < settings.count; section++) {
        [model tableView:nil numberOfRowsInSection:section] should equal([settings[section][@"settings"] count]);
      }
    });
    
    it(@"should set the correct titles for sections", ^(){
      for(NSInteger section = 0; section < settings.count; section++) {
        [model tableView:nil titleForHeaderInSection:section] should equal(settings[section][@"sectionName"]);
      }
    });
    
  });
  
  describe(@"switch cells", ^(){
    beforeEach(^(){
      settings = @[
      @{@"sectionName": @"Basic",
      @"settings":
      @[@{@"type":@"FCSwitchCell", @"name":@"The Preference", @"key":@"pref"}]}
      ];
      model = [[FCSettingsViewController alloc] initWithConfiguration:settings andStyle:UITableViewStyleGrouped];
      cell = (UITableViewCell<FCBoosterCell> *)[model tableView:model.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    });
    
    it(@"should make switch cells", ^(){
      cell should be_instance_of([FCSwitchCell class]);
    });
    
    it(@"should correctly label switch cells", ^(){
      [cell.textLabel.text isEqualToString:@"The Preference"] should be_truthy;
    });
    
    it(@"should have the correct key", ^(){
      [cell.key isEqualToString:@"pref"] should be_truthy;
    });
  });
  
  describe(@"color cells", ^(){
    beforeEach(^(){
      settings = @[
      @{@"sectionName": @"Basic",
      @"settings":
      @[@{@"type":@"FCColorPickerCell", @"name":@"The Preference", @"key":@"pref"}]}
      ];
      model = [[FCSettingsViewController alloc] initWithConfiguration:settings andStyle:UITableViewStyleGrouped];
      cell = (UITableViewCell<FCBoosterCell> *)[model tableView:model.tableView cellForRowAtIndexPath:firstIndexPath];
    });
    
    it(@"should make color cells", ^(){
      cell should be_instance_of([FCColorPickerCell class]);
    });
    
    it(@"should correctly label switch cells", ^(){
      [cell.textLabel.text isEqualToString:@"The Preference"] should be_truthy;
    });
    
    it(@"should have the correct key", ^(){
      [cell.key isEqualToString:@"pref"] should be_truthy;
    });
    
    xit(@"should trigger a color view controller when tapped", ^(){
      
      [model tableView:model.tableView didSelectRowAtIndexPath:firstIndexPath];
  
      while (model.waitingForUI)
      [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                               beforeDate:[NSDate distantFuture]];
//      while (model.waitingForUI)
//        [[NSRunLoop mainRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
      
      FCColorPickerViewController *colorPicker = (FCColorPickerViewController *)model.presentedViewController;
      
      colorPicker should be_instance_of([FCColorPickerViewController class]);
      [colorPicker delegate] should equal(model);
    });
    
  });
  
});

SPEC_END
