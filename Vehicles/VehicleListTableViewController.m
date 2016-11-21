//
//  MasterViewController.m
//  Vehicles
//
//  Created by pavel on 11/21/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//
#import "VehicleListTableViewController.h"

#import "VehicleDetailViewController.h"
#import "Vehicle.h"
#import "Car.h"
@interface VehicleListTableViewController ()
@property (nonatomic, strong) NSMutableArray *vehicles;
@end

@implementation VehicleListTableViewController

#pragma mark - View Lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.vehicles = [NSMutableArray array];
    [self setupVehicleArray];
    self.title = @"Vehicles";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupVehicleArray {
    Car *mustang = [[Car alloc] init];
    //Create a car
    mustang.brandName = @"Ford";
    mustang.modelName = @"Mustang";
    mustang.modelYear = 1968;
    mustang.isConvertible = YES;
    mustang.isHatchback = NO;
    mustang.hasSunroof = NO;
    mustang.numberOfDoors = 2;
    mustang.powerSource = @"gas engine";
    [self.vehicles addObject:mustang];
    //Create another car.
    Car *outback = [[Car alloc] init];
    outback.brandName = @"Subaru";
    outback.modelName = @"Outback";
    outback.modelYear = 1999;
    outback.isConvertible = NO;
    outback.isHatchback = YES;
    outback.hasSunroof = NO;
    outback.numberOfDoors = 5;
    outback.powerSource = @"gas engine";
    
    //Add it to the array.
    [self.vehicles addObject:outback];
    
    //Create another car
    Car *prius = [[Car alloc] init];
    prius.brandName = @"Toyota";
    prius.modelName = @"Prius";
    prius.modelYear = 2002;
    prius.hasSunroof = YES;
    prius.isConvertible = NO;
    prius.isHatchback = YES;
    prius.numberOfDoors = 4;
    prius.powerSource = @"hybrid engine";
    
    //Add it to the array.
    [self.vehicles addObject:prius];
    NSSortDescriptor *modelYear = [NSSortDescriptor sortDescriptorWithKey:@"modelYear" ascending:YES];
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.vehicles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Vehicle *rowVehicle = self.vehicles[indexPath.row];
    cell.textLabel.text = [rowVehicle vehicleTitleString];
    return cell;
}
#pragma mark - Segue Handling
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Vehicle *selectedVehicle = self.vehicles[indexPath.row];
        [[segue destinationViewController] setDetailVehicle:selectedVehicle];
    }
}

@end
