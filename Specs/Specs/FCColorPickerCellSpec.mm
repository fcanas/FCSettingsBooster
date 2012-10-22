#import "FCColorPickerCell.h"
#import "NSUserDefaults+UIColor.h"

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
                                                       textLabel:@"Color Preference"
                                                          andKey:preferenceKey];
    });
  
  describe(@"init", ^(){
    
  });
  
});

SPEC_END
