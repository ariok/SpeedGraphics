//
//  SpeedGraphics+PathHelpers.h
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

#import "SpeedGraphics.h"

@interface SpeedGraphics (PathHelpers)




#pragma mark - Generic Path  -
/***  Generic Path  **/

/**
 @desc: Create a path defining the first point
 **/
-(void) beginPathAtPoint:(CGPoint)point;

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
-(void) fill:(UIColor*)fillColor andStroke:(UIColor*)strokeColor;

#elif TARGET_OS_MAC
-(void) fill:(NSColor*)fillColor andStroke:(NSColor*)strokeColor;
#endif






#pragma mark - Lines  -
/*** Lines  **/

/**
 @desc: create a path line between 2 points
 **/
-(void) addLineFromPoint:(CGPoint)point toPoint:(CGPoint)point;

/**
 @desc: Create an horizontal line. Returns the point where line ends
 **/
-(CGPoint) addLineFromPoint:(CGPoint)point withLength:(int)length;

/**
 @desc: Create a vertical line.  Returns the point where line ends
 **/
-(CGPoint) addLineFromPoint:(CGPoint)point withHeight:(int)height;





#pragma mark - Shapes -
/*** Shapes  **/

/**
 @desc: Create a square path specifyng the center point and side size
 **/
-(void) addSquareAtPoint:(CGPoint)point size:(int)size;

/**
 @desc: Create a circle path with center point and radius
 **/
-(void) addCircleAPoint:(CGPoint)point radius:(int)radius;

/**
 @desc: Create a rect with rounded corners
 **/
-(void) addRect:(CGRect)rect roundedCorner:(int)round;

@end
