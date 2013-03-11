//
//  SpeedGraphics+PathHelpers.m
//  SpeedGraphics
//
/*
 Copyright [2013] [Yari D'areglia]
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

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

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
-(void) fill:(UIColor*)fillColor andStroke:(UIColor*)strokeColor{
    [fillColor setFill];
    [strokeColor setStroke];
    
    [self fillAndStrokePath];
}

#elif TARGET_OS_MAC
-(void) fill:(NSColor*)fillColor andStroke:(NSColor*)strokeColor{
    [fillColor setFill];
    [strokeColor setStroke];
    
    [self fillAndStrokePath];
}
#endif




#pragma mark - Lines  -
/*** Lines  **/

/**
 @desc: create a path line between 2 points
 **/
-(void) addLineFromPoint:(CGPoint)point toPoint:(CGPoint)toPoint{
    [self addLineToPoint:point];
    [self addLineToPoint:toPoint];
}

/**
 @desc: Create an horizontal line. Returns the point where line ends
 **/
-(CGPoint) addLineFromPoint:(CGPoint)point withLength:(int)length{
    [self addLineToPoint:point];
    CGPoint endPoint = CGPointMake(point.x + length, point.y);
    [self addLineToPoint:endPoint];
    
    return endPoint;
}

/**
 @desc: Create a vertical line.  Returns the point where line ends
 **/
-(CGPoint) addLineFromPoint:(CGPoint)point withHeight:(int)height{
    [self addLineToPoint:point];
    CGPoint endPoint = CGPointMake(point.x, point.y + height);
    [self addLineToPoint: endPoint];
    
    return endPoint;
}




#pragma mark - Shapes -
/*** Shapes  **/

/**
 @desc: Create a square path specifyng the center point and side size
 **/
-(void) addSquareAtPoint:(CGPoint)point size:(int)size{
    [self addRect:CGRectMake(point.x - (size/2), point.y - (size/2), size, size)];
}

/**
 @desc: Create a circle path with center point and radius
 **/
-(void) addCircleAPoint:(CGPoint)point radius:(int)radius{
    [self addEllipseInRect:CGRectMake(point.x - radius, point.y - radius, radius/2, radius/2)];
}

/**
 @desc: Create a rect with rounded corners
 **/
-(void) addRect:(CGRect)rect roundedCorner:(int)round{
    [self beginPath];
    
    [self moveToPoint:CGPointMake(CGRectGetMinX(rect) + round, CGRectGetMinY(rect))];
    [self addArc:CGPointMake(CGRectGetMaxX(rect) - round, CGRectGetMinY(rect) + round) radius:round startAngle:3 * M_PI / 2 endAngle:0 clockwise:0];
    [self addArc:CGPointMake(CGRectGetMaxX(rect) - round, CGRectGetMaxY(rect) - round) radius:round startAngle:0 endAngle:M_PI / 2 clockwise:0];
    [self addArc:CGPointMake(CGRectGetMinX(rect) + round, CGRectGetMaxY(rect) - round) radius:round startAngle:M_PI / 2 endAngle:M_PI clockwise:0];
    [self addArc:CGPointMake(CGRectGetMinX(rect) + round, CGRectGetMinY(rect) + round) radius:round startAngle:M_PI endAngle:3 * M_PI / 2 clockwise:0];
    
    [self closePath];
}




@end
