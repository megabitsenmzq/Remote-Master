//
//  main.m
//  Remote Master Helper
//
//  Created by Jinyu Meng on 2020/11/17.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    NSArray *pathComponents = [[[NSBundle mainBundle] bundlePath] pathComponents];
    pathComponents = [pathComponents subarrayWithRange:NSMakeRange(0, [pathComponents count] - 4)];
    NSString *path = [NSString pathWithComponents:pathComponents];
    [[NSWorkspace sharedWorkspace] launchApplication:path];
    return NSApplicationMain(argc, argv);
}
