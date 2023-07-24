//
//  ACDTextTranslationBubbleView.h
//  AgoraChat-Demo
//
//  Created by li xiaoming on 2023/7/19.
//  Copyright © 2023 easemob. All rights reserved.
//

#import "EaseChatMessageBubbleView.h"

NS_ASSUME_NONNULL_BEGIN



@interface ACDTextTranslationBubbleView : EaseChatMessageBubbleView
@property (nonatomic,strong) UILabel* textLabel;
- (void)updateTextInfo;
@end

NS_ASSUME_NONNULL_END
