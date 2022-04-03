// Autogenerated from Pigeon (v2.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

enum IRInstallationType {
  appStore,
  test,
  debug,
  unknown,
}

enum IRInstallationPlatform {
  appleAppStore,
  appleTestflight,
  googlePlay,
  amazonAppStore,
  huaweiAppGallery,
  oppoAppMarket,
  samsungAppShop,
  vivoAppStore,
  xiaomiAppStore,
  manually,
  unknown,
}

enum IRPlatform {
  ios,
  android,
}

class IRInstallationReferer {
  IRInstallationReferer({
    this.type,
    this.installationPlatform,
    this.platform,
    this.packageName,
  });

  IRInstallationType? type;
  IRInstallationPlatform? installationPlatform;
  IRPlatform? platform;
  String? packageName;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['type'] = type == null ? null : type!.index;
    pigeonMap['installationPlatform'] =
        installationPlatform == null ? null : installationPlatform!.index;
    pigeonMap['platform'] = platform == null ? null : platform!.index;
    pigeonMap['packageName'] = packageName;
    return pigeonMap;
  }

  static IRInstallationReferer decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return IRInstallationReferer(
      type: pigeonMap['type'] != null
          ? IRInstallationType.values[pigeonMap['type']! as int]
          : null,
      installationPlatform: pigeonMap['installationPlatform'] != null
          ? IRInstallationPlatform
              .values[pigeonMap['installationPlatform']! as int]
          : null,
      platform: pigeonMap['platform'] != null
          ? IRPlatform.values[pigeonMap['platform']! as int]
          : null,
      packageName: pigeonMap['packageName'] as String?,
    );
  }
}

class _InstallReferrerInternalAPICodec extends StandardMessageCodec {
  const _InstallReferrerInternalAPICodec();

  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is IRInstallationReferer) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return IRInstallationReferer.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class InstallReferrerInternalAPI {
  /// Constructor for [InstallReferrerInternalAPI].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  InstallReferrerInternalAPI({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _InstallReferrerInternalAPICodec();

  Future<IRInstallationReferer> detectReferrer() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.InstallReferrerInternalAPI.detectReferrer', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as IRInstallationReferer?)!;
    }
  }
}
