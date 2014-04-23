//
//  HDBlendedImage.h
//  blended-image-ios
//
//  Created by Jesse Curry on 4/23/14.
//  Copyright (c) 2014 Haneke Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDBlendedImageLayer.h"

@interface HDBlendedImage : NSObject
- (void)addLayer: (HDBlendedImageLayer*)layer;
- (void)removeLayer: (HDBlendedImageLayer*)layer;

@property (nonatomic, readonly) UIImage* image;
@end
