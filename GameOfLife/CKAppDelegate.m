//
//  CKAppDelegate.m
//  cocoa-gameoflife
//
//  Created by Adam Folmert on 12/13/14.
//  Copyright (c) 2014 Adam Folmert. All rights reserved.
//

#import "CKAppDelegate.h"
#import "CKMatrixView.h"


static const NSTimeInterval kCKAppDelegateTimerInterval = 0.1;


@implementation CKAppDelegate
{
    NSTimer *_timer;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)startTimer
{
    if (_timer != nil) {
        [_timer invalidate];
        _timer = nil;
    }

    _timer = [NSTimer scheduledTimerWithTimeInterval:kCKAppDelegateTimerInterval
                                               target:self
                                             selector:@selector(tickTimer)
                                             userInfo:nil
                                              repeats:YES];

}


- (void)stopTimer
{
    if (_timer != nil) {
        [_timer invalidate];
    }
    _timer = nil;
}



- (void)tickTimer
{
    [_matrixView randomizeActive];

}

- (void)windowWillMove:(NSNotification *)notification   
{
    NSLog(@"Window will move yaya!");
}


- (IBAction)startGame:(NSButton *)sender 
{
    NSLog(@"Game started!");
    [self startTimer];

    
}

- (IBAction)stopGame:(NSButton *)sender 
{
    NSLog(@"Game stopped ");
    [self stopTimer];
}

- (IBAction)pauseGame:(NSButton *)sender 
{
    NSLog(@"Game paused !");
}

@end
