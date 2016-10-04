#import "Snoozer.pbrpc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

@implementation SNZSnoozer

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:@"snoozer" serviceName:@"Snoozer"]);
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}


#pragma mark AuthToGoogleCalendar(Null) returns (AuthUrl)

- (void)authToGoogleCalendarWithRequest:(SNZNull *)request handler:(void(^)(SNZAuthUrl *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToAuthToGoogleCalendarWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToAuthToGoogleCalendarWithRequest:(SNZNull *)request handler:(void(^)(SNZAuthUrl *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"AuthToGoogleCalendar"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SNZAuthUrl class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
#pragma mark ListEvents(Null) returns (Events)

- (void)listEventsWithRequest:(SNZNull *)request handler:(void(^)(SNZEvents *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToListEventsWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToListEventsWithRequest:(SNZNull *)request handler:(void(^)(SNZEvents *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"ListEvents"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SNZEvents class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
#pragma mark SwipeEvent(SwipeRequest) returns (SwipeResponse)

- (void)swipeEventWithRequest:(SNZSwipeRequest *)request handler:(void(^)(SNZSwipeResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToSwipeEventWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (GRPCProtoCall *)RPCToSwipeEventWithRequest:(SNZSwipeRequest *)request handler:(void(^)(SNZSwipeResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"SwipeEvent"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[SNZSwipeResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
@end
