//
//  CKAppDelegate.h
//  cocoa-gameoflife
//
//  Created by Adam Folmert on 12/13/14.
//  Copyright (c) 2014 Adam Folmert. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class CKMatrixView;


@interface CKAppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet CKMatrixView *matrixView;


- (IBAction)startGame:(NSButton *)sender;
- (IBAction)stopGame:(NSButton *)sender;
- (IBAction)pauseGame:(NSButton *)sender;

@end
