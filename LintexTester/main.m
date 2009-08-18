//
//  main.m
//  LintexTester
//
//  Created by Patrick Geiller on 12/08/09.
//  Copyright __MyCompanyName__ 2009 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
	id pool = [NSAutoreleasePool new];
	
	
	id defaults = [NSUserDefaults standardUserDefaults];

	id defaultDefaults = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"defaults" ofType:@"plist"]];
	[defaults registerDefaults:defaultDefaults];
	[defaults synchronize];
	
	[pool release];

    return NSApplicationMain(argc, (const char **) argv);
}
