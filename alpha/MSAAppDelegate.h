//
//  MSAAppDelegate.h
//  alpha
//
//  Created by Michael Garrido on 4/24/13.
//  Copyright (c) 2013 Michael Garrido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSGestaltViewController.h"

@interface MSAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
