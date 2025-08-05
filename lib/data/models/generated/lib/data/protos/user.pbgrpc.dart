// This is a generated file - do not edit.
//
// Generated from lib/data/protos/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'user.pb.dart';

/// The user service definition.
@$pb.GrpcServiceName('user.UserAuthentication')
class UserAuthenticationClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserAuthenticationClient(super.channel, {super.options, super.interceptors});

  /// Register a new user
  $grpc.ResponseFuture<$0.RegisterResponse> register(
    $0.RegisterRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
  }

  /// Authenticate a user
  $grpc.ResponseFuture<$0.AuthenticateResponse> authenticate(
    $0.AuthenticateRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$authenticate, request, options: options);
  }

  /// Verify a token
  $grpc.ResponseFuture<$0.VerifyTokenResponse> verifyToken(
    $0.VerifyTokenRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifyToken, request, options: options);
  }

  // method descriptors

  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/user.UserAuthentication/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          $0.RegisterResponse.fromBuffer);
  static final _$authenticate =
      $grpc.ClientMethod<$0.AuthenticateRequest, $0.AuthenticateResponse>(
          '/user.UserAuthentication/Authenticate',
          ($0.AuthenticateRequest value) => value.writeToBuffer(),
          $0.AuthenticateResponse.fromBuffer);
  static final _$verifyToken =
      $grpc.ClientMethod<$0.VerifyTokenRequest, $0.VerifyTokenResponse>(
          '/user.UserAuthentication/VerifyToken',
          ($0.VerifyTokenRequest value) => value.writeToBuffer(),
          $0.VerifyTokenResponse.fromBuffer);
}

@$pb.GrpcServiceName('user.UserAuthentication')
abstract class UserAuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'user.UserAuthentication';

  UserAuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AuthenticateRequest, $0.AuthenticateResponse>(
            'Authenticate',
            authenticate_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AuthenticateRequest.fromBuffer(value),
            ($0.AuthenticateResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.VerifyTokenRequest, $0.VerifyTokenResponse>(
            'VerifyToken',
            verifyToken_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VerifyTokenRequest.fromBuffer(value),
            ($0.VerifyTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> register_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RegisterRequest> $request) async {
    return register($call, await $request);
  }

  $async.Future<$0.RegisterResponse> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);

  $async.Future<$0.AuthenticateResponse> authenticate_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AuthenticateRequest> $request) async {
    return authenticate($call, await $request);
  }

  $async.Future<$0.AuthenticateResponse> authenticate(
      $grpc.ServiceCall call, $0.AuthenticateRequest request);

  $async.Future<$0.VerifyTokenResponse> verifyToken_Pre($grpc.ServiceCall $call,
      $async.Future<$0.VerifyTokenRequest> $request) async {
    return verifyToken($call, await $request);
  }

  $async.Future<$0.VerifyTokenResponse> verifyToken(
      $grpc.ServiceCall call, $0.VerifyTokenRequest request);
}
