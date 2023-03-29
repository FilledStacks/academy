// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  String get id => throw _privateConstructorUsedError;
  String get readableId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Module> get modules => throw _privateConstructorUsedError;
  List<String> get perks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call({String id, String readableId, String title, List<Module> modules});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readableId = null,
    Object? title = null,
    Object? description = freezed,
    Object? modules = null,
    Object? perks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readableId: null == readableId
          ? _value.readableId
          : readableId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      modules: null == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>,
      perks: null == perks
          ? _value.perks
          : perks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String readableId, String title, List<Module> modules});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$_Course>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readableId = null,
    Object? title = null,
    Object? description = freezed,
    Object? modules = null,
    Object? perks = null,
  }) {
    return _then(_$_Course(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readableId: null == readableId
          ? _value.readableId
          : readableId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      modules: null == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<Module>,
      perks: null == perks
          ? _value._perks
          : perks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course extends _Course {
  _$_Course(
      {required this.id,
      required this.readableId,
      required this.title,
      this.description,
      required final List<Module> modules,
      final List<String> perks = const []})
      : _modules = modules,
        _perks = perks,
        super._();

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

  @override
  final String id;
  @override
  final String readableId;
  @override
  final String title;
  @override
  final String? description;
  final List<Module> _modules;
  @override
  List<Module> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  final List<String> _perks;
  @override
  @JsonKey()
  List<String> get perks {
    if (_perks is EqualUnmodifiableListView) return _perks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_perks);
  }

  @override
  String toString() {
    return 'Course(id: $id, readableId: $readableId, title: $title, modules: $modules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.readableId, readableId) ||
                other.readableId == readableId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._modules, _modules) &&
            const DeepCollectionEquality().equals(other._perks, _perks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, readableId, title,
      const DeepCollectionEquality().hash(_modules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(
      this,
    );
  }
}

abstract class _Course extends Course {
  factory _Course(
      {required final String id,
      required final String readableId,
      required final String title,
      final String? description,
      required final List<Module> modules,
      final List<String> perks}) = _$_Course;
  _Course._() : super._();

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

  @override
  String get id;
  @override
  String get readableId;
  @override
  String get title;
  @override
  String? get description;
  @override
  List<Module> get modules;
  @override
  List<String> get perks;
  @override
  @JsonKey(ignore: true)
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return _Module.fromJson(json);
}

/// @nodoc
mixin _$Module {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get leadingEmoji => throw _privateConstructorUsedError;
  List<Chapter> get chapters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModuleCopyWith<Module> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleCopyWith<$Res> {
  factory $ModuleCopyWith(Module value, $Res Function(Module) then) =
      _$ModuleCopyWithImpl<$Res, Module>;
  @useResult
  $Res call(
      {String id, String title, String? leadingEmoji, List<Chapter> chapters});
}

/// @nodoc
class _$ModuleCopyWithImpl<$Res, $Val extends Module>
    implements $ModuleCopyWith<$Res> {
  _$ModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? leadingEmoji = freezed,
    Object? chapters = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      leadingEmoji: freezed == leadingEmoji
          ? _value.leadingEmoji
          : leadingEmoji // ignore: cast_nullable_to_non_nullable
              as String?,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModuleCopyWith<$Res> implements $ModuleCopyWith<$Res> {
  factory _$$_ModuleCopyWith(_$_Module value, $Res Function(_$_Module) then) =
      __$$_ModuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String title, String? leadingEmoji, List<Chapter> chapters});
}

/// @nodoc
class __$$_ModuleCopyWithImpl<$Res>
    extends _$ModuleCopyWithImpl<$Res, _$_Module>
    implements _$$_ModuleCopyWith<$Res> {
  __$$_ModuleCopyWithImpl(_$_Module _value, $Res Function(_$_Module) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? leadingEmoji = freezed,
    Object? chapters = null,
  }) {
    return _then(_$_Module(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      leadingEmoji: freezed == leadingEmoji
          ? _value.leadingEmoji
          : leadingEmoji // ignore: cast_nullable_to_non_nullable
              as String?,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Module extends _Module {
  _$_Module(
      {required this.id,
      required this.title,
      this.leadingEmoji,
      required final List<Chapter> chapters})
      : _chapters = chapters,
        super._();

  factory _$_Module.fromJson(Map<String, dynamic> json) =>
      _$$_ModuleFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? leadingEmoji;
  final List<Chapter> _chapters;
  @override
  List<Chapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  String toString() {
    return 'Module(id: $id, title: $title, leadingEmoji: $leadingEmoji, chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Module &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.leadingEmoji, leadingEmoji) ||
                other.leadingEmoji == leadingEmoji) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, leadingEmoji,
      const DeepCollectionEquality().hash(_chapters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModuleCopyWith<_$_Module> get copyWith =>
      __$$_ModuleCopyWithImpl<_$_Module>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModuleToJson(
      this,
    );
  }
}

abstract class _Module extends Module {
  factory _Module(
      {required final String id,
      required final String title,
      final String? leadingEmoji,
      required final List<Chapter> chapters}) = _$_Module;
  _Module._() : super._();

  factory _Module.fromJson(Map<String, dynamic> json) = _$_Module.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get leadingEmoji;
  @override
  List<Chapter> get chapters;
  @override
  @JsonKey(ignore: true)
  _$$_ModuleCopyWith<_$_Module> get copyWith =>
      throw _privateConstructorUsedError;
}

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get durationInSeconds => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get writtenContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int durationInSeconds,
      String? videoUrl,
      String? writtenContent});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? durationInSeconds = null,
    Object? videoUrl = freezed,
    Object? writtenContent = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationInSeconds: null == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      writtenContent: freezed == writtenContent
          ? _value.writtenContent
          : writtenContent // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$_ChapterCopyWith(
          _$_Chapter value, $Res Function(_$_Chapter) then) =
      __$$_ChapterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int durationInSeconds,
      String? videoUrl,
      String? writtenContent});
}

/// @nodoc
class __$$_ChapterCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$_Chapter>
    implements _$$_ChapterCopyWith<$Res> {
  __$$_ChapterCopyWithImpl(_$_Chapter _value, $Res Function(_$_Chapter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? durationInSeconds = null,
    Object? videoUrl = freezed,
    Object? writtenContent = freezed,
  }) {
    return _then(_$_Chapter(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationInSeconds: null == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      writtenContent: freezed == writtenContent
          ? _value.writtenContent
          : writtenContent // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chapter extends _Chapter {
  _$_Chapter(
      {required this.id,
      required this.title,
      required this.description,
      required this.durationInSeconds,
      this.videoUrl,
      this.writtenContent})
      : super._();

  factory _$_Chapter.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int durationInSeconds;
  @override
  final String? videoUrl;
  @override
  final String? writtenContent;

  @override
  String toString() {
    return 'Chapter(id: $id, title: $title, description: $description, durationInSeconds: $durationInSeconds, videoUrl: $videoUrl, writtenContent: $writtenContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chapter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.durationInSeconds, durationInSeconds) ||
                other.durationInSeconds == durationInSeconds) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.writtenContent, writtenContent) ||
                other.writtenContent == writtenContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      durationInSeconds, videoUrl, writtenContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterCopyWith<_$_Chapter> get copyWith =>
      __$$_ChapterCopyWithImpl<_$_Chapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterToJson(
      this,
    );
  }
}

abstract class _Chapter extends Chapter {
  factory _Chapter(
      {required final String id,
      required final String title,
      required final String description,
      required final int durationInSeconds,
      final String? videoUrl,
      final String? writtenContent}) = _$_Chapter;
  _Chapter._() : super._();

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$_Chapter.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get durationInSeconds;
  @override
  String? get videoUrl;
  @override
  String? get writtenContent;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterCopyWith<_$_Chapter> get copyWith =>
      throw _privateConstructorUsedError;
}
