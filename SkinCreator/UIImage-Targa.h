//
//  UIImage-Targa.h
//  SkinCreator
//
//  Created by Gabriel Sorensen on 4/15/16.
//  Copyright © 2016 TeamEvil. All rights reserved.
//
//Note that this is all from Jeff Lamarche
#ifndef UIImage_Targa_h
#define UIImage_Targa_h


#endif /* UIImage_Targa_h */
#import <UIKit/UIKit.h>

@interface UIImage(Targa)
+(id)imageFromTGAFile:(NSString *)filename;
+(id)imageFromTGAData:(NSData *)data;
+(id)imageWithRawRGBAData:(NSData *)data width:(int)width height:(int)height;
@end