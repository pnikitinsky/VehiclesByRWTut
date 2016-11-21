//
//  Truck.m
//  Vehicles
//
//  Created by pavel on 11/21/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//

#import "Truck.h"

@implementation Truck
- (NSString *)goForward {
    return [NSString stringWithFormat:@"%@ Depress gas pedal.", [self changeGears:@"Drive"]];
}

- (NSString *)stopMoving {
    return [NSString stringWithFormat:@"Depress brake pedal. %@", [self changeGears:@"Park"]];
}
- (NSString *)soundBackupAlarm {
    return @"Beep! Beep! Beep! Beep!";
}
- (NSString *)goBackward {
    NSMutableString *backwardString = [NSMutableString string];
    if (self.cargoCapacityCubicFeet > 100) {
        //Sound a backup alarm first
        [backwardString appendFormat:@"Wait for \"%@\", then %@", [self soundBackupAlarm], [self changeGears:@"Reverse"]];
    } else {
        [backwardString appendFormat:@"%@ Depress gas pedal.", [self changeGears:@"Reverse"]];
    }
    
    return backwardString;
}
- (NSString *)makeNoise {
    if (self.numberOfWheels <= 4) {
        return @"Beep beep!";
    } else if (self.numberOfWheels > 4 && self.numberOfWheels <= 8) {
        return @"Honk!";
    } else {
        return @"HOOOOOOOOONK!";
    }
}

-(NSString *)vehicleDetailsString {
    //Get basic details from superclass
    NSString *basicDetails = [super vehicleDetailsString];
    
    //Initialize mutable string
    NSMutableString *truckDetailsBuilder = [NSMutableString string];
    [truckDetailsBuilder appendString:@"\n\nTruck-Specific Details:\n\n"];
    
    //Add info about truck-specific features.
    [truckDetailsBuilder appendFormat:@"Cargo Capacity: %d cubic feet", self.cargoCapacityCubicFeet];
    
    //Create the final string by combining basic and truck-specific details.
    NSString *truckDetails = [basicDetails stringByAppendingString:truckDetailsBuilder];
    
    return truckDetails;
}
@end