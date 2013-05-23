//
//  MSGestaltViewController.h
//  alpha
//
//  Created by Michael Garrido on 5/1/13.
//  Copyright (c) 2013 Michael Garrido. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccelerometerFilter;

@interface MSGestaltViewController : UIViewController<UIAccelerometerDelegate> {
    UIAccelerationValue gX, gY, gZ;
    
    UIView *layerR;
    UIView *layerG;
    UIView *layerB;
    
    AccelerometerFilter *filter;
}

@property(nonatomic, readonly) UIAccelerationValue gX;
@property(nonatomic, readonly) UIAccelerationValue gY;
@property(nonatomic, readonly) UIAccelerationValue gZ;

@end
