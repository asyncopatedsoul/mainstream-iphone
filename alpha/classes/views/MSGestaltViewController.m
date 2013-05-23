//
//  MSGestaltViewController.m
//  alpha
//
//  Created by Michael Garrido on 5/1/13.
//  Copyright (c) 2013 Michael Garrido. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "MSGestaltViewController.h"
#import "AccelerometerFilter.h"

#define kUpdateFrequency	60.0

@interface MSGestaltViewController ()

@end

@implementation MSGestaltViewController
@synthesize gX, gY, gZ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //static layers and masks
    //[self.view setBackgroundColor:[UIColor grayColor]];
    
    UIView *videoPreview = [[UIView alloc] initWithFrame:CGRectMake(5, 50, 310, 233)];
    [videoPreview setBackgroundColor:[UIColor grayColor]];
    
    UIImageView *videoThumb = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"proxy-thumbnail.jpg"]];
    [videoThumb setFrame:CGRectMake(0, 0, 310, 233)];
    

    // Create a mask layer and the frame to determine what will be visible in the view.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect = CGRectMake(0, 0, 310, 233);
    
    // Create a path and add the rectangle in it.
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, maskRect);
    
    // Set the path to the mask layer.
    [maskLayer setPath:path];
    
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    
    // Set the mask of the view.
    //self.view.layer.mask = maskLayer;
    videoPreview.layer.mask = maskLayer;
    
    //dynamic layers
    layerR = [[UIView alloc] initWithFrame:CGRectMake(0,0, 220.0, 24.0)];
    UIImageView *videoStatus = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"proxy-status.png"]];
    [videoStatus setFrame:CGRectMake(0, 0, 220, 14)];
    [layerR addSubview:videoStatus];
    //[layerR setBackgroundColor:[UIColor redColor]];
    
    layerG = [[UIView alloc] initWithFrame:CGRectMake(0,0, 257.0, 44.0)];
    UIImageView *commentButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn-comment.png"]];
    [commentButton setFrame:CGRectMake(0, 0, 44, 44)];
    UIImageView *likeButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn-like.png"]];
    [likeButton setFrame:CGRectMake(71, 0, 44, 44)];
    UIImageView *restreamButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn-restream.png"]];
    [restreamButton setFrame:CGRectMake(142, 0, 44, 44)];
    UIImageView *cloudButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn-cloud.png"]];
    [cloudButton setFrame:CGRectMake(213, 0, 44, 44)];
    
    [layerG addSubview:commentButton];
    [layerG addSubview:likeButton];
    [layerG addSubview:restreamButton];
    [layerG addSubview:cloudButton];
    //[layerG setBackgroundColor:[UIColor greenColor]];
    
    layerB = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320.0, 480.0)];
    UIImageView *videoTitle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"proxy-title.png"]];
    [videoTitle setFrame:CGRectMake(104.5, 25, 111, 14)];
    UIImageView *videoMeta = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"proxy-comments.png"]];
    [videoMeta setFrame:CGRectMake(7.5, 303, 305, 94)];
    UIImageView *videoDivider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"item-divider.jpg"]];
    //[videoDivider setFrame:CGRectMake(0, 427, 320, 1)];
    [videoDivider setFrame:CGRectMake(0, 415, 320, 1)];
    UIImageView *videoTitle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"proxy-title2.png"]];
    [videoTitle2 setFrame:CGRectMake(122.5, 445, 75, 12)];
    //[layerB setBackgroundColor:[UIColor blueColor]];
    [layerB addSubview:videoTitle];
    [layerB addSubview:videoMeta];
    //[layerB addSubview:videoDivider];
    [layerB addSubview:videoTitle2];
    [self.view addSubview:videoDivider];
    
    [videoPreview addSubview:videoThumb];
    [videoPreview addSubview:layerG];
    [videoPreview addSubview:layerR];
    
    [self.view addSubview:videoPreview];
    
    [self.view addSubview:layerB];
    //[self.view addSubview:layerG];
    //[self.view addSubview:layerR];
    
    //acceleromter and fitler setup
    filter = [[LowpassFilter alloc] initWithSampleRate:kUpdateFrequency cutoffFrequency:5.0];
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0 / kUpdateFrequency];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UIAccelerometerDelegate method, called when the device accelerates.
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{

	// Update the accelerometer graph view
		[filter addAcceleration:acceleration];
		//[unfiltered addX:acceleration.x y:acceleration.y z:acceleration.z];
		//[filtered addX:filter.x y:filter.y z:filter.z];
    
    //double alpha = 0.076923;
    
    /*
    gX = acceleration.x * alpha + gX * (1.0 - alpha);
	gY = acceleration.y * alpha + gY * (1.0 - alpha);
	gZ = acceleration.z * alpha + gZ * (1.0 - alpha);
     */
    /*
    gX = acceleration.x; // * alpha + x * (1.0 - alpha);
	gY = acceleration.y; // * alpha + y * (1.0 - alpha);
	gZ = acceleration.z; // * alpha + z * (1.0 - alpha);
    */
    //NSLog(@"position x:%f y:%f z:%f",gX*100,gY*100,gZ*100);
    /*
    [self shiftLayer:layerR withCoefficient:1.0 byX:gX byY:gY byZ:gZ];
    [self shiftLayer:layerG withCoefficient:0.6 byX:gX byY:gY byZ:gZ];
    [self shiftLayer:layerB withCoefficient:0.2 byX:gX byY:gY byZ:gZ];
     */
    [self shiftLayer:layerR withCoefficient:1.0 byX:filter.x byY:filter.y byZ:filter.z atX:160.0 atY:70.0 maxHorizontal:40.0 maxVertical:160.0];
    [self shiftLayer:layerG withCoefficient:1.7 byX:filter.x byY:filter.y byZ:filter.z atX:160.0 atY:390.0 maxHorizontal:30.0 maxVertical:160.0];
    [self shiftLayer:layerB withCoefficient:0.2 byX:filter.x byY:filter.y byZ:filter.z atX:160.0 atY:240.0 maxHorizontal:40.0 maxVertical:70.0];
}

// Gestalt logic
-(void)shiftLayer:(UIView *)aLayer withCoefficient: (float)coeff byX: (float)dX byY: (float)dY byZ: (float)dZ atX: (float)oX atY: (float)oY maxHorizontal: (float)mX maxVertical: (float)mY
{
    //range X
    //0 - 130 - 290
    
    //range Y
    //0 - 210 - 450
    
    float newX = (oX-aLayer.frame.size.width/2)+dX*mX*coeff;
    float newY = (oY-aLayer.frame.size.height/2)+(dZ)*mY*coeff;
    //float newY = (oY-aLayer.frame.size.height/2)-(dY+0.7)*mY*coeff;
    //float newY = 210-(dZ+1.0)*240*coeff;
    
    //float newZ = dZ*1;
    
    //NSLog(@"position x:%f y:%f",newX,newY);
    
    
    [aLayer setFrame:CGRectMake(newX, newY, aLayer.frame.size.width, aLayer.frame.size.height)];
    
}

@end
