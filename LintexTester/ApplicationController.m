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
	jsc = [JSCocoa new];
	[jsc evalJSFile:[[NSBundle mainBundle] pathForResource:@"lintexTester" ofType:@"js"]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
//	NSLog(@"finished launching");

//	id url = [NSURL fileURLWithPath:@"/Users/mini/Software Inexdo/JSCocoa/Samples/test3 copy.jscocoa"]; 
//	[[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:url display:YES error:nil];
	[self performSelector:@selector(runTests:) withObject:nil afterDelay:0];
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	return	NO;
}

//
// Run unit tests
//
int runCount = 0;
BOOL calledWithObjCSyntax;
- (IBAction)runTests:(id)sender
{
//	NSLog(@"run tests");
	
	calledWithObjCSyntax = NO;

	id path = [[NSBundle mainBundle] bundlePath];
	path = [NSString stringWithFormat:@"%@/Contents/Resources/Tests", path];
//	NSLog(@"Run %d from %@", runCount, path);
	int testCount = [jsc runTests:path withSelector:@selector(evalJSFileWithLintex:)];
	BOOL b = !!testCount && calledWithObjCSyntax;
	[self garbageCollect:nil];

	if (!b)	{	NSLog(@"!!!!!!!!!!!FAIL %d from %@", runCount, path); return; }
	else	
	{

		int delayedTestCount = [jsc toInt:[jsc callJSFunctionNamed:@"delayedTestCount" withArguments:nil]];
		
		if (delayedTestCount)	NSLog(@"All %d tests ran OK, %d delayed pending", testCount, delayedTestCount);
		else					NSLog(@"All %d tests ran OK !", testCount);
	}
}

- (void)callMeWithObjCSyntaxWithA:(int)a andB:(float)b andC:(id)c
{
	if (a == 2 && b == 5.123 && c == self)	calledWithObjCSyntax = YES;
}

//
// GC
//
- (IBAction)garbageCollect:(id)sender
{
	[jsc garbageCollect];
}


@end
