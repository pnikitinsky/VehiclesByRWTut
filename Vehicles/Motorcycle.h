//
//  Motorcycle.h
//  Vehicles
//
//  Created by pavel on 11/21/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

@interface Motorcycle : Vehicle
@property (nonatomic, strong) NSString *engineNoise;
+(Motorcycle *)motorcycleWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear engineNoise:(NSString *)engineNoise;
@end
