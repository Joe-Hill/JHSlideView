//
//  JHColor.h
//  ProductReview
//
//  Created by Joe on 1/21/16.
//  Copyright © 2016 Joe. All rights reserved.
//

#ifndef JHColor_h
#define JHColor_h

//  RGB颜色
#define JHColor(r, g, b) [UIColor colorWithRed: (r)/255.0 green: (g)/255.0 blue: (b)/255.0 alpha: 1.0]

//  随机颜色
#define JH_RANDOM_COLOR JHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define JH_DEFAULT_COLOR JHColor(251, 103, 91)
#define JH_GRAY_COLOR JHColor(220, 220, 220)

#endif /* JHColor_h */
