//
//  HDViewController.m
//  blended-image-ios
//
//  Created by Jesse Curry on 4/23/14.
//  Copyright (c) 2014 Haneke Design. All rights reserved.
//

#import "HDViewController.h"

#import "HDBlendedImage.h"

@interface HDViewController ()
@property (nonatomic, weak) IBOutlet UIImageView* imageView;
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HDViewController
- (IBAction)selectImageAction: (id)sender
{
  NSArray* colors = @[[UIColor redColor],
                      [UIColor greenColor],
                      [UIColor blueColor],
                      [UIColor blackColor]];
  
  [self drawWithColor: [colors objectAtIndex: [sender tag]]];
}

- (void)drawWithColor: (UIColor*)color
{
  HDBlendedImage* blendedImage = [[HDBlendedImage alloc] init];
  
  // Fill layer
  [blendedImage addLayer: [HDBlendedImageLayer layerWithFillColor: color
                                                        blendMode: kCGBlendModeNormal]];
  
  // Highlights
  UIImage* highlightImage = [UIImage imageNamed: @"highlights"];
  HDBlendedImageLayer* highlights = [HDBlendedImageLayer layerWithImage: highlightImage
                                                              blendMode: kCGBlendModeScreen];
  highlights.alpha = 1.0;
  [blendedImage addLayer: highlights];
  
  // Shadows
  UIImage* shadowImage = [UIImage imageNamed: @"shadows"];
  HDBlendedImageLayer* shadows = [HDBlendedImageLayer layerWithImage: shadowImage
                                                           blendMode: kCGBlendModeMultiply];
  shadows.alpha = 1.0;
  [blendedImage addLayer: shadows];
  
  //
  self.imageView.image = blendedImage.image;
}

@end
