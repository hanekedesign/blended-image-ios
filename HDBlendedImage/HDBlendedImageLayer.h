//
//  HDBlendedImageLayer.h
//  blended-image-ios
//
//  Created by Jesse Curry on 4/23/14.
//  Copyright (c) 2014 Haneke Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDBlendedImageLayer : NSObject
+ (HDBlendedImageLayer*)layerWithImage: (UIImage*)image
                             blendMode: (CGBlendMode)blendMode;
+ (HDBlendedImageLayer*)layerWithFillColor: (UIColor*)fillColor
                                 blendMode: (CGBlendMode)blendMode;

// Properties
@property (nonatomic, assign) CGBlendMode blendMode;
@property (nonatomic, strong) UIImage*    image;
@property (nonatomic, strong) UIColor*    fillColor;
@property (nonatomic, readonly) CGSize    size;
@property (nonatomic, assign) CGFloat     alpha;
@property (nonatomic, assign) BOOL        preserveTransparency;

- (void)drawInRect: (CGRect)bounds;
@end
