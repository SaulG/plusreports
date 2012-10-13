//
//  File.c
//  Example
//
//  Created by Saul Gausin on 12/10/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration
-(void)viewDidLoad{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"perfil" ofType:@"html" inDirectory:@"crimea"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIWebView *webview = [[UIWebView alloc] init];
    [webview loadRequest:request];
    NSLog(@"A Ya se hace request");
    self.view = webview;
}
@end