//
//  LCScrollView.h
//  transocks.work
//
//  Created by Da.Lan on 2019/7/22.
//  Copyright © 2019 Da.Lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCTiledView.h"

#define screenW UIScreen.mainScreen.bounds.size.width
#define screenH UIScreen.mainScreen.bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface LCScrollView : UIScrollView <UIScrollViewDelegate>
@property (strong, nonatomic) LCTiledView *tiledView;
@end

NS_ASSUME_NONNULL_END
