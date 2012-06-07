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


#import "JROnipinapL1PluralElement.h"

@interface NSArray (OnipinapL2PluralToFromDictionary)
- (NSArray*)arrayOfOnipinapL2PluralObjectsFromOnipinapL2PluralDictionariesWithPath:(NSString*)capturePath;
- (NSArray*)arrayOfOnipinapL2PluralDictionariesFromOnipinapL2PluralObjects;
- (NSArray*)arrayOfOnipinapL2PluralReplaceDictionariesFromOnipinapL2PluralObjects;
@end

@implementation NSArray (OnipinapL2PluralToFromDictionary)
- (NSArray*)arrayOfOnipinapL2PluralObjectsFromOnipinapL2PluralDictionariesWithPath:(NSString*)capturePath
{
    NSMutableArray *filteredOnipinapL2PluralArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredOnipinapL2PluralArray addObject:[JROnipinapL2PluralElement onipinapL2PluralObjectFromDictionary:(NSDictionary*)dictionary withPath:capturePath]];

    return filteredOnipinapL2PluralArray;
}

- (NSArray*)arrayOfOnipinapL2PluralDictionariesFromOnipinapL2PluralObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JROnipinapL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JROnipinapL2PluralElement*)object toDictionary]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfOnipinapL2PluralReplaceDictionariesFromOnipinapL2PluralObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JROnipinapL2PluralElement class]])
            [filteredDictionaryArray addObject:[(JROnipinapL2PluralElement*)object toReplaceDictionary]];

    return filteredDictionaryArray;
}
@end

@interface JROnipinapL1PluralElement ()
@property BOOL canBeUpdatedOrReplaced;
@end

@implementation JROnipinapL1PluralElement
{
    NSString *_string1;
    NSString *_string2;
    NSArray *_onipinapL2Plural;
}
@dynamic string1;
@dynamic string2;
@dynamic onipinapL2Plural;
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

- (NSArray *)onipinapL2Plural
{
    return _onipinapL2Plural;
}

- (void)setOnipinapL2Plural:(NSArray *)newOnipinapL2Plural
{
    [self.dirtyArraySet addObject:@"onipinapL2Plural"];
    _onipinapL2Plural = [newOnipinapL2Plural copy];
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

+ (id)onipinapL1Plural
{
    return [[[JROnipinapL1PluralElement alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{ // TODO: SHOULD PROBABLY NOT REQUIRE REQUIRED FIELDS
    JROnipinapL1PluralElement *onipinapL1PluralCopy =
                [[JROnipinapL1PluralElement allocWithZone:zone] init];

    onipinapL1PluralCopy.captureObjectPath = self.captureObjectPath;

    onipinapL1PluralCopy.string1 = self.string1;
    onipinapL1PluralCopy.string2 = self.string2;
    onipinapL1PluralCopy.onipinapL2Plural = self.onipinapL2Plural;
    // TODO: Necessary??
    onipinapL1PluralCopy.canBeUpdatedOrReplaced = self.canBeUpdatedOrReplaced;
    
    // TODO: Necessary??
    [onipinapL1PluralCopy.dirtyPropertySet setSet:self.dirtyPropertySet];
    [onipinapL1PluralCopy.dirtyArraySet setSet:self.dirtyArraySet];

    return onipinapL1PluralCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null])
             forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null])
             forKey:@"string2"];
    [dict setObject:(self.onipinapL2Plural ? [self.onipinapL2Plural arrayOfOnipinapL2PluralDictionariesFromOnipinapL2PluralObjects] : [NSNull null])
             forKey:@"onipinapL2Plural"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

+ (id)onipinapL1PluralObjectFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    if (!dictionary)
        return nil;

    JROnipinapL1PluralElement *onipinapL1Plural = [JROnipinapL1PluralElement onipinapL1Plural];

    onipinapL1Plural.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"onipinapL1Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];
// TODO: Is this safe to assume?
    onipinapL1Plural.canBeUpdatedOrReplaced = YES;

    onipinapL1Plural.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    onipinapL1Plural.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    onipinapL1Plural.onipinapL2Plural =
        [dictionary objectForKey:@"onipinapL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"onipinapL2Plural"] arrayOfOnipinapL2PluralObjectsFromOnipinapL2PluralDictionariesWithPath:onipinapL1Plural.captureObjectPath] : nil;

    [onipinapL1Plural.dirtyPropertySet removeAllObjects];
    [onipinapL1Plural.dirtyArraySet removeAllObjects];
    
    return onipinapL1Plural;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];
    NSSet *dirtyArraySetCopy    = [[self.dirtyArraySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"onipinapL1Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    if ([dictionary objectForKey:@"string1"])
        self.string1 = [dictionary objectForKey:@"string1"] != [NSNull null] ? 
            [dictionary objectForKey:@"string1"] : nil;

    if ([dictionary objectForKey:@"string2"])
        self.string2 = [dictionary objectForKey:@"string2"] != [NSNull null] ? 
            [dictionary objectForKey:@"string2"] : nil;

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
    [self.dirtyArraySet setSet:dirtyArraySetCopy];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];
    NSSet *dirtyArraySetCopy    = [[self.dirtyArraySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"onipinapL1Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    self.onipinapL2Plural =
        [dictionary objectForKey:@"onipinapL2Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"onipinapL2Plural"] arrayOfOnipinapL2PluralObjectsFromOnipinapL2PluralDictionariesWithPath:self.captureObjectPath] : nil;

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

    return dict;
}

- (NSDictionary *)toReplaceDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];
    [dict setObject:(self.onipinapL2Plural ? [self.onipinapL2Plural arrayOfOnipinapL2PluralReplaceDictionariesFromOnipinapL2PluralObjects] : [NSArray array]) forKey:@"onipinapL2Plural"];

    return dict;
}

- (void)replaceOnipinapL2PluralArrayOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    [self replaceArrayOnCapture:self.onipinapL2Plural named:@"onipinapL2Plural"
                    forDelegate:delegate withContext:context];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    return NO;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:@"NSString" forKey:@"string1"];
    [dict setObject:@"NSString" forKey:@"string2"];
    [dict setObject:@"NSArray" forKey:@"onipinapL2Plural"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

- (void)dealloc
{
    [_string1 release];
    [_string2 release];
    [_onipinapL2Plural release];

    [super dealloc];
}
@end
