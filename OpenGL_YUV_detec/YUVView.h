//
//  YUVView.h
//  OpenGL_YUV_detec
//
//  Created by Ruiwen Feng on 2017/5/19.
//  Copyright © 2017年 Ruiwen Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUVView : UIView
- (void)setUp;
- (void)displayYUVI420Data:(void *)data width:(GLuint)width height:(GLuint)height;
@end
