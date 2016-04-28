//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <UIKit/UIKit.h>

@interface UIImage(Targa)
+(id)imageFromTGAFile:(NSString *)filename;
+(id)imageFromTGAData:(NSData *)data;
+(id)imageWithRawRGBAData:(NSData *)data width:(int)width height:(int)height;
@end