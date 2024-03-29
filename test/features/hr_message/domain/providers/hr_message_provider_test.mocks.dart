// Mocks generated by Mockito 5.2.0 from annotations
// in erp_employee_app/test/features/hr_message/domain/providers/hr_message_provider_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:erp_employee_app/core/data/api/api.dart' as _i3;
import 'package:erp_employee_app/core/data/api/api_request.dart' as _i11;
import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart'
    as _i10;
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart'
    as _i4;
import 'package:erp_employee_app/core/domain/repositories/repository_with_socket.dart'
    as _i7;
import 'package:erp_employee_app/features/notifications/data/models/hr_message.dart'
    as _i8;
import 'package:erp_employee_app/features/notifications/domain/repository/hr_message_repository.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:socket_io_client/socket_io_client.dart' as _i2;
import 'package:socket_io_client/src/manager.dart' as _i5;
import 'package:socket_io_common/src/util/event_emitter.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeSocket_0 extends _i1.Fake implements _i2.Socket {}

class _FakeApi_1<T> extends _i1.Fake implements _i3.Api<T> {}

class _FakePaginatedResponse_2<Model> extends _i1.Fake
    implements _i4.PaginatedResponse<Model> {}

class _FakeManager_3 extends _i1.Fake implements _i5.Manager {}

/// A class which mocks [HrMessageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHrMessageRepository extends _i1.Mock
    implements _i6.HrMessageRepository {
  MockHrMessageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Socket get socket => (super.noSuchMethod(Invocation.getter(#socket),
      returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  _i3.Api<dynamic> get api => (super.noSuchMethod(Invocation.getter(#api),
      returnValue: _FakeApi_1<dynamic>()) as _i3.Api<dynamic>);
  @override
  void onMessageReceived(_i7.AddToListState<_i8.HrMessage>? addToListState) =>
      super.noSuchMethod(
          Invocation.method(#onMessageReceived, [addToListState]),
          returnValueForMissingStub: null);
  @override
  _i9.Future<_i4.PaginatedResponse<_i8.HrMessage>> findAll(
          _i10.PaginationFilter? paginationFields,
          _i11.FromJson<_i8.HrMessage>? fromJson) =>
      (super.noSuchMethod(
              Invocation.method(#findAll, [paginationFields, fromJson]),
              returnValue: Future<_i4.PaginatedResponse<_i8.HrMessage>>.value(
                  _FakePaginatedResponse_2<_i8.HrMessage>()))
          as _i9.Future<_i4.PaginatedResponse<_i8.HrMessage>>);
}

/// A class which mocks [Socket].
///
/// See the documentation for Mockito's code generation for more information.
class MockSocket extends _i1.Mock implements _i2.Socket {
  MockSocket() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get nsp =>
      (super.noSuchMethod(Invocation.getter(#nsp), returnValue: '') as String);
  @override
  set nsp(String? _nsp) => super.noSuchMethod(Invocation.setter(#nsp, _nsp),
      returnValueForMissingStub: null);
  @override
  set opts(Map<dynamic, dynamic>? _opts) =>
      super.noSuchMethod(Invocation.setter(#opts, _opts),
          returnValueForMissingStub: null);
  @override
  _i5.Manager get io =>
      (super.noSuchMethod(Invocation.getter(#io), returnValue: _FakeManager_3())
          as _i5.Manager);
  @override
  set io(_i5.Manager? _io) => super.noSuchMethod(Invocation.setter(#io, _io),
      returnValueForMissingStub: null);
  @override
  _i2.Socket get json => (super.noSuchMethod(Invocation.getter(#json),
      returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  set json(_i2.Socket? _json) =>
      super.noSuchMethod(Invocation.setter(#json, _json),
          returnValueForMissingStub: null);
  @override
  num get ids =>
      (super.noSuchMethod(Invocation.getter(#ids), returnValue: 0) as num);
  @override
  set ids(num? _ids) => super.noSuchMethod(Invocation.setter(#ids, _ids),
      returnValueForMissingStub: null);
  @override
  Map<dynamic, dynamic> get acks =>
      (super.noSuchMethod(Invocation.getter(#acks),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  set acks(Map<dynamic, dynamic>? _acks) =>
      super.noSuchMethod(Invocation.setter(#acks, _acks),
          returnValueForMissingStub: null);
  @override
  bool get connected =>
      (super.noSuchMethod(Invocation.getter(#connected), returnValue: false)
          as bool);
  @override
  set connected(bool? _connected) =>
      super.noSuchMethod(Invocation.setter(#connected, _connected),
          returnValueForMissingStub: null);
  @override
  bool get disconnected =>
      (super.noSuchMethod(Invocation.getter(#disconnected), returnValue: false)
          as bool);
  @override
  set disconnected(bool? _disconnected) =>
      super.noSuchMethod(Invocation.setter(#disconnected, _disconnected),
          returnValueForMissingStub: null);
  @override
  List<dynamic> get sendBuffer =>
      (super.noSuchMethod(Invocation.getter(#sendBuffer),
          returnValue: <dynamic>[]) as List<dynamic>);
  @override
  set sendBuffer(List<dynamic>? _sendBuffer) =>
      super.noSuchMethod(Invocation.setter(#sendBuffer, _sendBuffer),
          returnValueForMissingStub: null);
  @override
  List<dynamic> get receiveBuffer =>
      (super.noSuchMethod(Invocation.getter(#receiveBuffer),
          returnValue: <dynamic>[]) as List<dynamic>);
  @override
  set receiveBuffer(List<dynamic>? _receiveBuffer) =>
      super.noSuchMethod(Invocation.setter(#receiveBuffer, _receiveBuffer),
          returnValueForMissingStub: null);
  @override
  set query(String? _query) =>
      super.noSuchMethod(Invocation.setter(#query, _query),
          returnValueForMissingStub: null);
  @override
  set subs(List<dynamic>? _subs) =>
      super.noSuchMethod(Invocation.setter(#subs, _subs),
          returnValueForMissingStub: null);
  @override
  set flags(Map<dynamic, dynamic>? _flags) =>
      super.noSuchMethod(Invocation.setter(#flags, _flags),
          returnValueForMissingStub: null);
  @override
  set id(String? _id) => super.noSuchMethod(Invocation.setter(#id, _id),
      returnValueForMissingStub: null);
  @override
  void subEvents() => super.noSuchMethod(Invocation.method(#subEvents, []),
      returnValueForMissingStub: null);
  @override
  _i2.Socket open() => (super.noSuchMethod(Invocation.method(#open, []),
      returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  _i2.Socket connect() => (super.noSuchMethod(Invocation.method(#connect, []),
      returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  _i2.Socket send(List<dynamic>? args) =>
      (super.noSuchMethod(Invocation.method(#send, [args]),
          returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  void emit(String? event, [dynamic data]) =>
      super.noSuchMethod(Invocation.method(#emit, [event, data]),
          returnValueForMissingStub: null);
  @override
  void emitWithBinary(String? event, [dynamic data]) =>
      super.noSuchMethod(Invocation.method(#emitWithBinary, [event, data]),
          returnValueForMissingStub: null);
  @override
  void emitWithAck(String? event, dynamic data,
          {Function? ack, bool? binary = false}) =>
      super.noSuchMethod(
          Invocation.method(
              #emitWithAck, [event, data], {#ack: ack, #binary: binary}),
          returnValueForMissingStub: null);
  @override
  void packet(Map<dynamic, dynamic>? packet) =>
      super.noSuchMethod(Invocation.method(#packet, [packet]),
          returnValueForMissingStub: null);
  @override
  void onopen([dynamic _]) =>
      super.noSuchMethod(Invocation.method(#onopen, [_]),
          returnValueForMissingStub: null);
  @override
  void onclose(dynamic reason) =>
      super.noSuchMethod(Invocation.method(#onclose, [reason]),
          returnValueForMissingStub: null);
  @override
  void onpacket(dynamic packet) =>
      super.noSuchMethod(Invocation.method(#onpacket, [packet]),
          returnValueForMissingStub: null);
  @override
  void onevent(Map<dynamic, dynamic>? packet) =>
      super.noSuchMethod(Invocation.method(#onevent, [packet]),
          returnValueForMissingStub: null);
  @override
  Function ack(dynamic id) =>
      (super.noSuchMethod(Invocation.method(#ack, [id]), returnValue: () {})
          as Function);
  @override
  void onack(Map<dynamic, dynamic>? packet) =>
      super.noSuchMethod(Invocation.method(#onack, [packet]),
          returnValueForMissingStub: null);
  @override
  void onconnect() => super.noSuchMethod(Invocation.method(#onconnect, []),
      returnValueForMissingStub: null);
  @override
  void emitBuffered() =>
      super.noSuchMethod(Invocation.method(#emitBuffered, []),
          returnValueForMissingStub: null);
  @override
  void ondisconnect() =>
      super.noSuchMethod(Invocation.method(#ondisconnect, []),
          returnValueForMissingStub: null);
  @override
  void destroy() => super.noSuchMethod(Invocation.method(#destroy, []),
      returnValueForMissingStub: null);
  @override
  _i2.Socket close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  _i2.Socket disconnect() =>
      (super.noSuchMethod(Invocation.method(#disconnect, []),
          returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  _i2.Socket compress(dynamic compress) =>
      (super.noSuchMethod(Invocation.method(#compress, [compress]),
          returnValue: _FakeSocket_0()) as _i2.Socket);
  @override
  void on(String? event, _i12.EventHandler<dynamic>? handler) =>
      super.noSuchMethod(Invocation.method(#on, [event, handler]),
          returnValueForMissingStub: null);
  @override
  void once(String? event, _i12.EventHandler<dynamic>? handler) =>
      super.noSuchMethod(Invocation.method(#once, [event, handler]),
          returnValueForMissingStub: null);
  @override
  void off(String? event, [_i12.EventHandler<dynamic>? handler]) =>
      super.noSuchMethod(Invocation.method(#off, [event, handler]),
          returnValueForMissingStub: null);
  @override
  void clearListeners() =>
      super.noSuchMethod(Invocation.method(#clearListeners, []),
          returnValueForMissingStub: null);
  @override
  bool hasListeners(String? event) =>
      (super.noSuchMethod(Invocation.method(#hasListeners, [event]),
          returnValue: false) as bool);
}
