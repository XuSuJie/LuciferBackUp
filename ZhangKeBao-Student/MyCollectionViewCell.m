//
//  MyCollectionViewCell.m
//  test
//
//  Created by 徐溯杰 on 2018/4/26.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15.0;
        
        UIImageView  *imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        self.imageView = imageView;
        [self.contentView addSubview:imageView];
    }
    return self;
}
- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
