//
//  AppDelegate.m
//  Example
//
//  Created by Jorge Izquierdo on 9/4/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import "AppDelegate.h"
#import "SHSidebarController.h"
#import "BlueVC.h"
#import "MySubViewController.h"
#import "MapaViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSMutableArray *vcs = [NSMutableArray array];

    MapaViewController *mapa =
    [[MapaViewController alloc] init];
    mapa.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:[UIImage imageNamed:@""] tag:0];
    MySubViewController *rep =
    [[MySubViewController alloc] initWithName:@"Enviar reporte"];
    rep.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Reporte" image:[UIImage imageNamed:@""] tag:0];
    
    NSMutableArray* list = [[NSMutableArray alloc] init];
    [list addObject:mapa];
    [list addObject:rep];
    
    UITabBarController *mapas = [[UITabBarController alloc] init];
    
    [mapas setViewControllers:list];
    
    UINavigationController *navMapas = [[UINavigationController alloc] initWithRootViewController:mapas];
    NSDictionary *viewMapas = [NSDictionary dictionaryWithObjectsAndKeys:navMapas, @"vc", [NSString stringWithFormat:@"Mapa"], @"title", nil];
    [vcs addObject:viewMapas];
    
    MySubViewController *perfil = [[MySubViewController alloc] initWithName:@"perfil"];
    UINavigationController *navPerfil = [[UINavigationController alloc] initWithRootViewController:perfil];
    NSDictionary *viewPerfil = [NSDictionary dictionaryWithObjectsAndKeys:navPerfil, @"vc", [NSString stringWithFormat:@"Perfil"], @"title", nil];
    //And we finally add it to the array
    [vcs addObject:viewPerfil];
    
    MySubViewController *estadisticas = [[MySubViewController alloc] initWithName:@"grafica"];
    UINavigationController *navEstadisticas = [[UINavigationController alloc] initWithRootViewController:estadisticas];
    NSDictionary *viewEstadisticas = [NSDictionary dictionaryWithObjectsAndKeys:navEstadisticas, @"vc", [NSString stringWithFormat:@"Estadísticas"], @"title", nil];
    [vcs addObject:viewEstadisticas];
    
    MySubViewController *cupones = [[MySubViewController alloc] initWithName:@"cupones"];
    UINavigationController *navCupones = [[UINavigationController alloc] initWithRootViewController:cupones];
    NSDictionary *viewCupones = [NSDictionary dictionaryWithObjectsAndKeys:navCupones, @"vc", [NSString stringWithFormat:@"Cúpones"], @"title", nil];
    [vcs addObject:viewCupones];
    
    MySubViewController *reportes = [[MySubViewController alloc] initWithName:@"rss"];
    UINavigationController *navReportes = [[UINavigationController alloc] initWithRootViewController:reportes];
    NSDictionary *viewReportes = [NSDictionary dictionaryWithObjectsAndKeys:navReportes, @"vc", [NSString stringWithFormat:@"Reportes"], @"title", nil];
    [vcs addObject:viewReportes];
    
    MySubViewController *configuration = [[MySubViewController alloc] initWithName:@"configuracion"];
    UINavigationController *navConfiguration = [[UINavigationController alloc] initWithRootViewController:configuration];
    NSDictionary *viewConfiguration = [NSDictionary dictionaryWithObjectsAndKeys:navConfiguration, @"vc", [NSString stringWithFormat:@"Configuración"], @"title", nil];
    [vcs addObject:viewConfiguration];
    
    
    BlueVC *info = [[BlueVC alloc] init];
    UINavigationController *navInfo = [[UINavigationController alloc] initWithRootViewController:info];
    NSDictionary *viewInfo = [NSDictionary dictionaryWithObjectsAndKeys:navInfo, @"vc", [NSString stringWithFormat:@"Información"], @"title", nil];
    [vcs addObject:viewInfo];
    //Create controller and set views
    SHSidebarController *sidebar = [[SHSidebarController alloc] initWithArrayOfVC:vcs];
    self.window.rootViewController = sidebar;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
