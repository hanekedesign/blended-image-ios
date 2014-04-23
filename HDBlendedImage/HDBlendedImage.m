//
//  HDBlendedImage.m
//  blended-image-ios
//
//  Created by Jesse Curry on 4/23/14.
//  Copyright (c) 2014 Haneke Design. All rights reserved.
//

#import "HDBlendedImage.h"

@interface HDBlendedImage ()
@property (nonatomic, readonly) NSMutableArray* imageLayers;
@property (nonatomic, assign) CGRect imageBounds;
- (void)buildImage;
- (void)invalidateImage;
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HDBlendedImage
@synthesize image = _image;

- (id)init
{
  self = [super init];
  if ( self )
  {
    _imageLayers = [NSMutableArray array];
  }
  
  return self;
}

#pragma mark - API
- (void)addLayer: (HDBlendedImageLayer*)layer
{
  [self.imageLayers addObject: layer];
  [self invalidateImage];
}

- (void)removeLayer: (HDBlendedImageLayer*)layer
{
  [self.imageLayers removeObject: layer];
  [self invalidateImage];
}

- (UIImage*)image
{
  if ( _image == nil )
  {
    [self buildImage];
  }
  
  return _image;
}

#pragma mark - Private
- (void)buildImage
{
  [self calculateImageBounds];
  
  UIGraphicsBeginImageContextWithOptions(self.imageBounds.size, NO, 0.0f);
  
  for ( HDBlendedImageLayer* layer in self.imageLayers )
  {
    [layer drawInRect: self.imageBounds];
  }
  
  _image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
}

- (void)invalidateImage
{
  _image = nil;
}

- (void)calculateImageBounds
{
  CGSize imageSize = CGSizeMake(1, 1);
  for ( HDBlendedImageLayer* layer in self.imageLayers )
  {
    CGSize s = layer.size;
    imageSize.width = MAX(imageSize.width, s.width);
    imageSize.height = MAX(imageSize.height, s.height);
  }
  
  self.imageBounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
}

@end
