// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: snoozer.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_GEN_VERSION != 30001
#error This file was generated by a different version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class SNZEvent;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - SNZSnoozerRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface SNZSnoozerRoot : GPBRootObject
@end

#pragma mark - SNZNull

@interface SNZNull : GPBMessage

@end

#pragma mark - SNZAuthUrl

typedef GPB_ENUM(SNZAuthUrl_FieldNumber) {
  SNZAuthUrl_FieldNumber_URL = 1,
};

@interface SNZAuthUrl : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *URL;

@end

#pragma mark - SNZEvent

typedef GPB_ENUM(SNZEvent_FieldNumber) {
  SNZEvent_FieldNumber_Id_p = 1,
  SNZEvent_FieldNumber_Name = 2,
  SNZEvent_FieldNumber_Start = 3,
  SNZEvent_FieldNumber_End = 4,
  SNZEvent_FieldNumber_AllDay = 5,
};

@interface SNZEvent : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite, copy, null_resettable) NSString *start;

@property(nonatomic, readwrite, copy, null_resettable) NSString *end;

@property(nonatomic, readwrite) BOOL allDay;

@end

#pragma mark - SNZEvents

typedef GPB_ENUM(SNZEvents_FieldNumber) {
  SNZEvents_FieldNumber_EventsArray = 1,
};

@interface SNZEvents : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<SNZEvent*> *eventsArray;
/// The number of items in @c eventsArray without causing the array to be created.
@property(nonatomic, readonly) NSUInteger eventsArray_Count;

@end

#pragma mark - SNZSwipeRequest

typedef GPB_ENUM(SNZSwipeRequest_FieldNumber) {
  SNZSwipeRequest_FieldNumber_EventId = 1,
};

@interface SNZSwipeRequest : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *eventId;

@end

#pragma mark - SNZSwipeResponse

typedef GPB_ENUM(SNZSwipeResponse_FieldNumber) {
  SNZSwipeResponse_FieldNumber_Event = 1,
};

@interface SNZSwipeResponse : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) SNZEvent *event;
/// Test to see if @c event has been set.
@property(nonatomic, readwrite) BOOL hasEvent;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
