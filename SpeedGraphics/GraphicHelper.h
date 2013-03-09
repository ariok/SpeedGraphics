//
//
//  Created by Yari Dareglia on 12/19/12.
//

#import <Foundation/Foundation.h>
#import "MKDatatypes.h"

@interface GraphicHelper : NSObject

@property(nonatomic,assign) CGContextRef context;
@property(nonatomic,assign) BOOL antialias;
@property(nonatomic,assign) int lineWidth;

struct GHCorner {
    float topLeft;
    float topRight;
    float bottomLeft;
    float bottomRight;
};
typedef struct GHCorner GHCorner;


+(GraphicHelper*)sharedGraphicHelper;


/***************	Context Functions		***************/

-(void) useCurrentContext;      //Set the context using current CG context
-(void) saveState;
-(void) restoreState;


/***************	Masking		***************/

-(void) clip;
-(void) clipToMask:(NSImage*)mask inRect:(NSRect)rect;


/***************	Path Functions		***************/

-(void) beginPath;
-(void) closePath;
-(void) beginPathAtPoint:(CGPoint)point;

-(void) moveToPoint:(CGPoint)point;

-(void) addLineToPoint:(CGPoint)point;
-(void) addLineToLastPoint:(CGPoint)point;      //Move to point and close current path
-(void) addLineFromPoint:(CGPoint)point toPoint:(CGPoint)point;     //Draw a line between 2 points
-(void) addLineFromPoint:(CGPoint)point withLength:(int)lenght;     //Draw horizontal line
-(void) addLineFromPoint:(CGPoint)point withHeight:(int)height;     //Draw vertical line

-(void) addArc:(CGPoint)point radius:(int)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
-(void) addArcFromPoint:(CGPoint)startPoint toPointradius:(CGPoint)endPoint radius:(int)radius;
-(void) addRect:(CGRect)rect;

-(void) drawPathWithMode:(CGPathDrawingMode)mode;
-(void) strokePath;
-(void) fillPath;
-(void) drawLineFromPoint:(CGPoint)point toPoint:(CGPoint)toPoint color:(NSColor*)color width:(int)width;
-(void) addRect:(CGRect)rect radius:(float)radius;
-(void) drawRect:(CGRect)rect fillColor:(NSColor*)fillColor strokeColor:(NSColor*)strokeColor; 


/***************	Gradient Functions		***************/

-(void) drawBaseLinearGradientWithComponents:(CGFloat*)components startPoint:(CGPoint)startPoint toPoint:(CGPoint)toPoint;


/***************	Image functions		***************/

-(void) drawImage:(NSImage*)image inRect:(CGRect)rect fromRect:(NSRect)fromRect;
-(void) drawImage:(NSImage*)image atPoint:(CGPoint)point fromRect:(NSRect)fromRect;
-(NSImage*) darkerImage:(NSImage*)image;
-(NSImage*) brighterImage:(NSImage*)image;
-(NSImage*) imageFromPath:(NSString*)imagePath;

/***************	Helpers     		***************/

-(NSRect) centerRect:(NSRect) rect inRect:(NSRect)container;


/***************	Font		***************/

-(CGFloat) fontLineHeight:(NSFont*)font;
@end



/***************	Categories		***************/
@interface NSImage(GraphicHelper)
-(CGImageRef)CGImage;
@end

/***************	C Functions		***************/
CGPoint point(int x, int y);
NSRect NSEdgeInsetsInsetRect(NSRect rect, MKEdgeInsets insets);


