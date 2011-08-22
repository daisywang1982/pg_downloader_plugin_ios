//
//  Downloader.m
//
//  aflx - always flexible
//  http://www.aflx.de
//  ak@aflx.de
//
//  Copyright 2011 Alexander Keller All rights reserved.
//

#import "Downloader.h"


@implementation Downloader

@synthesize callbackID;


-(PGPlugin*) initWithWebView:(UIWebView*)theWebView {
    self = (Downloader*)[super initWithWebView:theWebView];
    return self;
}

//
// This function is called via PhoneGap.exec
//
-(void) downloadFile:(NSMutableArray*)paramArray withDict:(NSMutableDictionary*)options {
    self.callbackID = [paramArray pop];
    
    NSLog(@"Downloading file...",nil);
    
    [self performSelectorInBackground:@selector(download:) withObject:paramArray];
}

//
// Download and the the file
//
-(void) download:(NSMutableArray*)paramArray {
    NSString * sourceUrl = [paramArray objectAtIndex:0];
    NSString * fileName = [paramArray objectAtIndex:1];
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSData* data = [NSData dataWithContentsOfURL: [NSURL URLWithString:sourceUrl] ];
    
    NSLog(@"Write file %@", fileName);
    NSError *error=[[[NSError alloc]init] autorelease];
    
    @try {
    	BOOL response = [data writeToFile:fileName options:NSDataWritingFileProtectionNone error:&error];
        
        if ( response == NO ) {
        	// send our results back to the main thread
        	[self performSelectorOnMainThread:@selector(fail:) withObject:[error description] waitUntilDone:YES];
    	} else {
        	// jump back to main thread
        	[self performSelectorOnMainThread:@selector(success:) withObject:fileName waitUntilDone:YES];
    	}
        
    	[pool drain];
    }
    @catch (id exception) {
        NSLog(@"Exception %@", [error description]);
            
        // jump back to main thread
        [self performSelectorOnMainThread:@selector(fail:) withObject:[error description] waitUntilDone:YES];
    	[pool drain];
    }
}

//
// Call the plugin success function
//
-(void) success:(NSMutableString *)filePath {
    NSLog(@"Success", nil);
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString: 
                                    [filePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
}

//		
// Call the plugin failure function
//
-(void) fail:(NSMutableString *)errorStr {
    NSLog(@"Error: %@", [errorStr description]);
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString: 
                                    [errorStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self writeJavascript: [pluginResult toErrorCallbackString:self.callbackID]];
    
}

- (void)dealloc {
    //if (params) {
//        [params release];
//    }
    [super dealloc];
}


@end