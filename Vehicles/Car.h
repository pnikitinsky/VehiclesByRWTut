//
//  Car.h
//  Vehicles
//
//  Created by pavel on 11/21/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

@interface Car : Vehicle
@property (nonatomic, assign) BOOL isConvertible;
@property (nonatomic, assign) BOOL isHatchback;
@property (nonatomic, assign) BOOL hasSunroof;
@property (nonatomic, assign) NSInteger numberOfDoors;
+(Car *)carWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear powerSource:(NSString *)powerSource numberOfDoors:(NSInteger)numberOfDoors convertible:(BOOL)isConvertible hatchback:(BOOL)isHatchback sunroof:(BOOL)hasSunroof;
@end
