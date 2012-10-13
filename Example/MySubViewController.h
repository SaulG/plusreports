//
//  MySubViewController.h
//  Example
//
//  Created by Saul Gausin on 12/10/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySubViewController : UIViewController{
    NSString *fileName;
}
-(id)initWithName:(NSString *)newName;
@end