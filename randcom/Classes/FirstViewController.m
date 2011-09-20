//
//  FirstViewController.m
//  randcom
//
//  Created by Sandy D Vanderbleek199 on 9/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "SBJson.h"


@implementation FirstViewController



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
        commonsURL = [NSURL URLWithString: @"http://api.flickr.com/services/rest/?method=flickr.commons.getInstitutions&api_key=a05db3659e0d2f3e28327489d2dd37e2&format=json&nojsoncallback=1"];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	ASIHTTPRequest* commonsRequest = [ASIHTTPRequest requestWithURL:commonsURL];
	[commonsRequest setDelegate: self];
	[commonsRequest startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
	NSString* commonsResponse = [request responseString];
	SBJsonParser* parse = [[SBJsonParser alloc] init];
	NSMutableDictionary* commonsJSON = [parse objectWithString:commonsResponse];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
