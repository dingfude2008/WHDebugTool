//
//  WHDebugConsoleLabel.m
//  WHDebugTool
//
//  Created by wuhao on 2018/7/17.
//  Copyright © 2018年 wuhao. All rights reserved.
//  https://github.com/remember17/WHDebugTool

#import "WHDebugConsoleLabel.h"

@interface WHDebugConsoleLabel()

@property (nonatomic, assign) float memory;

@property (nonatomic, assign) float cpu;

@property (nonatomic, assign) float fps;

@property (nonatomic, assign) int longConnect;


@end

@implementation WHDebugConsoleLabel {
//    UIFont *_font;
    UIFont *_subFont;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) { [self setDefault]; }
    return self;
}

- (void)setDefault {
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    self.textColor = [UIColor colorWithWhite:1 alpha:0.7];
    self.numberOfLines = 0;
    self.font = [UIFont systemFontOfSize:12];
}

- (void)updateLabelWith:(DebugToolLabelType)labelType value:(float)value {
    switch (labelType) {
        case DebugToolLabelTypeFPS:
            self.fps = value;
            break;
        case DebugToolLabelTypeMemory:
            self.memory = value;
            break;
        case DebugToolLabelTypeCPU:
            self.cpu = value;
            break;
        case DebugToolLabelTypeLongConnect:
            self.longConnect = (int)value;
            break;
        default:
            break;
    }
    NSString *text = [NSString stringWithFormat:@"FPS:%d Memory:%.1fM CPU:%d%% Connect:%d", (int)round(self.fps), self.memory, (int)round(self.cpu), self.longConnect];
    self.text = text;
    
}

@end
