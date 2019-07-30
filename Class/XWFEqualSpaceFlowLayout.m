//
//  XWFEqualSpaceFlowLayout.m
//  housePlus
//
//  Created by xuwenfeng on 2018/1/15.
//Copyright © 2018年 Saniko. All rights reserved.
//

#import "XWFEqualSpaceFlowLayout.h"

@implementation XWFEqualSpaceFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    for (int i=1; i < attributes.count; i++) {
        UICollectionViewLayoutAttributes *curAttr = attributes[i]; // 当前cell的位置信息
        UICollectionViewLayoutAttributes *preAttr = attributes[i-1]; // 下一个cell 的位置信息
        // 下面这块代码是对于一行只有一个cell进行位置调整
        UICollectionViewLayoutAttributes *nextAttr = nil;//上一个cell 位置信息
        if (i+1 < attributes.count) {
            nextAttr = attributes[i+1];
        }
        if (nextAttr != nil){
            CGFloat preY = CGRectGetMaxY(preAttr.frame);
            CGFloat curY = CGRectGetMaxY(curAttr.frame);
            CGFloat nextY = CGRectGetMaxY(nextAttr.frame);
            //根据cell的Y轴位置来判断cell是否是单独一行
            if (curY > preY&&curY < nextY) {
                //这个判断方式也会对区头进行判断 如果是区头则X轴还是从0开始
                if ([curAttr.representedElementKind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
                    CGRect frame = curAttr.frame;
                    frame.origin.x = 0;
                    curAttr.frame = frame;
                } else {
                    //单独一行的cell的X轴从5开始
                    CGRect frame = curAttr.frame;
                    frame.origin.x = self.sectionInset.left;
                    curAttr.frame = frame;
                }
            }
        }
        //下面是对一行多个cell的间距进行调整
        CGFloat origin = CGRectGetMaxX(preAttr.frame);
        CGFloat targetX = origin + self.minimumInteritemSpacing;
        if (CGRectGetMinX(curAttr.frame) > targetX){
            //如果下一个cell换行了则不进行调整
            if (targetX + CGRectGetWidth(curAttr.frame) < self.collectionViewContentSize.width) {
                CGRect frame = curAttr.frame;
                frame.origin.x = targetX;
                curAttr.frame = frame;
            }

        }
        
        
    }
    
    return attributes;
}
@end
       
