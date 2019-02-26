//
//  GameScene.m
//  LLRBTreeSimulationn
//
//  Created by Simon Lam on 2/15/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import "GameScene.h"
#import "LLRBNode.h"
#import "LLRBTree.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    SKShapeNode *line;
    int nodesPerLevel;
    int level;
}

-(void)drawNodesOfLevel: (int) l FromRoot: (LLRBNode *) n AtX: (int)x AndY: (int) y withBranchX: (int)bX AndBranchY: (int) bY {
    
    if(!n){
        return;
    }
    
    if(l==0){
        NSString *item = [NSString stringWithFormat:@"%d",n.item];
        _label = [SKLabelNode labelNodeWithText:item];
        [_label setFontSize:50];
        [_label setPosition:CGPointMake(x,y)];
        [_label setFontColor:[NSColor blackColor]];
        [self addChild: _label];
        
        if(n.left){
            line = [SKShapeNode node];
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, NULL, x-bX, y-bY+50);
            CGPathAddLineToPoint(path, NULL, x-10, y-10);
            
            if(n.left.isRed){
                [line setStrokeColor:[NSColor redColor]];
            }else{
                [line setStrokeColor:[NSColor blackColor]];
            }
            
            line.path = path;
            [self addChild:line];
        }
        
        if(n.right){
            line = [SKShapeNode node];
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, NULL, x+bX, y-bY+50);
            CGPathAddLineToPoint(path, NULL, x+10, y-10);
            
            [line setStrokeColor:[NSColor blackColor]];
            
            line.path = path;
            [self addChild:line];
        }
    }
    
    [self drawNodesOfLevel:l-1 FromRoot:n.left AtX: x-bX AndY:y withBranchX: bX/2 AndBranchY: bY ];
    [self drawNodesOfLevel:l-1 FromRoot:n.right AtX: x+bX AndY:y withBranchX: bX/2 AndBranchY: bY ];
}


- (void)didMoveToView:(SKView *)view {
    // Setup your scene here]
    [self setBackgroundColor:[NSColor whiteColor]];
    nodesPerLevel = 1;
    level = 0;
    LLRBTree *myTree = [[LLRBTree alloc] init];
    NSString *source= @"72,91,37,60,3,14,86,18,13,40,91,65,58,73,22";
    [myTree loadTree:source];
    int treeHeight = [myTree visualHeight:myTree.root];
    int height = self.size.height;
    int levelSpace = (height-20)/treeHeight;
    
    //    int n = pow(2,treeHeight-1);
    //    int bx = width/n;
    int bx = 250;
    for(int i = 0; i<treeHeight; i++){
        [self drawNodesOfLevel:i FromRoot:myTree.root AtX: 0 AndY:300-levelSpace*i withBranchX: bx AndBranchY: levelSpace];
    }
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
