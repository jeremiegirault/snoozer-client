// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: helloworld.proto

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

NS_ASSUME_NONNULL_BEGIN

#pragma mark - HLWHelloworldRoot

/// Exposes the extension registry for this file.
///
/// The base class provides:
/// @code
///   + (GPBExtensionRegistry *)extensionRegistry;
/// @endcode
/// which is a @c GPBExtensionRegistry that includes all the extensions defined by
/// this file and all files that it depends on.
@interface HLWHelloworldRoot : GPBRootObject
@end

#pragma mark - HLWHelloRequest

typedef GPB_ENUM(HLWHelloRequest_FieldNumber) {
  HLWHelloRequest_FieldNumber_Name = 1,
};

/// The request message containing the user's name.
@interface HLWHelloRequest : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@end

#pragma mark - HLWHelloReply

typedef GPB_ENUM(HLWHelloReply_FieldNumber) {
  HLWHelloReply_FieldNumber_Message = 1,
};

/// The response message containing the greetings
@interface HLWHelloReply : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *message;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
