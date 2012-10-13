//
//  MapaViewController.h
//  Example
//
//  Created by Saul Gausin on 12/10/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Reporte.h"

@interface MapaViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
    Reporte *myReport;
    MKMapView *mapa;
    CLLocationManager *userLocation;
    MKAnnotationView *pinView;
    NSString *direccion;
    UIImageView *imagen;
    UILabel *titulo;
    UILabel *subtitulo;

}

@end
