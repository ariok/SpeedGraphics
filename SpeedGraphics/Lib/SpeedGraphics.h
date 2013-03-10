//
//  SpeedGraphics.h
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/9/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpeedGraphics : NSObject

@property(nonatomic,assign) CGContextRef context;



#pragma mark - Class Methods  -
/*** Class Methods  ***/

/** 
 @desc: Return a reference to the singleton class object
 **/
+(SpeedGraphics*) sharedSpeedGraphics;



#pragma mark - Graphics Context  -
/*** Graphics Context  ***/

/**
 @desc: Set the default shared context  as current context
 **/
-(void) useCurrentContext;

/**
 @desc: Forces all pending drawing operations in a window context to be rendered immediately
 **/
-(void) contextFlush;

/**
 @desc: Push the current graphic state
 **/
-(void) saveState;

/**
 @desc: Pop the previous graphic state
 **/
-(void) restoreState;

/**
 @desc: Decrements the retain count of a graphics context

 **/
-(void) releaseContext;

/**
 @desc: Increment the retain count of a graphics context
 **/
-(void) retainContext;




#pragma mark - Graphics State Parameters  -
/*** Graphics State Parameters  ***/

/**
 @desc: Flatness is the accuracy of curved paths in a graphics context
 **/
@property (nonatomic, assign) CGFloat flatness;

/**
 @desc: Interpolation quality is a graphics state parameter that provides a hint for the level of quality to use for image interpolation
 **/
@property (nonatomic, assign) CGInterpolationQuality interpolationQuality;

/**
 @desc: The style for the endpoints of lines drawn in a graphics context
 **/
@property (nonatomic, assign) CGLineCap lineCap;

/**
 @desc: The line width for a graphics context.
 **/
@property (nonatomic, assign) CGFloat lineWidth;

/**
 @desc: The style for the joins of connected lines in a graphics context.
 **/
@property (nonatomic, assign) CGFloat lineJoin;

//@todo: setLineDash

/**
 @desc: The miter limit for the joins of connected lines in a graphics context
 **/
@property (nonatomic, assign) CGFloat miterLimit;

/**
 @desc: The patter phase of the graphics context
 **/
@property (nonatomic, assign) CGSize patternPhase;

//@todo: setFillPattern
//@todo: setRenderingIntent

/**
 @desc: Sets anti-aliasing on or off for a graphics context
 **/
@property (nonatomic, assign) BOOL shouldAntialias;

//@todo: setStrokePattern

/**
 @desc: Sets how Quartz composites sample values for a graphics context
 **/
@property (nonatomic, assign) CGBlendMode blendMode;

/**
 @desc: Sets whether or not to allow anti-aliasing for a graphics context
 **/
@property (nonatomic, assign) BOOL allowsAntialiasing;

/**
 @desc: Sets whether or not to allow font smoothing for a graphics context
 **/
@property (nonatomic, assign) BOOL allowsFontSmoothing;

/**
 @desc: Enables or disables font smoothing in a graphics context
 **/
@property (nonatomic, assign) BOOL shouldSmoothFonts;

/**
 @desc: Enables or disables subpixel positioning in a graphics context
 **/
@property (nonatomic, assign) BOOL shouldSubpixelPositionFonts;

/**
 @desc: Sets whether or not to allow subpixel positioning for a graphics context
 **/
@property (nonatomic, assign) BOOL allowsFontSubpixelPositioning;

/**
 @desc: Sets whether or not to allow subpixel quantization for a graphics context
 **/
@property (nonatomic, assign) BOOL allowsFontSubpixelQuantization;

/**
 @desc: Enables or disables subpixel quantization in a graphics context
 **/
@property (nonatomic, assign) BOOL shouldSubpixelQuantizeFonts;




#pragma mark - Constructing Path -
/*** Constructing Path   **/

/**
 @desc:Adds an arc of a circle to the current path, possibly preceded by a straight line segment
 **/
-(void) addArc:(CGPoint)point radius:(int)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;

/**
 @desc:Adds an arc of a circle to the current path, using a radius and tangent points
 **/
-(void) addArcWithControlPoint1:(CGPoint)cp1 controlPoint2:(CGPoint)cp2 radius:(int)radius;

/**
 @desc:Appends a cubic Bézier curve from the current point, using the provided control points and end point
 **/
-(void) addCurveWithControlPoint1:(CGPoint)cp1 controlPoint2:(CGPoint)cp2 curveEndPoint:(CGPoint)endPoint;

/**
 @desc: Adds an ellipse that fits inside the specified rectangle
 **/
-(void) addEllipseInRect:(CGRect)rect;

/**
 @desc:Adds a sequence of connected straight-line segments to the current path
 **/
-(void) addLines:(CGPoint*)points count:(size_t)count;

/**
 @desc:Appends a straight line segment from the current point to the provided point
 **/
-(void) addLineToPoint:(CGPoint)point;

/**
 @desc:Adds a previously created Quartz path object to the current path in a graphics context
 **/
-(void) addPath:(CGPathRef)path;

/**
 @desc:Returns a Quartz path object built from the current path information in a graphics context
 **/
-(CGPathRef) copyPath;

/**
 @desc:Appends a quadratic Bézier curve from the current point, using a control point and an end point you specify
 **/
-(void) addQuadCurveWithControlPoint:(CGPoint)cp1 toPoint:(CGPoint)endPoint;

/**
 @desc:Adds a rectangular path to the current path
 **/
-(void) addRect:(CGRect)rect;

/**
 @desc:Adds a set rectangular paths to the current path
 **/
-(void) addRects:(CGRect *)rects count:(size_t)count;

/**
 @desc:Creates a new empty path in a graphics context
 **/
-(void) beginPath;

/**
 @desc:Closes and terminates the current path’s subpath
 **/
-(void) closePath;


/**
 @desc: Begins a new subpath at the point you specify
 **/
-(void) moveToPoint:(CGPoint)point;




#pragma mark - Painting Path  -
/*** Painting Path  ***/

/**
 @desc: Paints a transparent rectangle
 **/
-(void) clearRect:(CGRect)rect;

/**
 @desc: Draws the current path using the provided drawing mode
 **/
-(void) drawPath:(CGPathDrawingMode)mode;

/**
 @desc: Paints the area within the current path, using the even-odd fill rule
 **/
-(void) EOFillPath;

/**
 @desc: Paints the area within the current path, using the nonzero winding number rule
 **/
-(void) fillPath;

/**
 @desc: Paints the area contained within the provided rectangle, using the fill color in the current graphics state
 **/
-(void) fillRect:(CGRect)rect;

/**
 @desc: Paints the areas contained within the provided rectangles, using the fill color in the current graphics state
 **/
-(void) fillRects:(CGRect*)rects count:(size_t)count;

/**
 @desc: Paints the area of the ellipse that fits inside the provided rectangle, using the fill color in the current graphics state
 **/
-(void) fillEllipseInRect:(CGRect)rect;

/**
 @desc: Paints a line along the current path
 **/
-(void) strokePath;

/**
 @desc: Paints a rectangular path
 **/
-(void) strokeRect:(CGRect)rect;

/**
 @desc:Paints a rectangular path, using the specified line width
 **/
-(void) strokeRect:(CGRect)rect withWidth:(CGFloat)width;

/**
 @desc: Replaces the path in the graphics context with the stroked version of the path
 **/
-(void) replacePathWithStrokedPath;

/**
 @desc: Strokes an ellipse that fits inside the specified rectangle
 **/
-(void) strokeEllipseInRect:(CGRect)rect;

/**
 @desc: Strokes a sequence of line segments
 **/
-(void) strokeLineSegments:(CGPoint*)points count:(size_t)count;




#pragma mark - Getting Information About Paths  -
/*** Getting Information About Paths  ***/

/**
 @desc: Indicates whether the current path contains any subpaths
 **/
-(BOOL) isPathEmpty;

/**
 @desc: Returns the current point in a non-empty path
 **/
-(CGPoint) getPathCurrentPoint;

/**
 @desc: Returns the smallest rectangle that contains the current path
 **/
-(CGRect) getPathBoundingBox;

/**
 @desc: Checks to see whether the specified point is contained in the current path
 **/
-(BOOL) pathContainsPoint:(CGPoint)point mode:(CGPathDrawingMode) mode;




#pragma mark - Modifying Clipping Paths -
/*** Modifying Clipping Paths ***/

/**
 @desc: Modifies the current clipping path, using the nonzero winding number rule
 **/
-(void)clip;

/**
 @desc: Modifies the current clipping path, using the even-odd rule
 **/
-(void)EOClip;

/**
 @desc: Sets the clipping path to the intersection of the current clipping path with the area defined by the specified rectangle
 **/
-(void)clipToRect:(CGRect)rect;

/**
 @desc: Sets the clipping path to the intersection of the current clipping path with the region defined by an array of rectangles
 **/
-(void)cliptoRects:(CGRect*)rects count:(size_t)count;

/**
 @desc: Returns the bounding box of a clipping path
 **/
-(CGRect)getClipBoundingBox;

/**
 @desc: Maps a mask into the specified rectangle and intersects it with the current clipping area of the graphics context
 **/
-(void)clipToMask:(CGRect)rect mask:(CGImageRef)image;




#pragma mark - Setting Color, Color Space and shadow  -
/*** Setting Color, Color Space and shadow  ***/

/**
 @desc: Sets the opacity level for objects drawn in a graphics context
 **/
@property (nonatomic, assign) CGFloat alpha;

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
 @desc: Sets the current fill color in the DeviceCMYK color space
 **/
@property (nonatomic, assign) SGCMYKColor CMYKFillColor;

/**
 @desc: Sets the current stroke color in the DeviceCMYK color space
 **/
@property (nonatomic, assign) SGCMYKColor CMYKStrokeColor;

/**
 @desc: Sets the current fill color
 **/
@property (nonatomic, assign) CGFloat* fillColor;

//@todo: CGContextSetCMYKStrokeColor

/**
 @desc: Sets the fill color space in a graphics context
 **/
@property (nonatomic, assign) CGColorSpaceRef fillColorSpace;

/**
 @desc: Sets the current fill color using a Quartz color
 **/
@property (nonatomic, assign) CGColorRef fillColorWithColor;

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
 @desc: Sets the current fill color to a value in the DeviceGray color space
 **/
@property (nonatomic, assign) SGGrayColor grayFillColor;

/**
 @desc: Sets the current stroke color to a value in the DeviceGray color space
 **/
@property (nonatomic, assign) SGGrayColor grayStrokeColor;

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
 @desc:Sets the current fill color to a value in the DeviceRGB color space
 **/
@property (nonatomic, assign) SGRGBColor RGBFillColor;

/**
 @desc:Sets the current stroke color to a value in the DeviceRGB color space
 **/
@property (nonatomic, assign) SGRGBColor RGBStrokeColor;

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
 @desc: Enables shadowing in a graphics context (using a standard black shadow)
 **/
@property (nonatomic, assign) SGBlackShadow shadow;

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

/**
 @desc:Enables shadowing with color a graphics context.
 **/
@property (nonatomic, assign) SGColorShadow shadowWithColor;

/**
 @desc: Sets the current stroke color
 **/
@property (nonatomic, assign) CGFloat* strokeColor;

/**
 @desc: Sets the current stroke color spance
 **/
@property (nonatomic, assign) CGColorSpaceRef strokeColorSpace;

/**
 @desc: Sets the current stroke color in a context, using a Quartz color.
 **/
@property (nonatomic, assign) CGColorRef strokeColorWithColor;




#pragma mark - Transforming User Space  -
/*** Transforming User Space  **/

/**
 @desc: Transforms the user coordinate system in a context using a specified matrix
 **/
-(void)concatCTM:(CGAffineTransform)transform;

/**
 @desc: Returns the current transformation matrix
 **/
-(void)getCTM;

/**
 @desc: Rotates the user coordinate system in a context
 **/
-(void)rotateCTM:(CGFloat)angle;

/**
 @desc: Changes the scale of the user coordinate system in a context
 **/
-(void)scaleCTMx:(CGFloat)sx y:(CGFloat)sy;

/**
  @desc: Changes the origin of the user coordinate system in a context
 **/
-(void)translateCTMx:(CGFloat)tx y:(CGFloat)ty;




#pragma mark - Using Transparency Layers  -
/*** Using Transparency Layers  **/

/**
 @desc: Begins a transparency layer
 **/
-(void)beginTransparencyLayer:(CFDictionaryRef)info;

/**
 @desc: Begins a transparency layer whose contents are bounded by the specified rectangle
 **/
-(void)beginTransparencyLayerWithRect:(CGRect)rect info:(CFDictionaryRef)info;

/**
 @desc: Ends a transparency layer
 **/
-(void)endTransparencyLayer;




#pragma mark - Drawing an Image to a Graphics Context  -
/*** Drawing an Image to a Graphics Context  **/

/**
 @desc: Repeatedly draws an image, scaled to the provided rectangle, to fill the current clip region
 **/
-(void)drawTiledImage:(CGImageRef)image rect:(CGRect)rect;

/**
 @desc: Draws an image into a graphics context
 **/
-(void)drawImage:(CGImageRef)image rect:(CGRect)rect;




#pragma mark - Drawing PDF Content to a Graphics Context  -
/*** Drawing PDF Content to a Graphics Context  **/

-(void)drawPDFPage:(CGPDFPageRef)page;




#pragma mark - Drawing With a Gradient  -
/*** Drawing With a Gradient  **/

/**
  @desc: Paints a gradient fill that varies along the line defined by the provided starting and ending points
  **/
-(void)drawLinearGradient:(CGGradientRef)gradient startPoint:(CGPoint)sp endPoint:(CGPoint)ep options:(CGGradientDrawingOptions)options;

/**
 @desc: Paints a gradient fill that varies along the area defined by the provided starting and ending circles
 **/
-(void)drawRadialGradient:(CGGradientRef)gradient startCenter:(CGPoint)sc startRadius:(CGFloat)sr endCenter:(CGPoint)ec endRadius:(CGFloat)er options:(CGGradientDrawingOptions)options;




#pragma mark - Drawing With a Shading  -
/*** Drawing With a Shading **/

-(void)drawShading:(CGShadingRef)shading;




#pragma mark - Setting Up a Page-Based Graphics Context  -
/*** Setting Up a Page-Based Graphics Context  **/

/**
 @desc: Starts a new page in a page-based graphics context
 **/
-(void)beginPage:(CGRect*)mediaBox;

/**
 @desc: Ends the current page in a page-based graphics context
 **/
-(void)endPage;




#pragma mark - Drawing Glyphs  -
/*** Drawing Glyphs  **/

/**
 @desc: Displays an array of glyphs at the current text position
 **/
-(void)showGlyphs:(CGGlyph*)g count:(size_t)count;

/**
 @desc:Displays an array of glyphs at a position you specify
 **/
-(void)showGlyphs:(CGGlyph*)g atPoint:(CGPoint)point count:(size_t)count;

/**
 @desc: Draws glyphs at the provided position
 **/
-(void)showGlyphs:(CGGlyph*)g atPositions:(CGPoint*)positions count:(size_t)count;

/**
 @desc: Draws an array of glyphs with varying offsets
 **/
-(void)showGlyphs:(CGGlyph*)g withAdvances:(CGSize*)advances count:(size_t)count;




#pragma mark - Drawing Text  -
/*** Drawing Text  **/

/**
 @desc: Returns the current text matrix
 **/
-(CGAffineTransform)getTextMatrix;

/**
 @desc: Returns the location at which text is drawn
 **/
-(CGPoint)getTextPosition;

/**
 @desc: Sets the font and font size in a graphics context
 **/
-(void)selectFont:(char*)name size:(CGFloat)size textEncoding:(CGTextEncoding)encoding;

/**
 @desc: Sets the current character spacing
 **/
-(void)setCharacterSpacing:(CGFloat)spacing;

/**
 @desc: Sets the platform font in a graphics context
 **/
-(void)setFont:(CGFontRef)font;

/**
 @desc: Sets the current font size
 **/
-(void)setFontSize:(CGFloat)size;

/**
 @desc: Sets the current text drawing mode
 **/
-(void)setTextDrawingMode:(CGTextDrawingMode)mode;

/**
 @desc: Sets the current text matrix
 **/
-(void)setTextMatrix:(CGAffineTransform)t;

/**
  @desc: Sets the location at which text is drawn
  **/
-(void)setTextPosition:(CGPoint)point;

/**
 @desc: Displays a character array at the current text position, a point specified by the current text matrix
 **/
-(void)showText:(char*)string length:(size_t)length;

/**
 @desc: Displays a character string at a position you specify
 **/
-(void)showText:(char*)string length:(size_t)length atPoint:(CGPoint)point;




#pragma mark - Converting Between Device Space and User Space  -
/*** Converting Between Device Space and User Space  **/

/**
 @desc: Returns an affine transform that maps user space coordinates to device space coordinates
 **/
-(CGAffineTransform) getUserSpaceToDeviceSpaceTransform;

/**
 @desc: Returns a point that is transformed from user space coordinates to device space coordinates
 **/
-(CGPoint) convertPointToDeviceSpace:(CGPoint)point;

/**
 @desc: Returns a point that is transformed from device space coordinates to user space coordinates
 **/
-(CGPoint) convertPointToUserSpace:(CGPoint)point;

/**
 @desc: Returns a size that is transformed from user space coordinates to device space coordinates
 **/
-(CGSize) convertSizeToDeviceSpace:(CGSize)size;

/**
 @desc: Returns a size that is transformed from device space coordinates to user space coordinates
 **/
-(CGSize) convertSizeToUserSpace:(CGSize)size;

/**
 @desc: Returns a rectangle that is transformed from user space coordinate to device space coordinates
 **/
-(CGRect) convertRectToDeviceSpace:(CGRect)rect;

/**
 @desc: Returns a rectangle that is transformed from device space coordinate to user space coordinates
 **/
-(CGRect) convertRectToUserSpace:(CGRect)rect;

@end
