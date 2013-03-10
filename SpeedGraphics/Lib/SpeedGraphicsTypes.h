//
//  SpeedGraphicsTypes.h
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

#ifndef SpeedGraphics_SpeedGraphicsTypes_h
#define SpeedGraphics_SpeedGraphicsTypes_h

/**
 @desc: Define a LineDash structure
 **/
typedef struct {
    CGFloat phase;
    CGFloat* lenghts;
    size_t count;
}SGLineDash;

static inline SGLineDash
SGLineDashMake(CGFloat phase, CGFloat* lenghts, size_t count)
{
    SGLineDash l; l.phase = phase; l.lenghts = lenghts; l.count = count;  return l;
}

/**
 @desc: Define a strokePatter structure
 **/
typedef struct {
    CGPatternRef pattern;
    CGFloat* components;
}SGPattern;

static inline SGPattern
SGPatternMake(CGPatternRef pattern, CGFloat* components)
{
    SGPattern p; p.pattern = pattern; p.components = components;  return p;
}

/**
 @desc: Define a color in the DeviceGray color space
 **/
typedef struct {
    CGFloat c;
    CGFloat m;
    CGFloat y;
    CGFloat k;
    CGFloat a;
}SGCMYKColor;

static inline SGCMYKColor
SGCMYKColorMake(CGFloat c, CGFloat m, CGFloat y, CGFloat k, CGFloat alpha)
{
    SGCMYKColor g; g.c = c; g.m = m; g.y = y; g.k = k; g.a = alpha; return g;
}

/**
 @desc: Define a color in the DeviceGray color space
 **/
typedef struct {
    CGFloat gray;
    CGFloat alpha;
}SGGrayColor;

static inline SGGrayColor
SGGrayColorMake(CGFloat gray, CGFloat alpha)
{
    SGGrayColor g; g.gray = gray; g.alpha = alpha; return g;
}

/**
 @desc: Define a RGB color in the DeviceGray color space
 **/
typedef struct {
    CGFloat r;
    CGFloat g;
    CGFloat b;
    CGFloat a;
    
}SGRGBColor;

static inline SGRGBColor
SGRGBColorMake(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
    SGRGBColor c; c.r = r; c.g = g; c.b = b; c.a = a; return c;
}

/**
 @desc: Define a black Shadow 
 **/
typedef struct {
    CGSize offset;
    CGFloat blur;
    
}SGBlackShadow;

static inline SGBlackShadow
SGBlackShadowMake(CGSize offset, CGFloat blur)
{
    SGBlackShadow s; s.offset = offset; s.blur = blur; return s;
}

/**
 @desc: Define a color Shadow
 **/
typedef struct {
    CGSize offset;
    CGFloat blur;
    CGColorRef color;
    
}SGColorShadow;

static inline SGColorShadow
SGColorShadowMake(CGSize offset, CGFloat blur, CGColorRef color)
{
    SGColorShadow s; s.offset = offset; s.blur = blur; s.color = color;  return s;
}
#endif
