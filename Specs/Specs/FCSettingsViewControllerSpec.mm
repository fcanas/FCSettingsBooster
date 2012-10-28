#import "FCSettingsViewController.h"
#import "FCSwitchCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FCSettingsViewControllerSpec)

describe(@"FCSettingsViewController", ^{
  __block FCSettingsViewController *model;
  __block NSArray *settings;
  __block UITableViewCell *cell;
  
  beforeEach(^{
    model = [[FCSettingsViewController alloc] init];
  });
  
  describe(@"initialize with configuration", ^(){
    
    beforeEach(^{
      settings = @[
      @{@"sectionName": @"Basic",
      @"settings":
      @[@{@"type":@"FCSwitchCell", @"name":@"The Preference", @"key":@"pref"}, @"two"]},
      
      @{@"sectionName": @"Advanced",
      @"settings":
      @[@"one", @"two", @"three"]},
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
      cell = [model tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    });
    
    it(@"should make switch cells", ^(){
      cell should be_instance_of([FCSwitchCell class]);
    });
    
    it(@"should correctly label switch cells", ^(){
      [cell.textLabel.text isEqualToString:@"The Preference"] should be_truthy;
    });
  });
  
});

SPEC_END
