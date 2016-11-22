//
//  VehicleList.h
//  Vehicles
//
//  Created by Pavel Nikitinskiy on 11/22/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VehicleList : NSObject
@property (nonatomic, strong) NSArray *vehicles;

//Singleton Instance
+ (VehicleList *)sharedInstance;
@end
