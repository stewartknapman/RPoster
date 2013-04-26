//
//  main.m
//  RPoster
//
//  Created by Stewart Knapman on 27/04/13.
//  Copyright (c) 2013 Stewart Knapman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
