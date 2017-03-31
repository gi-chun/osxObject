//
//  myCustomView.m
//  sjplabObjectTrackingNew
//
//  Created by gclee on 2017. 3. 29..
//  Copyright © 2017년 SJPlab. All rights reserved.
//

#import "myCustomView.h"

@implementation myCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGFloat radius = 100.0;
    CGRect frame = CGRectMake(0, 0,
                              self.frame.size.width + radius,
                              self.frame.size.height + radius);
    
    if (CGRectContainsPoint(frame, point)) {
        return YES;
    }
    
    return [super pointInside:point withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGFloat radius = 100.0;
    CGRect frame = CGRectMake(0, 0,
                              self.frame.size.width + radius,
                              self.frame.size.height + radius);
    
    if (CGRectContainsPoint(frame, point)) {
        return self;
    }
    return [super hitTest:point withEvent:event];
            
}
@end
