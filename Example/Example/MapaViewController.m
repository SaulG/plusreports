//
//  MapaViewController.m
//  Example
//
//  Created by Saul Gausin on 12/10/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import "MapaViewController.h"
#import "Reporte.h"
#include <stdlib.h>
#include <Math.h>

@implementation MapaViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    mapa = [[MKMapView alloc]initWithFrame:self.view.bounds];
            mapa.delegate = self;
    NSArray *reportes = [NSArray arrayWithObjects: @"Vial", @"Emergencia", @"Público",@"Abuso de Autoridad",nil];
    double  X = 25.672474;
    double Y = -100.307922;
    double r = 0.1;
    srand(time(0));
    double x, y, gauss1, gauss2, coef, u1, u2;
    double PI = 3.14;
    NSString *reporte;
    NSMutableSet * anotaciones = [[NSMutableSet alloc] init];
    for (int i = 0; i<= 30;i++){
        u1 = rand() / (RAND_MAX * 1.0);
        u2 = rand() / (RAND_MAX * 1.0);
        coef = sqrt(-2 * log(u1));
        gauss1 = coef * cos(2 * PI * u2);
        gauss2 = coef * sin(2 * PI * u2);
        x = X + gauss1 * r;
        y = Y + gauss2 * r;
        CLLocationCoordinate2D location;
        location.latitude = x;
        location.longitude = y;
        NSLog(@"%f, %f ",location.latitude, location.longitude);
        reporte = [reportes objectAtIndex:rand() % reportes.count ];
        Reporte *newAnnotation = [[Reporte alloc] initWithCoordinate:location title:reporte subtitle:@"Choque"];
        NSLog(reporte);
        [anotaciones addObject:newAnnotation];
	}
    for (id anotacion in anotaciones){
        [mapa addAnnotation:anotacion];
    }
    MKCoordinateRegion region;
    region.span.latitudeDelta = 0.09;
    region.span.longitudeDelta = 0.09;
    region.center = CLLocationCoordinate2DMake(25.671478, -100.345206);
    [mapa setRegion:region animated:YES];
    mapa.showsUserLocation = YES;
    self.view = mapa;
    UIButton *info = [[UIButton alloc]init];
    info.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:info];
}

//Sobreescribimos el metodo para poder modificar elementos de la anotacion como la imagen.
- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id) annotation {
           NSLog(@"Cargando pines");
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    Reporte *an = (Reporte*)annotation;
    MKAnnotationView *aView = [[MKAnnotationView alloc] initWithAnnotation:an reuseIdentifier:@"pinView"];
    NSString *reporte = [an title];
    NSString *filename = @"PINES/";
    filename = [filename stringByAppendingString:reporte];
    filename = [filename stringByAppendingString:@".png"];
    NSLog(filename);
    aView.canShowCallout = YES;
    aView.enabled = YES;
    aView.centerOffset = CGPointMake(0, -20);
    aView.draggable = YES;
    aView.image = [UIImage imageNamed:filename];
    CGRect frame = aView.frame;
    frame.size.width = 47;
    frame.size.height = 55;
    aView.frame = frame;
    return aView;

}
@end
