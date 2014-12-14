//
//  CKCellView.m
//  cocoa-2048
//
//  Created by Adam Folmert on 11/29/14.
//  Copyright (c) 2014 Adam Folmert. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CKCellView.h"
#import "CKUtils.h"

@implementation CKCellView
{
    NSTrackingArea *_trackingArea;
    NSColor *_color;
}


@synthesize row = _row;
@synthesize column = _column;
@synthesize active = _active;


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _row = 0;
        _column = 0;

        _active = YES;

        _trackingArea = [[NSTrackingArea alloc]
                         initWithRect:NSMakeRect(0, 0, frame.size.width, frame.size.height)
                                                     options: NSTrackingActiveInActiveApp |  NSTrackingMouseEnteredAndExited
                                                       owner:self
                                                    userInfo:nil];
        [self addTrackingArea:_trackingArea];

        _color = [NSColor darkGrayColor];

    }

    return self;
}

- (void)setActive:(BOOL)active
{

    _active = active;

    [NSAnimationContext beginGrouping];

    [NSAnimationContext currentContext].duration = 0.3;
    [NSAnimationContext currentContext].timingFunction = [CAMediaTimingFunction
            functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    if (_active) {
        [[self animator] setAlphaValue:1.0];
    } else {
        [[self animator] setAlphaValue:0.0];
    }
    [NSAnimationContext endGrouping];
}

- (BOOL)active
{
    return _active;
}


- (void)mouseEntered:(NSEvent *)theEvent
{
    [[self animator] setAlphaValue:0.0];
//    _color = [NSColor blueColor];
//    [self setNeedsDisplay:YES];
    NSLog(@"Cell is of row %@ and column %@ ", @(_row), @(_column));
}

- (void)mouseExited:(NSEvent *)theEvent
{
//    _color = [NSColor grayColor];
//    [self setNeedsDisplay:YES];
    [[self animator] setAlphaValue:1.0];

}

- (void)drawRect:(NSRect)dirtyRect
{
    [_color set];
    NSRectFill([self bounds]);

 }

@end
