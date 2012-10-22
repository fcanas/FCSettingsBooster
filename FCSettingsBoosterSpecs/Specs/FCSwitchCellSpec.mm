#import "FCSwitchCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FCSwitchCellSpec)

describe(@"FCSwitchCell", ^{
  __block FCSwitchCell *model;
  
  beforeEach(^{
    model = [[FCSwitchCell alloc] init];
  });
  
  it(@"should have a UISwitch as its accessory view", ^(){
    model.accessoryView should be_instance_of([UISwitch class]);
  });
  
});

SPEC_END
