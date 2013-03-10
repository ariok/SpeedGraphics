//
//  SpeedGraphics+PathHelpers.m
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/10/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "SpeedGraphics+PathHelpers.h"

@implementation SpeedGraphics (PathHelpers)


#pragma mark - Generic Path  -
/***  Generic Path  **/

/**
 @desc: Create a path defining the first point
 **/
-(void) beginPathAtPoint:(CGPoint)point{
    [self beginPath];
    [self moveToPoint:point];
}




#pragma mark - Lines  -
/*** Lines  **/

/**
 @desc: create a path line between 2 points
 **/
-(void) addLineFromPoint:(CGPoint)point toPoint:(CGPoint)toPoint{
    CGContextAddLineToPoint(self.context, point.x, point.y);
    CGContextAddLineToPoint(self.context, toPoint.x, toPoint.y);
}

/**
 @desc: Create an horizontal line
 **/
-(void) addLineFromPoint:(CGPoint)point withLength:(int)length{
    CGContextAddLineToPoint(self.context, point.x, point.y);
    CGContextAddLineToPoint(self.context, point.x + length, point.y);
}

/**
 @desc: Create a vertical line
 **/
-(void) addLineFromPoint:(CGPoint)point withHeight:(int)height{
    CGContextAddLineToPoint(self.context, point.x, point.y);
    CGContextAddLineToPoint(self.context, point.x, point.y + height);
}


@end
