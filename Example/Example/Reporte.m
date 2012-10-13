//
//  Reporte.m
//  Example
//
//  Created by Saul Gausin on 12/10/12.
//  Copyright (c) 2012 Jorge Izquierdo. All rights reserved.
//

#import "Reporte.h"

@implementation Reporte
@synthesize coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordenada title:(NSString *)titulo subtitle:(NSString *)subtitulo{
    self = [super init];
    if(self!=nil){
        coordinate = coordenada;
        title = titulo;
        subtitle = subtitulo;
    }
    return self;
}

@end
