//
//  DetailViewController.h
//  Vehicles
//
//  Created by pavel on 11/21/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>

//Forward declaration of a class to be imported in the .m file
@class Vehicle;

@interface VehicleDetailViewController : UIViewController

@property (strong, nonatomic) Vehicle *detailVehicle;

@end
