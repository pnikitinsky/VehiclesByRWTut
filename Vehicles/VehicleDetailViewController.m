//
//  DetailViewController.m
//  Vehicles
//
//  Created by pavel on 11/21/16.
//  Copyright © 2016 Designated Nerd Software. All rights reserved.
//
#import "VehicleDetailViewController.h"

#import "Vehicle.h"

#import "UIAlertView+Convenience.h"

@interface VehicleDetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *vehicleDetailsLabel;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *contentView;


@end

@implementation VehicleDetailViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

-(void)viewDidLayoutSubviews
{
    //This method is called any time AutoLayout fires - this means it will fire when the user
    //rotates his or her device.
    [super viewDidLayoutSubviews];
    
    //Create a CGRect that contains all the subviews of the content view.
    CGRect allSubviewsFrame = CGRectZero;
    for (UIView *subview in self.contentView.subviews) {
        allSubviewsFrame = CGRectUnion(allSubviewsFrame, subview.frame);
    }
    
    //Set the scrollview content size to the width of the main view and 20 points
    //below the bottom of the CGRect that contains all the subviews so that it scrolls to the
    //appropriate point. 
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(allSubviewsFrame) + 20);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail item
- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailVehicle) {
        self.title = [self.detailVehicle vehicleTitleString];
        self.vehicleDetailsLabel.text = [self.detailVehicle vehicleDetailsString];
       
        
    }
}

#pragma mark - IBActions

-(IBAction)turn
{
    //Create an alert view with a single text input to capture the number of degrees
    //to turn your vehicle. Set this class as the delegate so one of the delegate methods
    //can retrieve what the user entered.
    UIAlertView *turnEntryAlertView = [[UIAlertView alloc] initWithTitle:@"Turn" message:@"Enter number of degrees to turn:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Go!", nil];
    turnEntryAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[turnEntryAlertView textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [turnEntryAlertView show];
}




-(IBAction)goForward:(UIButton *)sender {
    [UIAlertView showSimpleAlertWithTitle:@"Go Forward" andMessage:[self.detailVehicle goForward]];
}
- (IBAction)stopMoving:(UIButton *)sender {
    [UIAlertView showSimpleAlertWithTitle:@"Stop Moving" andMessage:[self.detailVehicle stopMoving]];
}
- (IBAction)goBackward:(UIButton *)sender {
     [UIAlertView showSimpleAlertWithTitle:@"Go Backward" andMessage:[self.detailVehicle goBackward]];
}
- (IBAction)makeNoise:(UIButton *)sender {
    [UIAlertView showSimpleAlertWithTitle:@"Make Some Noise!" andMessage:[self.detailVehicle makeNoise]];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Note: Only one alert view will actually declare this class its delegate, so we can
    //      proceed without double-checking the alert view instance. If you have more than
    //      one alert view using the same class as its delegate, make sure you check which
    //      UIAlertView object is calling this delegate method.
    if (buttonIndex != alertView.cancelButtonIndex) {
        //Get the text the user input in the text field
        NSString *degrees = [[alertView textFieldAtIndex:0] text];
        
        //Convert it from a string to an integer
        NSInteger degreesInt = [degrees integerValue];
        
        //Use the simple alert view to display the information for turning.
        [UIAlertView showSimpleAlertWithTitle:@"Turn" andMessage:[self.detailVehicle turn:degreesInt]];
    } //else the user has cancelled, and we don't need to do anything.
}

@end
