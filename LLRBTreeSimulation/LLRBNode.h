
//
//  LLRBNode.h
//  LinkedList
//
//  Created by Simon Lam on 10/9/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#ifndef LLRBNode_h
#define LLRBNode_h
@interface LLRBNode<ObjectType>: NSObject

@property int item;
@property LLRBNode *left;
@property LLRBNode *right;
@property bool isRed;

-(id) init;
-(id) initWithItem: (int) i;

@end
#endif /* LLRBNode_h */
