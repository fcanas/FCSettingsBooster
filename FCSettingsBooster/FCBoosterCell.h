//
//  FCBoosterCell.h
//  FCSettingsBooster
//
//  Created by Fabian Canas on 10/27/12.
//  Copyright (c) 2012 Fabian Canas. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FCSettingsBoosterController <NSObject>

@property (nonatomic, strong) NSString *controllerKey;

@end


@protocol FCBoosterCell <NSObject>

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *labelText;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier labelText:(NSString *)label andKey:(NSString *) key;

@optional

- (id)valueControllerForSettingsController:(id<FCSettingsBoosterController>)settingsController;

@end
