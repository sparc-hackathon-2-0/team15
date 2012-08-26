//
//  MyTableCell.m
//
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyTableCell.h"


@implementation MyTableCell

-(void)addColumn:(CGFloat)position {
	[columns addObject:[NSNumber numberWithInt:position]];
}


-(void)drawRect:(CGRect)rect {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1.0);
	CGContextSetLineWidth(ctx, 0.25);
	
	for(int i=0; i < [columns count]; i++) {
		CGFloat f = [((NSNumber*) [columns objectAtIndex:i]) floatValue];
		CGContextMoveToPoint(ctx, f, 0);
		CGContextAddLineToPoint(ctx, f, self.bounds.size.height);
	}
	
	CGContextStrokePath(ctx);
	
	[super drawRect:rect];
}

@end
