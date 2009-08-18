//
//  ApplicationController.h
//  LintexTester
//
//  Created by Patrick Geiller on 12/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ApplicationController : NSObject {

	JSCocoa*	jsc;

}

- (IBAction)runTests:(id)sender;
- (IBAction)garbageCollect:(id)sender;

@end
