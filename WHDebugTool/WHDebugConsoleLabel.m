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
//case zh = 0
//case eu = 1
//case us = 2
//case au = 3
//case test   = 4
    // + 1
    NSString *connect = @"";
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
            connect = [self getText:value];
            self.longConnect = (int)value;
            break;
        default:
            break;
    }
    
    if (connect.length == 0){
        connect = [self getText:self.longConnect];
    }
    
    NSString *text = [NSString stringWithFormat:@"FPS:%d Memory:%.1fM CPU:%d%% Connect:%@", (int)round(self.fps), self.memory, (int)round(self.cpu), connect];
    
    self.text = text;
    
}

- (NSString *)getText:(int)value{
    NSString *connect = @"";
    if (value == 0) {
        connect = @"0";
    } else if (value == 1) {
        connect = @"zh";
    } else if (value == 2) {
        connect = @"eu";
    } else if (value == 3) {
        connect = @"us";
    } else if (value == 4) {
        connect = @"au";
    } else if (value == 5) {
        connect = @"test";
    } else if (value == 6) {
        connect = @"aws";
    }
    return connect;
}


@end
