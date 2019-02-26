//
//  LLRBTree.m
//  BinarySearchTree
//
//  Created by Simon Lam on 2/7/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLRBTree.h"
@implementation LLRBTree

-(id) init{
    self = [super init];
    if (self){
        self.root = nil;
    }
    return self;
}

-(void) loadTree:(NSString *)source{
    NSArray* myArray = [source componentsSeparatedByString:@","];
    int s = (int)[myArray count];
    for(int i = 0; i< s; i++){
        NSString *integer=myArray[i];
        int n = [integer intValue];
        [self insert: n];
    }
}

-(void) insert:(int)i{
    if(!self.root){
        LLRBNode *n = [[LLRBNode alloc] initWithItem:i];
        self.root = n;
        self.root.isRed = false;
    }else{
        self.root = [self insert: i at: self.root];
    }
}

-(LLRBNode *) insert:(int)i at:(LLRBNode *)n{
    if (!n){
        LLRBNode *new =[[LLRBNode alloc] initWithItem:i];
        return new;
    }
    
    if (i < n.item){
        n.left = [self insert:i at:n.left];
    } else if (i > n.item){
        n.right = [self insert:i at:n.right];
    }else{
        return n;
    }
    
    if(n.right.isRed){
        n = [self rotateLeft:n];
    }
    if(n.left.isRed && n.left.left.isRed){
        n = [self rotateRight:n];
    }
    if(n.left.isRed && n.right.isRed){
        [self colorSwitch:n];
    }
    
    return n; //return the root.
}

-(LLRBNode *) rotateLeft:(LLRBNode *)n{
    LLRBNode *temp = n.right;
    n.right = temp.left; //catch lower nodes
    temp.left = n;
    temp.isRed= n.isRed;
    temp.left.isRed = true;
    return temp;
}

-(LLRBNode *)rotateRight:(LLRBNode *)n{
    LLRBNode* temp = n.left;
    n.left = temp.right;
    temp.right = n;
    temp.isRed = n.isRed;
    temp.right.isRed = true;
    return temp;
}

-(void) colorSwitch:(LLRBNode *)n{
    n.left.isRed = !(n.left.isRed);
    n.right.isRed = !(n.right.isRed);
    n.isRed = !(n.isRed);
}

-(void) countLeavesHeights:(LLRBNode *)n WithHeight:(int) h{
    if(n && !n.left && !n.right){
        printf("Leaf with value %d at height %d.\n ", n.item, h);
    }else{
        if(n.left){
            if(n.left.isRed){
                [self countLeavesHeights:n.left WithHeight:h]; //red branches do not reach into a new level
            }else{
                [self countLeavesHeights:n.left WithHeight:h+1];
            }
        }
        if(n.right){
            [self countLeavesHeights:n.right WithHeight:h+1];
        }
    }
}

-(void) printInOrder:(LLRBNode *) n{
    if(n.left){
        [self printInOrder:n.left];
    }
    printf("%d, ", n.item);
    if(n.right){
        [self printInOrder:n.right];
    }
}

-(int) visualHeight: (LLRBNode *)n{
    if(!n){
        return 0;
    }
    int leftHeight =  1+ [self visualHeight:n.left];
    int rightHeight = 1+ [self visualHeight:n.right];
    if(leftHeight<rightHeight){
        return rightHeight;
    }else{
        return leftHeight;
    }
}


@end
