//
//  QNThemeColor.h
//  Helloworld
//
//  Created by zhiyunyu on 2020/3/5.
//  Copyright © 2020 zhiyunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QNColorItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^QNGetColorBlock)(UIColor *themeColor, NSArray<QNColorItem *> *colorArray);

@interface QNThemeColorExtracter : NSObject

- (void)extractColorsFromImage:(UIImage *)image
                    colorBlock:(QNGetColorBlock)colorBlock;

@end

NS_ASSUME_NONNULL_END