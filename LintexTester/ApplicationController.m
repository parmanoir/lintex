//
//  ApplicationController.m
//  LintexTester
//
//  Created by Patrick Geiller on 12/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ApplicationController.h"


@implementation ApplicationController

- (void)awakeFromNib
{
	NSLog(@"awake");
	
	jsc = [JSCocoa new];
	[jsc evalJSFile:[[NSBundle mainBundle] pathForResource:@"lintexTester" ofType:@"js"]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
//	NSLog(@"finished launching");

	id url = [NSURL fileURLWithPath:@"/Users/mini/Software Inexdo/JSCocoa/Samples/test3 copy.jscocoa"]; 
	[[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:url display:YES error:nil];


}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	return	NO;
}


@end
