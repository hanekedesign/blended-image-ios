//
//  HDBlendedImageLayer.m
//  blended-image-ios
//
//  Created by Jesse Curry on 4/23/14.
//  Copyright (c) 2014 Haneke Design. All rights reserved.
//

#import "HDBlendedImageLayer.h"

@implementation HDBlendedImageLayer
+ (HDBlendedImageLayer*)layerWithImage: (UIImage*)image
                             blendMode: (CGBlendMode)blendMode
{
  HDBlendedImageLayer* layer = [[self alloc] init];
  if ( layer )
  {
    layer.image = image;
    layer.blendMode = blendMode;
  }
  
  return layer;
}

+ (HDBlendedImageLayer*)layerWithFillColor: (UIColor*)fillColor
                                 blendMode: (CGBlendMode)blendMode
{
  HDBlendedImageLayer* layer = [[self alloc] init];
  if ( layer )
  {
    layer.fillColor = fillColor;
    layer.blendMode = blendMode;
  }
  
  return layer;
}

#pragma mark -
- (id)init
{
  self = [super init];
  if ( self )
  {
    _blendMode = kCGBlendModeNormal;
    _alpha = 1.0;
    _preserveTransparency = YES;
  }
  
  return self;
}

#pragma mark - API
- (CGSize)size
{
  CGSize size = CGSizeMake(1, 1);
  if ( self.image )
  {
    CGSize imageSize = self.image.size;
    size.width = MAX(size.width, imageSize.width);
    size.height = MAX(size.height, imageSize.height);
  }
  
  return size;
}

- (void)drawInRect: (CGRect)bounds
{
  [self.fillColor setFill];
  UIRectFill(bounds);
  
  [self.image drawInRect: bounds
               blendMode: self.blendMode
                   alpha: self.alpha];
  
  if ( self.preserveTransparency
      && self.blendMode != kCGBlendModeDestinationIn )
  {
    [self.image drawInRect: bounds
                 blendMode: kCGBlendModeDestinationIn
                     alpha: self.alpha];
  }
}

@end
