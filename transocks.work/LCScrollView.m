//
//  LCScrollView.m
//  transocks.work
//
//  Created by Da.Lan on 2019/7/22.
//  Copyright © 2019 Da.Lan. All rights reserved.
//

#import "LCScrollView.h"

@implementation LCScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.delegate = self;
        self.bouncesZoom = NO;
        self.backgroundColor = [UIColor colorWithRed:0.24 green:0.89 blue:0.69 alpha:1.0];

#warning You may need to change the Image path
        UIImage *image = [UIImage imageWithContentsOfFile:@"/Users/Da.Lan/Downloads/zz.jpg"];

        if (image == nil) {
            NSLog(@"===== 没有找到图片 =====" );
            return self;
        }

        // 图片按缩放比例
        CGFloat scale = screenW / CGImageGetWidth(image.CGImage);
        
        int level = ceil(log2(1 / scale)) + 1;
        CGFloat maxZoom = pow(2, level);
        
        self.maximumZoomScale = maxZoom;
        self.minimumZoomScale = 1.0;

        CGRect imageViewFrame = CGRectMake( 0, 0, screenW, CGImageGetHeight(image.CGImage) * scale);
        
        // 创建瓷片图片
        self.tiledView = [[LCTiledView alloc] initWithFrame:imageViewFrame image:image];
        
        [self addSubview:self.tiledView];
    }
    
    return self;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    // 瓷块图片作为缩放响应
    return self.tiledView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.contentSize.height > [UIScreen mainScreen].bounds.size.height) {
        self.tiledView.center = CGPointMake(self.contentSize.width/2, self.contentSize.height/2);
    }else{
        CGFloat centerY = screenH - self.tiledView.frame.size.height;
        self.tiledView.frame = CGRectMake(0, centerY/2, self.tiledView.frame.size.width,self.tiledView.frame.size.height);
    }

}

@end
