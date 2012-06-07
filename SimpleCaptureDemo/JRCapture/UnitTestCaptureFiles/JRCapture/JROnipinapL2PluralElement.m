/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import "JROnipinapL2PluralElement.h"

@interface JROnipinapL2PluralElement ()
@property BOOL canBeUpdatedOrReplaced;
@end

@implementation JROnipinapL2PluralElement
{
    NSString *_string1;
    NSString *_string2;
    JROnipinapL3Object *_onipinapL3Object;
}
@dynamic string1;
@dynamic string2;
@dynamic onipinapL3Object;
@synthesize canBeUpdatedOrReplaced;

- (NSString *)string1
{
    return _string1;
}

- (void)setString1:(NSString *)newString1
{
    [self.dirtyPropertySet addObject:@"string1"];
    _string1 = [newString1 copy];
}

- (NSString *)string2
{
    return _string2;
}

- (void)setString2:(NSString *)newString2
{
    [self.dirtyPropertySet addObject:@"string2"];
    _string2 = [newString2 copy];
}

- (JROnipinapL3Object *)onipinapL3Object
{
    return _onipinapL3Object;
}

- (void)setOnipinapL3Object:(JROnipinapL3Object *)newOnipinapL3Object
{
    [self.dirtyPropertySet addObject:@"onipinapL3Object"];
    _onipinapL3Object = [newOnipinapL3Object copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath      = @"";
        self.canBeUpdatedOrReplaced = NO;
    }
    return self;
}

+ (id)onipinapL2Plural
{
    return [[[JROnipinapL2PluralElement alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{ // TODO: SHOULD PROBABLY NOT REQUIRE REQUIRED FIELDS
    JROnipinapL2PluralElement *onipinapL2PluralCopy =
                [[JROnipinapL2PluralElement allocWithZone:zone] init];

    onipinapL2PluralCopy.captureObjectPath = self.captureObjectPath;

    onipinapL2PluralCopy.string1 = self.string1;
    onipinapL2PluralCopy.string2 = self.string2;
    onipinapL2PluralCopy.onipinapL3Object = self.onipinapL3Object;
    // TODO: Necessary??
    onipinapL2PluralCopy.canBeUpdatedOrReplaced = self.canBeUpdatedOrReplaced;
    
    // TODO: Necessary??
    [onipinapL2PluralCopy.dirtyPropertySet setSet:self.dirtyPropertySet];
    [onipinapL2PluralCopy.dirtyArraySet setSet:self.dirtyArraySet];

    return onipinapL2PluralCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null])
             forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null])
             forKey:@"string2"];
    [dict setObject:(self.onipinapL3Object ? [self.onipinapL3Object toDictionary] : [NSNull null])
             forKey:@"onipinapL3Object"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

+ (id)onipinapL2PluralObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    if (!dictionary)
        return nil;

    JROnipinapL2PluralElement *onipinapL2Plural = [JROnipinapL2PluralElement onipinapL2Plural];

    onipinapL2Plural.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"onipinapL2Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];
// TODO: Is this safe to assume?
    onipinapL2Plural.canBeUpdatedOrReplaced = YES;

    onipinapL2Plural.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    onipinapL2Plural.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    onipinapL2Plural.onipinapL3Object =
        [dictionary objectForKey:@"onipinapL3Object"] != [NSNull null] ? 
        [JROnipinapL3Object onipinapL3ObjectObjectFromDictionary:[dictionary objectForKey:@"onipinapL3Object"] withPath:onipinapL2Plural.captureObjectPath] : nil;

    [onipinapL2Plural.dirtyPropertySet removeAllObjects];
    [onipinapL2Plural.dirtyArraySet removeAllObjects];
    
    return onipinapL2Plural;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];
    NSSet *dirtyArraySetCopy    = [[self.dirtyArraySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"onipinapL2Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    if ([dictionary objectForKey:@"string1"])
        self.string1 = [dictionary objectForKey:@"string1"] != [NSNull null] ? 
            [dictionary objectForKey:@"string1"] : nil;

    if ([dictionary objectForKey:@"string2"])
        self.string2 = [dictionary objectForKey:@"string2"] != [NSNull null] ? 
            [dictionary objectForKey:@"string2"] : nil;

    if ([dictionary objectForKey:@"onipinapL3Object"] == [NSNull null])
        self.onipinapL3Object = nil;
    else if ([dictionary objectForKey:@"onipinapL3Object"] && !self.onipinapL3Object)
        self.onipinapL3Object = [JROnipinapL3Object onipinapL3ObjectObjectFromDictionary:[dictionary objectForKey:@"onipinapL3Object"] withPath:self.captureObjectPath];
    else if ([dictionary objectForKey:@"onipinapL3Object"])
        [self.onipinapL3Object updateFromDictionary:[dictionary objectForKey:@"onipinapL3Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
    [self.dirtyArraySet setSet:dirtyArraySetCopy];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];
    NSSet *dirtyArraySetCopy    = [[self.dirtyArraySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"onipinapL2Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    if (![dictionary objectForKey:@"onipinapL3Object"] || [dictionary objectForKey:@"onipinapL3Object"] == [NSNull null])
        self.onipinapL3Object = nil;
    else if (!self.onipinapL3Object)
        self.onipinapL3Object = [JROnipinapL3Object onipinapL3ObjectObjectFromDictionary:[dictionary objectForKey:@"onipinapL3Object"] withPath:self.captureObjectPath];
    else
        [self.onipinapL3Object replaceFromDictionary:[dictionary objectForKey:@"onipinapL3Object"] withPath:self.captureObjectPath];

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
    [self.dirtyArraySet setSet:dirtyArraySetCopy];
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    if ([self.dirtyPropertySet containsObject:@"onipinapL3Object"] || [self.onipinapL3Object needsUpdate])
        [dict setObject:(self.onipinapL3Object ?
                              [self.onipinapL3Object toUpdateDictionary] :
                              [[JROnipinapL3Object onipinapL3Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
                 forKey:@"onipinapL3Object"];

    return dict;
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];
    [dict setObject:(self.onipinapL3Object ?
                          [self.onipinapL3Object toReplaceDictionary] :
                          [[JROnipinapL3Object onipinapL3Object] toUpdateDictionary]) /* Use the default constructor to create an empty object */
             forKey:@"onipinapL3Object"];

    return dict;
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    if([self.onipinapL3Object needsUpdate])
        return YES;

    return NO;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:@"NSString" forKey:@"string1"];
    [dict setObject:@"NSString" forKey:@"string2"];
    [dict setObject:@"JROnipinapL3Object" forKey:@"onipinapL3Object"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

- (void)dealloc
{
    [_string1 release];
    [_string2 release];
    [_onipinapL3Object release];

    [super dealloc];
}
@end
