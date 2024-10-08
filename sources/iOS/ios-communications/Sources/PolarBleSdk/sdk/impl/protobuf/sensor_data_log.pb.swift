// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: sensor_data_log.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// SDLOGS.BPB=PbSensorDataLog

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Data_PbSensorDataLog {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var logTrigger: Data_PbSensorDataLog.PbLogTrigger {
    get {return _storage._logTrigger ?? .logTriggerSystem}
    set {_uniqueStorage()._logTrigger = newValue}
  }
  /// Returns true if `logTrigger` has been explicitly set.
  var hasLogTrigger: Bool {return _storage._logTrigger != nil}
  /// Clears the value of `logTrigger`. Subsequent reads from it will return its default value.
  mutating func clearLogTrigger() {_uniqueStorage()._logTrigger = nil}

  var accelerationLogEnabled: Bool {
    get {return _storage._accelerationLogEnabled ?? false}
    set {_uniqueStorage()._accelerationLogEnabled = newValue}
  }
  /// Returns true if `accelerationLogEnabled` has been explicitly set.
  var hasAccelerationLogEnabled: Bool {return _storage._accelerationLogEnabled != nil}
  /// Clears the value of `accelerationLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearAccelerationLogEnabled() {_uniqueStorage()._accelerationLogEnabled = nil}

  var caloriesLogEnabled: Bool {
    get {return _storage._caloriesLogEnabled ?? false}
    set {_uniqueStorage()._caloriesLogEnabled = newValue}
  }
  /// Returns true if `caloriesLogEnabled` has been explicitly set.
  var hasCaloriesLogEnabled: Bool {return _storage._caloriesLogEnabled != nil}
  /// Clears the value of `caloriesLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearCaloriesLogEnabled() {_uniqueStorage()._caloriesLogEnabled = nil}

  var gpsLogEnabled: Bool {
    get {return _storage._gpsLogEnabled ?? false}
    set {_uniqueStorage()._gpsLogEnabled = newValue}
  }
  /// Returns true if `gpsLogEnabled` has been explicitly set.
  var hasGpsLogEnabled: Bool {return _storage._gpsLogEnabled != nil}
  /// Clears the value of `gpsLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearGpsLogEnabled() {_uniqueStorage()._gpsLogEnabled = nil}

  var gpsNmeaLogEnabled: Bool {
    get {return _storage._gpsNmeaLogEnabled ?? false}
    set {_uniqueStorage()._gpsNmeaLogEnabled = newValue}
  }
  /// Returns true if `gpsNmeaLogEnabled` has been explicitly set.
  var hasGpsNmeaLogEnabled: Bool {return _storage._gpsNmeaLogEnabled != nil}
  /// Clears the value of `gpsNmeaLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearGpsNmeaLogEnabled() {_uniqueStorage()._gpsNmeaLogEnabled = nil}

  var ohrLogEnabled: Bool {
    get {return _storage._ohrLogEnabled ?? false}
    set {_uniqueStorage()._ohrLogEnabled = newValue}
  }
  /// Returns true if `ohrLogEnabled` has been explicitly set.
  var hasOhrLogEnabled: Bool {return _storage._ohrLogEnabled != nil}
  /// Clears the value of `ohrLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearOhrLogEnabled() {_uniqueStorage()._ohrLogEnabled = nil}

  var magnetometerLogEnabled: Bool {
    get {return _storage._magnetometerLogEnabled ?? false}
    set {_uniqueStorage()._magnetometerLogEnabled = newValue}
  }
  /// Returns true if `magnetometerLogEnabled` has been explicitly set.
  var hasMagnetometerLogEnabled: Bool {return _storage._magnetometerLogEnabled != nil}
  /// Clears the value of `magnetometerLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearMagnetometerLogEnabled() {_uniqueStorage()._magnetometerLogEnabled = nil}

  var tapLogEnabled: Bool {
    get {return _storage._tapLogEnabled ?? false}
    set {_uniqueStorage()._tapLogEnabled = newValue}
  }
  /// Returns true if `tapLogEnabled` has been explicitly set.
  var hasTapLogEnabled: Bool {return _storage._tapLogEnabled != nil}
  /// Clears the value of `tapLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearTapLogEnabled() {_uniqueStorage()._tapLogEnabled = nil}

  var barometerLogEnabled: Bool {
    get {return _storage._barometerLogEnabled ?? false}
    set {_uniqueStorage()._barometerLogEnabled = newValue}
  }
  /// Returns true if `barometerLogEnabled` has been explicitly set.
  var hasBarometerLogEnabled: Bool {return _storage._barometerLogEnabled != nil}
  /// Clears the value of `barometerLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearBarometerLogEnabled() {_uniqueStorage()._barometerLogEnabled = nil}

  var gyroscopeLogEnabled: Bool {
    get {return _storage._gyroscopeLogEnabled ?? false}
    set {_uniqueStorage()._gyroscopeLogEnabled = newValue}
  }
  /// Returns true if `gyroscopeLogEnabled` has been explicitly set.
  var hasGyroscopeLogEnabled: Bool {return _storage._gyroscopeLogEnabled != nil}
  /// Clears the value of `gyroscopeLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearGyroscopeLogEnabled() {_uniqueStorage()._gyroscopeLogEnabled = nil}

  var sleepLogEnabled: Bool {
    get {return _storage._sleepLogEnabled ?? false}
    set {_uniqueStorage()._sleepLogEnabled = newValue}
  }
  /// Returns true if `sleepLogEnabled` has been explicitly set.
  var hasSleepLogEnabled: Bool {return _storage._sleepLogEnabled != nil}
  /// Clears the value of `sleepLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearSleepLogEnabled() {_uniqueStorage()._sleepLogEnabled = nil}

  var slopeLogEnabled: Bool {
    get {return _storage._slopeLogEnabled ?? false}
    set {_uniqueStorage()._slopeLogEnabled = newValue}
  }
  /// Returns true if `slopeLogEnabled` has been explicitly set.
  var hasSlopeLogEnabled: Bool {return _storage._slopeLogEnabled != nil}
  /// Clears the value of `slopeLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearSlopeLogEnabled() {_uniqueStorage()._slopeLogEnabled = nil}

  var ambientLightLogEnabled: Bool {
    get {return _storage._ambientLightLogEnabled ?? false}
    set {_uniqueStorage()._ambientLightLogEnabled = newValue}
  }
  /// Returns true if `ambientLightLogEnabled` has been explicitly set.
  var hasAmbientLightLogEnabled: Bool {return _storage._ambientLightLogEnabled != nil}
  /// Clears the value of `ambientLightLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearAmbientLightLogEnabled() {_uniqueStorage()._ambientLightLogEnabled = nil}

  var tlrLogEnabled: Bool {
    get {return _storage._tlrLogEnabled ?? false}
    set {_uniqueStorage()._tlrLogEnabled = newValue}
  }
  /// Returns true if `tlrLogEnabled` has been explicitly set.
  var hasTlrLogEnabled: Bool {return _storage._tlrLogEnabled != nil}
  /// Clears the value of `tlrLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearTlrLogEnabled() {_uniqueStorage()._tlrLogEnabled = nil}

  var ppiLogEnabled: Bool {
    get {return _storage._ppiLogEnabled ?? false}
    set {_uniqueStorage()._ppiLogEnabled = newValue}
  }
  /// Returns true if `ppiLogEnabled` has been explicitly set.
  var hasPpiLogEnabled: Bool {return _storage._ppiLogEnabled != nil}
  /// Clears the value of `ppiLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearPpiLogEnabled() {_uniqueStorage()._ppiLogEnabled = nil}

  var ondemandLogEnabled: Bool {
    get {return _storage._ondemandLogEnabled ?? false}
    set {_uniqueStorage()._ondemandLogEnabled = newValue}
  }
  /// Returns true if `ondemandLogEnabled` has been explicitly set.
  var hasOndemandLogEnabled: Bool {return _storage._ondemandLogEnabled != nil}
  /// Clears the value of `ondemandLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearOndemandLogEnabled() {_uniqueStorage()._ondemandLogEnabled = nil}

  var capsenseLogEnabled: Bool {
    get {return _storage._capsenseLogEnabled ?? false}
    set {_uniqueStorage()._capsenseLogEnabled = newValue}
  }
  /// Returns true if `capsenseLogEnabled` has been explicitly set.
  var hasCapsenseLogEnabled: Bool {return _storage._capsenseLogEnabled != nil}
  /// Clears the value of `capsenseLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearCapsenseLogEnabled() {_uniqueStorage()._capsenseLogEnabled = nil}

  var fusionLogEnabled: Bool {
    get {return _storage._fusionLogEnabled ?? false}
    set {_uniqueStorage()._fusionLogEnabled = newValue}
  }
  /// Returns true if `fusionLogEnabled` has been explicitly set.
  var hasFusionLogEnabled: Bool {return _storage._fusionLogEnabled != nil}
  /// Clears the value of `fusionLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearFusionLogEnabled() {_uniqueStorage()._fusionLogEnabled = nil}

  var metLogEnabled: Bool {
    get {return _storage._metLogEnabled ?? false}
    set {_uniqueStorage()._metLogEnabled = newValue}
  }
  /// Returns true if `metLogEnabled` has been explicitly set.
  var hasMetLogEnabled: Bool {return _storage._metLogEnabled != nil}
  /// Clears the value of `metLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearMetLogEnabled() {_uniqueStorage()._metLogEnabled = nil}

  var verticalAccLogEnabled: Bool {
    get {return _storage._verticalAccLogEnabled ?? false}
    set {_uniqueStorage()._verticalAccLogEnabled = newValue}
  }
  /// Returns true if `verticalAccLogEnabled` has been explicitly set.
  var hasVerticalAccLogEnabled: Bool {return _storage._verticalAccLogEnabled != nil}
  /// Clears the value of `verticalAccLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearVerticalAccLogEnabled() {_uniqueStorage()._verticalAccLogEnabled = nil}

  /// Altitude movement detection logging 
  var amdLogEnabled: Bool {
    get {return _storage._amdLogEnabled ?? false}
    set {_uniqueStorage()._amdLogEnabled = newValue}
  }
  /// Returns true if `amdLogEnabled` has been explicitly set.
  var hasAmdLogEnabled: Bool {return _storage._amdLogEnabled != nil}
  /// Clears the value of `amdLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearAmdLogEnabled() {_uniqueStorage()._amdLogEnabled = nil}

  var skinTemperatureLogEnabled: Bool {
    get {return _storage._skinTemperatureLogEnabled ?? false}
    set {_uniqueStorage()._skinTemperatureLogEnabled = newValue}
  }
  /// Returns true if `skinTemperatureLogEnabled` has been explicitly set.
  var hasSkinTemperatureLogEnabled: Bool {return _storage._skinTemperatureLogEnabled != nil}
  /// Clears the value of `skinTemperatureLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearSkinTemperatureLogEnabled() {_uniqueStorage()._skinTemperatureLogEnabled = nil}

  var compassLogEnabled: Bool {
    get {return _storage._compassLogEnabled ?? false}
    set {_uniqueStorage()._compassLogEnabled = newValue}
  }
  /// Returns true if `compassLogEnabled` has been explicitly set.
  var hasCompassLogEnabled: Bool {return _storage._compassLogEnabled != nil}
  /// Clears the value of `compassLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearCompassLogEnabled() {_uniqueStorage()._compassLogEnabled = nil}

  var speed3DLogEnabled: Bool {
    get {return _storage._speed3DLogEnabled ?? false}
    set {_uniqueStorage()._speed3DLogEnabled = newValue}
  }
  /// Returns true if `speed3DLogEnabled` has been explicitly set.
  var hasSpeed3DLogEnabled: Bool {return _storage._speed3DLogEnabled != nil}
  /// Clears the value of `speed3DLogEnabled`. Subsequent reads from it will return its default value.
  mutating func clearSpeed3DLogEnabled() {_uniqueStorage()._speed3DLogEnabled = nil}

  var magnetometerLogFrequency: Data_PbSensorDataLog.PbMagnetometerLogFrequency {
    get {return _storage._magnetometerLogFrequency ?? .magLog10Hz}
    set {_uniqueStorage()._magnetometerLogFrequency = newValue}
  }
  /// Returns true if `magnetometerLogFrequency` has been explicitly set.
  var hasMagnetometerLogFrequency: Bool {return _storage._magnetometerLogFrequency != nil}
  /// Clears the value of `magnetometerLogFrequency`. Subsequent reads from it will return its default value.
  mutating func clearMagnetometerLogFrequency() {_uniqueStorage()._magnetometerLogFrequency = nil}

  var retainSettingsOverBoot: Bool {
    get {return _storage._retainSettingsOverBoot ?? false}
    set {_uniqueStorage()._retainSettingsOverBoot = newValue}
  }
  /// Returns true if `retainSettingsOverBoot` has been explicitly set.
  var hasRetainSettingsOverBoot: Bool {return _storage._retainSettingsOverBoot != nil}
  /// Clears the value of `retainSettingsOverBoot`. Subsequent reads from it will return its default value.
  mutating func clearRetainSettingsOverBoot() {_uniqueStorage()._retainSettingsOverBoot = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum PbLogTrigger: SwiftProtobuf.Enum {
    typealias RawValue = Int

    /// Log to enabled logs when system produces the required data
    case logTriggerSystem // = 0

    /// Log to enabled logs always and force the needed measurements on
    case logTriggerForced // = 1

    /// Log to enabled logs in exercise when system produces the required data
    case logTriggerExercise // = 2

    init() {
      self = .logTriggerSystem
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .logTriggerSystem
      case 1: self = .logTriggerForced
      case 2: self = .logTriggerExercise
      default: return nil
      }
    }

    var rawValue: Int {
      switch self {
      case .logTriggerSystem: return 0
      case .logTriggerForced: return 1
      case .logTriggerExercise: return 2
      }
    }

  }

  /// Minimum magnetometer frequency during logging. Please note that highest requested frequency is used
  /// in case of multiple requesters
  enum PbMagnetometerLogFrequency: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case magLog10Hz // = 1
    case magLog50Hz // = 2
    case magLog100Hz // = 3

    init() {
      self = .magLog10Hz
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 1: self = .magLog10Hz
      case 2: self = .magLog50Hz
      case 3: self = .magLog100Hz
      default: return nil
      }
    }

    var rawValue: Int {
      switch self {
      case .magLog10Hz: return 1
      case .magLog50Hz: return 2
      case .magLog100Hz: return 3
      }
    }

  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=4.2)

extension Data_PbSensorDataLog.PbLogTrigger: CaseIterable {
  // Support synthesized by the compiler.
}

extension Data_PbSensorDataLog.PbMagnetometerLogFrequency: CaseIterable {
  // Support synthesized by the compiler.
}

#endif  // swift(>=4.2)

#if swift(>=5.5) && canImport(_Concurrency)
extension Data_PbSensorDataLog: @unchecked Sendable {}
extension Data_PbSensorDataLog.PbLogTrigger: @unchecked Sendable {}
extension Data_PbSensorDataLog.PbMagnetometerLogFrequency: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "data"

extension Data_PbSensorDataLog: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PbSensorDataLog"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "log_trigger"),
    2: .standard(proto: "acceleration_log_enabled"),
    3: .standard(proto: "calories_log_enabled"),
    4: .standard(proto: "gps_log_enabled"),
    5: .standard(proto: "gps_nmea_log_enabled"),
    6: .standard(proto: "ohr_log_enabled"),
    7: .standard(proto: "magnetometer_log_enabled"),
    8: .standard(proto: "tap_log_enabled"),
    9: .standard(proto: "barometer_log_enabled"),
    10: .standard(proto: "gyroscope_log_enabled"),
    11: .standard(proto: "sleep_log_enabled"),
    12: .standard(proto: "slope_log_enabled"),
    13: .standard(proto: "ambient_light_log_enabled"),
    14: .standard(proto: "tlr_log_enabled"),
    15: .standard(proto: "ppi_log_enabled"),
    16: .standard(proto: "ondemand_log_enabled"),
    17: .standard(proto: "capsense_log_enabled"),
    18: .standard(proto: "fusion_log_enabled"),
    19: .standard(proto: "met_log_enabled"),
    20: .standard(proto: "vertical_acc_log_enabled"),
    21: .standard(proto: "amd_log_enabled"),
    22: .standard(proto: "skin_temperature_log_enabled"),
    23: .standard(proto: "compass_log_enabled"),
    24: .standard(proto: "speed3d_log_enabled"),
    50: .standard(proto: "magnetometer_log_frequency"),
    100: .standard(proto: "retain_settings_over_boot"),
  ]

  fileprivate class _StorageClass {
    var _logTrigger: Data_PbSensorDataLog.PbLogTrigger? = nil
    var _accelerationLogEnabled: Bool? = nil
    var _caloriesLogEnabled: Bool? = nil
    var _gpsLogEnabled: Bool? = nil
    var _gpsNmeaLogEnabled: Bool? = nil
    var _ohrLogEnabled: Bool? = nil
    var _magnetometerLogEnabled: Bool? = nil
    var _tapLogEnabled: Bool? = nil
    var _barometerLogEnabled: Bool? = nil
    var _gyroscopeLogEnabled: Bool? = nil
    var _sleepLogEnabled: Bool? = nil
    var _slopeLogEnabled: Bool? = nil
    var _ambientLightLogEnabled: Bool? = nil
    var _tlrLogEnabled: Bool? = nil
    var _ppiLogEnabled: Bool? = nil
    var _ondemandLogEnabled: Bool? = nil
    var _capsenseLogEnabled: Bool? = nil
    var _fusionLogEnabled: Bool? = nil
    var _metLogEnabled: Bool? = nil
    var _verticalAccLogEnabled: Bool? = nil
    var _amdLogEnabled: Bool? = nil
    var _skinTemperatureLogEnabled: Bool? = nil
    var _compassLogEnabled: Bool? = nil
    var _speed3DLogEnabled: Bool? = nil
    var _magnetometerLogFrequency: Data_PbSensorDataLog.PbMagnetometerLogFrequency? = nil
    var _retainSettingsOverBoot: Bool? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _logTrigger = source._logTrigger
      _accelerationLogEnabled = source._accelerationLogEnabled
      _caloriesLogEnabled = source._caloriesLogEnabled
      _gpsLogEnabled = source._gpsLogEnabled
      _gpsNmeaLogEnabled = source._gpsNmeaLogEnabled
      _ohrLogEnabled = source._ohrLogEnabled
      _magnetometerLogEnabled = source._magnetometerLogEnabled
      _tapLogEnabled = source._tapLogEnabled
      _barometerLogEnabled = source._barometerLogEnabled
      _gyroscopeLogEnabled = source._gyroscopeLogEnabled
      _sleepLogEnabled = source._sleepLogEnabled
      _slopeLogEnabled = source._slopeLogEnabled
      _ambientLightLogEnabled = source._ambientLightLogEnabled
      _tlrLogEnabled = source._tlrLogEnabled
      _ppiLogEnabled = source._ppiLogEnabled
      _ondemandLogEnabled = source._ondemandLogEnabled
      _capsenseLogEnabled = source._capsenseLogEnabled
      _fusionLogEnabled = source._fusionLogEnabled
      _metLogEnabled = source._metLogEnabled
      _verticalAccLogEnabled = source._verticalAccLogEnabled
      _amdLogEnabled = source._amdLogEnabled
      _skinTemperatureLogEnabled = source._skinTemperatureLogEnabled
      _compassLogEnabled = source._compassLogEnabled
      _speed3DLogEnabled = source._speed3DLogEnabled
      _magnetometerLogFrequency = source._magnetometerLogFrequency
      _retainSettingsOverBoot = source._retainSettingsOverBoot
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularEnumField(value: &_storage._logTrigger) }()
        case 2: try { try decoder.decodeSingularBoolField(value: &_storage._accelerationLogEnabled) }()
        case 3: try { try decoder.decodeSingularBoolField(value: &_storage._caloriesLogEnabled) }()
        case 4: try { try decoder.decodeSingularBoolField(value: &_storage._gpsLogEnabled) }()
        case 5: try { try decoder.decodeSingularBoolField(value: &_storage._gpsNmeaLogEnabled) }()
        case 6: try { try decoder.decodeSingularBoolField(value: &_storage._ohrLogEnabled) }()
        case 7: try { try decoder.decodeSingularBoolField(value: &_storage._magnetometerLogEnabled) }()
        case 8: try { try decoder.decodeSingularBoolField(value: &_storage._tapLogEnabled) }()
        case 9: try { try decoder.decodeSingularBoolField(value: &_storage._barometerLogEnabled) }()
        case 10: try { try decoder.decodeSingularBoolField(value: &_storage._gyroscopeLogEnabled) }()
        case 11: try { try decoder.decodeSingularBoolField(value: &_storage._sleepLogEnabled) }()
        case 12: try { try decoder.decodeSingularBoolField(value: &_storage._slopeLogEnabled) }()
        case 13: try { try decoder.decodeSingularBoolField(value: &_storage._ambientLightLogEnabled) }()
        case 14: try { try decoder.decodeSingularBoolField(value: &_storage._tlrLogEnabled) }()
        case 15: try { try decoder.decodeSingularBoolField(value: &_storage._ppiLogEnabled) }()
        case 16: try { try decoder.decodeSingularBoolField(value: &_storage._ondemandLogEnabled) }()
        case 17: try { try decoder.decodeSingularBoolField(value: &_storage._capsenseLogEnabled) }()
        case 18: try { try decoder.decodeSingularBoolField(value: &_storage._fusionLogEnabled) }()
        case 19: try { try decoder.decodeSingularBoolField(value: &_storage._metLogEnabled) }()
        case 20: try { try decoder.decodeSingularBoolField(value: &_storage._verticalAccLogEnabled) }()
        case 21: try { try decoder.decodeSingularBoolField(value: &_storage._amdLogEnabled) }()
        case 22: try { try decoder.decodeSingularBoolField(value: &_storage._skinTemperatureLogEnabled) }()
        case 23: try { try decoder.decodeSingularBoolField(value: &_storage._compassLogEnabled) }()
        case 24: try { try decoder.decodeSingularBoolField(value: &_storage._speed3DLogEnabled) }()
        case 50: try { try decoder.decodeSingularEnumField(value: &_storage._magnetometerLogFrequency) }()
        case 100: try { try decoder.decodeSingularBoolField(value: &_storage._retainSettingsOverBoot) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._logTrigger {
        try visitor.visitSingularEnumField(value: v, fieldNumber: 1)
      } }()
      try { if let v = _storage._accelerationLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 2)
      } }()
      try { if let v = _storage._caloriesLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 3)
      } }()
      try { if let v = _storage._gpsLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 4)
      } }()
      try { if let v = _storage._gpsNmeaLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 5)
      } }()
      try { if let v = _storage._ohrLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 6)
      } }()
      try { if let v = _storage._magnetometerLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 7)
      } }()
      try { if let v = _storage._tapLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 8)
      } }()
      try { if let v = _storage._barometerLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 9)
      } }()
      try { if let v = _storage._gyroscopeLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 10)
      } }()
      try { if let v = _storage._sleepLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 11)
      } }()
      try { if let v = _storage._slopeLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 12)
      } }()
      try { if let v = _storage._ambientLightLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 13)
      } }()
      try { if let v = _storage._tlrLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 14)
      } }()
      try { if let v = _storage._ppiLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 15)
      } }()
      try { if let v = _storage._ondemandLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 16)
      } }()
      try { if let v = _storage._capsenseLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 17)
      } }()
      try { if let v = _storage._fusionLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 18)
      } }()
      try { if let v = _storage._metLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 19)
      } }()
      try { if let v = _storage._verticalAccLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 20)
      } }()
      try { if let v = _storage._amdLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 21)
      } }()
      try { if let v = _storage._skinTemperatureLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 22)
      } }()
      try { if let v = _storage._compassLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 23)
      } }()
      try { if let v = _storage._speed3DLogEnabled {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 24)
      } }()
      try { if let v = _storage._magnetometerLogFrequency {
        try visitor.visitSingularEnumField(value: v, fieldNumber: 50)
      } }()
      try { if let v = _storage._retainSettingsOverBoot {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 100)
      } }()
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Data_PbSensorDataLog, rhs: Data_PbSensorDataLog) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._logTrigger != rhs_storage._logTrigger {return false}
        if _storage._accelerationLogEnabled != rhs_storage._accelerationLogEnabled {return false}
        if _storage._caloriesLogEnabled != rhs_storage._caloriesLogEnabled {return false}
        if _storage._gpsLogEnabled != rhs_storage._gpsLogEnabled {return false}
        if _storage._gpsNmeaLogEnabled != rhs_storage._gpsNmeaLogEnabled {return false}
        if _storage._ohrLogEnabled != rhs_storage._ohrLogEnabled {return false}
        if _storage._magnetometerLogEnabled != rhs_storage._magnetometerLogEnabled {return false}
        if _storage._tapLogEnabled != rhs_storage._tapLogEnabled {return false}
        if _storage._barometerLogEnabled != rhs_storage._barometerLogEnabled {return false}
        if _storage._gyroscopeLogEnabled != rhs_storage._gyroscopeLogEnabled {return false}
        if _storage._sleepLogEnabled != rhs_storage._sleepLogEnabled {return false}
        if _storage._slopeLogEnabled != rhs_storage._slopeLogEnabled {return false}
        if _storage._ambientLightLogEnabled != rhs_storage._ambientLightLogEnabled {return false}
        if _storage._tlrLogEnabled != rhs_storage._tlrLogEnabled {return false}
        if _storage._ppiLogEnabled != rhs_storage._ppiLogEnabled {return false}
        if _storage._ondemandLogEnabled != rhs_storage._ondemandLogEnabled {return false}
        if _storage._capsenseLogEnabled != rhs_storage._capsenseLogEnabled {return false}
        if _storage._fusionLogEnabled != rhs_storage._fusionLogEnabled {return false}
        if _storage._metLogEnabled != rhs_storage._metLogEnabled {return false}
        if _storage._verticalAccLogEnabled != rhs_storage._verticalAccLogEnabled {return false}
        if _storage._amdLogEnabled != rhs_storage._amdLogEnabled {return false}
        if _storage._skinTemperatureLogEnabled != rhs_storage._skinTemperatureLogEnabled {return false}
        if _storage._compassLogEnabled != rhs_storage._compassLogEnabled {return false}
        if _storage._speed3DLogEnabled != rhs_storage._speed3DLogEnabled {return false}
        if _storage._magnetometerLogFrequency != rhs_storage._magnetometerLogFrequency {return false}
        if _storage._retainSettingsOverBoot != rhs_storage._retainSettingsOverBoot {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Data_PbSensorDataLog.PbLogTrigger: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "LOG_TRIGGER_SYSTEM"),
    1: .same(proto: "LOG_TRIGGER_FORCED"),
    2: .same(proto: "LOG_TRIGGER_EXERCISE"),
  ]
}

extension Data_PbSensorDataLog.PbMagnetometerLogFrequency: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "MAG_LOG_10HZ"),
    2: .same(proto: "MAG_LOG_50HZ"),
    3: .same(proto: "MAG_LOG_100HZ"),
  ]
}
