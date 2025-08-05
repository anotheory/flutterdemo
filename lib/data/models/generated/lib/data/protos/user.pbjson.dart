// This is a generated file - do not edit.
//
// Generated from lib/data/protos/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'firstName', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgAS'
    'gJUghwYXNzd29yZBIcCglmaXJzdE5hbWUYAyABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgE'
    'IAEoCVIIbGFzdE5hbWU=');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZRIUCgV0b2tlbhgDIAEoCVIFdG9rZW4=');

@$core.Deprecated('Use authenticateRequestDescriptor instead')
const AuthenticateRequest$json = {
  '1': 'AuthenticateRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AuthenticateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateRequestDescriptor = $convert.base64Decode(
    'ChNBdXRoZW50aWNhdGVSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwYXNzd29yZB'
    'gCIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use authenticateResponseDescriptor instead')
const AuthenticateResponse$json = {
  '1': 'AuthenticateResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `AuthenticateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateResponseDescriptor = $convert.base64Decode(
    'ChRBdXRoZW50aWNhdGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2USFAoFdG9rZW4YAyABKAlSBXRva2Vu');

@$core.Deprecated('Use verifyTokenRequestDescriptor instead')
const VerifyTokenRequest$json = {
  '1': 'VerifyTokenRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `VerifyTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyTokenRequestDescriptor = $convert
    .base64Decode('ChJWZXJpZnlUb2tlblJlcXVlc3QSFAoFdG9rZW4YASABKAlSBXRva2Vu');

@$core.Deprecated('Use verifyTokenResponseDescriptor instead')
const VerifyTokenResponse$json = {
  '1': 'VerifyTokenResponse',
  '2': [
    {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `VerifyTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyTokenResponseDescriptor = $convert.base64Decode(
    'ChNWZXJpZnlUb2tlblJlc3BvbnNlEhQKBXZhbGlkGAEgASgIUgV2YWxpZBIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdlEh4KBHVzZXIYAyABKAsyCi51c2VyLlVzZXJSBHVzZXI=');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'firstName', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'lastName', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSHAoJZmlyc3ROYW'
    '1lGAMgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUYBCABKAlSCGxhc3ROYW1l');
