//
//  LCTiledView.m
//  transocks.work
//
//  Created by Da.Lan on 2019/7/22.
//  Copyright © 2019 Da.Lan. All rights reserved.
//

#import "LCTiledView.h"

@interface LCTiledView ()

@property (strong, nonatomic) UIImage *image;
@property (nonatomic, assign) CGFloat scale;

@end

@implementation LCTiledView
+ (Class)layerClass {
    return [CATiledLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.image = image;
        self.scale = UIScreen.mainScreen.bounds.size.width / CGImageGetWidth(image.CGImage);

        CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
    
        int lev = ceil(log2(1 / self.scale)) + 1;
        tiledLayer.levelsOfDetail = 1;
        tiledLayer.levelsOfDetailBias = lev;
        
        // 设置瓷块分区, size 设置越小,内存压力越小
        // 峰值不能超过100M,这里简单设置成 {100,100}, 实测基本上峰值最高在 90M 上下, 可根据实际需求进行参数调节
        tiledLayer.tileSize = CGSizeMake(100,100);
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    // 提前释放对象,避免无用内存堆积
    @autoreleasepool {
        CGRect imageCutRect = CGRectMake(rect.origin.x / self.scale,
                                         rect.origin.y / self.scale,
                                         rect.size.width  / self.scale,
                                         rect.size.height / self.scale);
        
        CGImageRef imageRef = CGImageCreateWithImageInRect(self.image.CGImage, imageCutRect);
        UIImage *tileImage = [UIImage imageWithCGImage:imageRef];
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIGraphicsPushContext(context);
        [tileImage drawInRect:rect];
        CGImageRelease(imageRef);
        UIGraphicsPopContext();
    }
    
}



@end
