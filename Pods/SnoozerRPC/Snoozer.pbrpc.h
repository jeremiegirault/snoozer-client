#import "Snoozer.pbobjc.h"

#import <ProtoRPC/ProtoService.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>



NS_ASSUME_NONNULL_BEGIN

@protocol SNZSnoozer <NSObject>

#pragma mark AuthToGoogleCalendar(Null) returns (AuthUrl)

- (void)authToGoogleCalendarWithRequest:(SNZNull *)request handler:(void(^)(SNZAuthUrl *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToAuthToGoogleCalendarWithRequest:(SNZNull *)request handler:(void(^)(SNZAuthUrl *_Nullable response, NSError *_Nullable error))handler;


#pragma mark ListEvents(Null) returns (Events)

- (void)listEventsWithRequest:(SNZNull *)request handler:(void(^)(SNZEvents *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToListEventsWithRequest:(SNZNull *)request handler:(void(^)(SNZEvents *_Nullable response, NSError *_Nullable error))handler;


#pragma mark SwipeEvent(SwipeRequest) returns (SwipeResponse)

- (void)swipeEventWithRequest:(SNZSwipeRequest *)request handler:(void(^)(SNZSwipeResponse *_Nullable response, NSError *_Nullable error))handler;

- (GRPCProtoCall *)RPCToSwipeEventWithRequest:(SNZSwipeRequest *)request handler:(void(^)(SNZSwipeResponse *_Nullable response, NSError *_Nullable error))handler;


@end

/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface SNZSnoozer : GRPCProtoService<SNZSnoozer>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host;
@end

NS_ASSUME_NONNULL_END
