//
//  MSInfiniteHScrollView.h
//  alpha
//
//  Created by Michael Garrido on 5/1/13.
//  Copyright (c) 2013 Michael Garrido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSInfiniteHScrollView : UIScrollView {
    double offsetY;
}
-(void) addNextView:(UIView*)nextView; //append new items to the top of scroll view

-(void) scrolledUpCallback; //when root view is scrolling up a lot
-(void) scrolledDownCallback; //when root view is scrolling down a lot

@end
