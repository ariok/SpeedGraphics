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
