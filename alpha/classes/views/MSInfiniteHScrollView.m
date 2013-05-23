//
//  MSInfiniteHScrollView.m
//  alpha
//
//  Created by Michael Garrido on 5/1/13.
//  Copyright (c) 2013 Michael Garrido. All rights reserved.
//

#import "MSInfiniteHScrollView.h"

@implementation MSInfiniteHScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) addNextView:(UIView*)nextView {
    
    //add height of nextView to offsetY
    offsetY += nextView.frame.size.height;
    NSLog(@"new scroll Y offset: %f",offsetY);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
