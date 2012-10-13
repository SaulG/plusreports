//
//  Reporte.h
//  Example
//
//  Created by Saul Gausin on 12/10/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>
@interface Reporte : NSObject<MKAnnotation>{
    NSString * title;
    NSString * subtitle;
    CLLocationCoordinate2D coordinate;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordenada title:(NSString*)titulo subtitle:(NSString*)subtitulo;
@end
