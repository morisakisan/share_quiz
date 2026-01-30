// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Setting implements DiagnosticableTreeMixin {

 PackageInfo get packageInfo; bool get isLogin;
/// Create a copy of Setting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingCopyWith<Setting> get copyWith => _$SettingCopyWithImpl<Setting>(this as Setting, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Setting'))
    ..add(DiagnosticsProperty('packageInfo', packageInfo))..add(DiagnosticsProperty('isLogin', isLogin));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Setting&&(identical(other.packageInfo, packageInfo) || other.packageInfo == packageInfo)&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin));
}


@override
int get hashCode => Object.hash(runtimeType,packageInfo,isLogin);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Setting(packageInfo: $packageInfo, isLogin: $isLogin)';
}


}

/// @nodoc
abstract mixin class $SettingCopyWith<$Res>  {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) _then) = _$SettingCopyWithImpl;
@useResult
$Res call({
 PackageInfo packageInfo, bool isLogin
});




}
/// @nodoc
class _$SettingCopyWithImpl<$Res>
    implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._self, this._then);

  final Setting _self;
  final $Res Function(Setting) _then;

/// Create a copy of Setting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageInfo = null,Object? isLogin = null,}) {
  return _then(_self.copyWith(
packageInfo: null == packageInfo ? _self.packageInfo : packageInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo,isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Setting].
extension SettingPatterns on Setting {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Setting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Setting() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Setting value)  $default,){
final _that = this;
switch (_that) {
case _Setting():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Setting value)?  $default,){
final _that = this;
switch (_that) {
case _Setting() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PackageInfo packageInfo,  bool isLogin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Setting() when $default != null:
return $default(_that.packageInfo,_that.isLogin);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PackageInfo packageInfo,  bool isLogin)  $default,) {final _that = this;
switch (_that) {
case _Setting():
return $default(_that.packageInfo,_that.isLogin);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PackageInfo packageInfo,  bool isLogin)?  $default,) {final _that = this;
switch (_that) {
case _Setting() when $default != null:
return $default(_that.packageInfo,_that.isLogin);case _:
  return null;

}
}

}

/// @nodoc


class _Setting with DiagnosticableTreeMixin implements Setting {
  const _Setting({required this.packageInfo, required this.isLogin});
  

@override final  PackageInfo packageInfo;
@override final  bool isLogin;

/// Create a copy of Setting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingCopyWith<_Setting> get copyWith => __$SettingCopyWithImpl<_Setting>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Setting'))
    ..add(DiagnosticsProperty('packageInfo', packageInfo))..add(DiagnosticsProperty('isLogin', isLogin));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Setting&&(identical(other.packageInfo, packageInfo) || other.packageInfo == packageInfo)&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin));
}


@override
int get hashCode => Object.hash(runtimeType,packageInfo,isLogin);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Setting(packageInfo: $packageInfo, isLogin: $isLogin)';
}


}

/// @nodoc
abstract mixin class _$SettingCopyWith<$Res> implements $SettingCopyWith<$Res> {
  factory _$SettingCopyWith(_Setting value, $Res Function(_Setting) _then) = __$SettingCopyWithImpl;
@override @useResult
$Res call({
 PackageInfo packageInfo, bool isLogin
});




}
/// @nodoc
class __$SettingCopyWithImpl<$Res>
    implements _$SettingCopyWith<$Res> {
  __$SettingCopyWithImpl(this._self, this._then);

  final _Setting _self;
  final $Res Function(_Setting) _then;

/// Create a copy of Setting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageInfo = null,Object? isLogin = null,}) {
  return _then(_Setting(
packageInfo: null == packageInfo ? _self.packageInfo : packageInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo,isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
