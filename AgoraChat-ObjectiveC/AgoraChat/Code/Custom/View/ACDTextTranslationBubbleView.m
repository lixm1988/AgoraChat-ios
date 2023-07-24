//
//  ACDTextTranslationBubbleView.m
//  AgoraChat-Demo
//
//  Created by li xiaoming on 2023/7/19.
//  Copyright © 2023 easemob. All rights reserved.
//

#import "ACDTextTranslationBubbleView.h"
#import "EaseMessageModel+Translation.h"
//#import "EaseEmojiHelper.h"

#define kHorizontalPadding 12
#define kVerticalPadding 8
#define KEMThreadBubbleWidth (EMScreenWidth*(3/5.0))
@interface ACDTextTranslationBubbleView ()
{
    EaseChatViewModel *_viewModel;
}
@end
@implementation ACDTextTranslationBubbleView

- (instancetype)initWithDirection:(AgoraChatMessageDirection)aDirection
                             type:(AgoraChatMessageType)aType
                        viewModel:(EaseChatViewModel *)viewModel
{
    self = [super initWithDirection:aDirection type:aType viewModel:viewModel];
    if (self) {
        _viewModel = viewModel;
        [self _setupSubviews];
    }
    
    return self;
}

#pragma mark - Subviews

- (void)_setupSubviews
{
    //[self setupBubbleBackgroundImage];
    [self addSubview:self.textLabel];

    if (self.direction == AgoraChatMessageDirectionSend) {
        self.textLabel.textColor = _viewModel.sentFontColor;
        
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(kVerticalPadding);
            make.bottom.equalTo(self).offset(-kVerticalPadding);
            make.left.equalTo(self).offset(kHorizontalPadding);
            make.right.equalTo(self).offset(-kHorizontalPadding);
        }];
    } else {
        self.textLabel.textColor = _viewModel.reveivedFontColor;
    }
}
//
//- (void)setupBubbleBackgroundImage
//{
//    if (self.unDrawCorner) {
//        return;
//    }
//    UIEdgeInsets edge = UIEdgeInsetsMake(_viewModel.bubbleBgEdgeInsets.top, _viewModel.bubbleBgEdgeInsets.left, _viewModel.bubbleBgEdgeInsets.bottom - 30, _viewModel.bubbleBgEdgeInsets.right);
//    if (self.direction == AgoraChatMessageDirectionSend) {
//        UIImage *image = [_viewModel.senderBubbleBgImage resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
//        [self setImage:image];
//    } else {
//        UIImage *image = [_viewModel.receiverBubbleBgImage resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
//        [self setImage:image];
//    }
//}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = _viewModel.textMessaegFont;
        _textLabel.numberOfLines = 0;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _textLabel;
}



#pragma mark - Setter

- (void)setModel:(EaseMessageModel *)model
{
    [super setModel:model];
    [self updateTextInfo];
}

- (void)updateTextInfo
{
    if (self.model.message.body.type == AgoraChatMessageTypeText) {
        AgoraChatTextMessageBody *body = (AgoraChatTextMessageBody *)self.model.message.body;
        if (self.model.showTranslation) {
            if (body.translations.count > 0) {
                // fetch first translation
                NSString* translation = [body.translations.allValues firstObject];
                self.textLabel.text = translation;
            }
        } else {
            self.textLabel.text = body.text;
        }
    }
}

@end
