//
//  WGLAppDelegate.m
//  UIWebViewWebGL
//
//  Created by Nathan de Vries on 27/10/11.
//  Copyright (c) 2011 Nathan de Vries. All rights reserved.
//

#import "WGLAppDelegate.h"

@implementation WGLAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  
//  Class ADWebView = NSClassFromString(@"ADWebView");
//  UIWebView* webView = (UIWebView *)[[[ADWebView alloc] initWithFrame:self.window.bounds] autorelease];
//  [webView setWebGLEnabled:YES];
    
  UIWebView* webView = [[[UIWebView alloc] initWithFrame:self.window.bounds] autorelease];
  
  id webDocumentView = [webView performSelector:@selector(_browserView)];
  id backingWebView = [webDocumentView performSelector:@selector(webView)];
  [backingWebView _setWebGLEnabled:YES];
  
  NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"WebGL" ofType:@"html"];
  NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]];
  [webView loadRequest:request];
  
  UIViewController* viewController = [[[UIViewController alloc] init] autorelease];
  viewController.view = webView;
  
  self.window.rootViewController = viewController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
