
//
//  LLRBTree.h
//  BinarySearchTree
//
//  Created by Simon Lam on 2/7/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef LLRBTree_h
#define LLRBTree_h
#import "LLRBNode.h"
@interface LLRBTree: NSObject
@property LLRBNode *root;

-(id) init;
-(void) loadTree: (NSString *) source;
-(void) insert: (int) i;
-(LLRBNode *) insert:(int) i at: (LLRBNode *)n;
-(LLRBNode *) rotateLeft: (LLRBNode *)n;
-(LLRBNode *) rotateRight: (LLRBNode *)n;
-(void) colorSwitch: (LLRBNode *) n;
-(void) countLeavesHeights: (LLRBNode *)n WithHeight: (int) h; //this method is for verifying the height of leaves in the LLRBTree
-(void) printInOrder: (LLRBNode *)n;
-(int) visualHeight: (LLRBNode *)n; //this height method is used for drawing the visual tree, not representative of the LLRB implementation (thus a red branch increases height by 1)

@end
#endif /* LLRBTree_h */
