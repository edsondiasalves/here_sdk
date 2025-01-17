// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Abstract class for handling tap gestures.
///
/// Tap gesture occurs after tapping on the screen.
abstract class TapListener {
  TapListener() {}

  factory TapListener.fromLambdas({
    @required void Function(Point2D) lambda_onTap
  }) => TapListener$Lambdas(
    lambda_onTap
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the tap gesture occurs.
  /// [origin] Position of the touch point relative to the MapView inpixels.
  onTap(Point2D origin);
}


// TapListener "private" section, not exported.

final _sdk_gestures_TapListener_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_copy_handle'));
final _sdk_gestures_TapListener_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_release_handle'));
final _sdk_gestures_TapListener_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_TapListener_create_proxy'));
final _sdk_gestures_TapListener_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_gestures_TapListener_get_raw_pointer'));
final _sdk_gestures_TapListener_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_get_type_id'));


class TapListener$Lambdas implements TapListener {
  void Function(Point2D) lambda_onTap;

  TapListener$Lambdas(
    void Function(Point2D) lambda_onTap
  ) {
    this.lambda_onTap = lambda_onTap;

  }

  @override
  void release() {}

  @override
  onTap(Point2D origin) =>
    lambda_onTap(origin);
}

class TapListener$Impl implements TapListener {
  @protected
  Pointer<Void> handle;
  TapListener$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_gestures_TapListener_get_raw_pointer(handle));
    _sdk_gestures_TapListener_release_handle(handle);
    handle = null;
  }

  @override
  onTap(Point2D origin) {
    final _onTap_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_TapListener_onTap__Point2D'));
    final _origin_handle = sdk_core_Point2D_toFfi(origin);
    final _handle = this.handle;
    final __result_handle = _onTap_ffi(_handle, __lib.LibraryContext.isolateId, _origin_handle);
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _TapListener_onTap_static(int _token, Pointer<Void> origin) {

  try {
    (__lib.instanceCache[_token] as TapListener).onTap(sdk_core_Point2D_fromFfi(origin));
  } finally {
    sdk_core_Point2D_releaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdk_gestures_TapListener_toFfi(TapListener value) {
  if (value is TapListener$Impl) return _sdk_gestures_TapListener_copy_handle(value.handle);

  final result = _sdk_gestures_TapListener_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_TapListener_onTap_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_gestures_TapListener_get_raw_pointer(result)] = value;

  return result;
}

TapListener sdk_gestures_TapListener_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_gestures_TapListener_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is TapListener) return instance as TapListener;

  final _type_id_handle = _sdk_gestures_TapListener_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_gestures_TapListener_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : TapListener$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_gestures_TapListener_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_gestures_TapListener_release_handle(handle);

Pointer<Void> sdk_gestures_TapListener_toFfi_nullable(TapListener value) =>
  value != null ? sdk_gestures_TapListener_toFfi(value) : Pointer<Void>.fromAddress(0);

TapListener sdk_gestures_TapListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_gestures_TapListener_fromFfi(handle) : null;

void sdk_gestures_TapListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_TapListener_release_handle(handle);

// End of TapListener "private" section.

