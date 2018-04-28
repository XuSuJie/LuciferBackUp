//
//  MyCollectionViewCell.h
//  test
//
//  Created by 徐溯杰 on 2018/4/26.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, weak) UIImageView *imageView; /**< <#注释#> */
@end
