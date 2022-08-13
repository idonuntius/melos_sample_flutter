import 'package:freezed_annotation/freezed_annotation.dart';

part 'me.freezed.dart';

@freezed
class Me with _$Me {
  const factory Me({
    required int id,
    required String name,
  }) = _Me;
}
