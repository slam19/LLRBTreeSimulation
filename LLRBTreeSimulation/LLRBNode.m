//
//  LLRBNode.m
//  LinkedList
//
//  Created by Simon Lam on 10/9/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLRBNode.h"

@implementation LLRBNode
-(id) init{
    self = [super init];
    if (self){
        self.item = 1;
        self.left = nil;
        self.right = nil;
        self.isRed= true;
    }
    return self;
}

-(id) initWithItem: (int) i {
    self = [super init];
    if (self){
        self.item = i;
        self.left = nil;
        self.right = nil;
        self.isRed = true; //always red linked when created
    }
    return self;
}



@end
