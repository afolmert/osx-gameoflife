//
//  CKMatrixView.m
//  cocoa-gameoflife
//
//  Created by Adam Folmert on 12/13/14.
//  Copyright (c) 2014 Adam Folmert. All rights reserved.
//

#import "CKMatrixView.h"

#import "CKCellView.h"
#import "CKMatrix.h"


static const NSUInteger kCKMatrixRowCount = 30; //70;

static const NSUInteger kCKMatrixColCount = 30; //100;

static const CGFloat kCKMatrixViewCellWidth = 25;

static const CGFloat kCKMatrixViewCellHeight = 25;

static const CGFloat kCKMatrixViewLineWidth = 1;



@implementation CKMatrixView

{
    CKMatrix *_matrix;
}


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here
        

        _matrix = [CKMatrix matrixWithRowCount:kCKMatrixRowCount columnCount:kCKMatrixColCount];
                
        for (NSUInteger row = 0; row < kCKMatrixRowCount; row++) {
            for (NSUInteger column = 0; column < kCKMatrixColCount; column++) {

                NSRect cellFrame = [self cellFrameAtRow:row column:column];
                CKCellView *cellView = [[CKCellView alloc] initWithFrame:cellFrame];

                cellView.row = row;
                cellView.column = column;
                
                [self addSubview:cellView];

                [_matrix setValue:cellView atRow:row column:column];
            }
        }
        
    }
    
    return self;
}

- (NSRect)cellFrameAtRow:(NSUInteger)row column:(NSUInteger)column
{
    return NSMakeRect(column * kCKMatrixViewCellWidth + kCKMatrixViewLineWidth / 2,
            row * kCKMatrixViewCellHeight + kCKMatrixViewLineWidth / 2,
            kCKMatrixViewCellWidth - kCKMatrixViewLineWidth,
            kCKMatrixViewCellHeight - kCKMatrixViewLineWidth);

}

- (void)randomizeActive
{
    for (NSUInteger i = 0; i < 40; i++) {
        NSInteger row =  arc4random() % kCKMatrixRowCount;
        NSInteger column = arc4random() % kCKMatrixColCount;


        CKCellView *cellView = [_matrix valueAtRow:row column:column];

        cellView.active = !cellView.active;


    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor whiteColor] set];
    NSRectFill([self bounds]);
    
    [[NSColor lightGrayColor] set];
    
    
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    
    [path setLineWidth:kCKMatrixViewLineWidth];
    
    
    NSRect bounds = [self bounds];
    
    NSUInteger x = 0;
    NSUInteger y = 0;
    
    while (x < bounds.size.width) {
        
        [path moveToPoint:NSMakePoint(x, 0)];
        [path lineToPoint:NSMakePoint(x, bounds.size.height)];
        
        x += kCKMatrixViewCellWidth;
        
    }
    
    while (y < bounds.size.height) {
        
        [path moveToPoint:NSMakePoint(0, y)];
        [path lineToPoint:NSMakePoint(bounds.size.width, y)];
        
        y += kCKMatrixViewCellHeight;
    }
    
    
    [path stroke];
    // Drawing code here.
}

@end
