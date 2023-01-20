import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_props.freezed.dart';

@freezed
class RadioProps<T> with _$RadioProps<T> {
  factory RadioProps({
    required String title,
    required T value,
  }) = _RadioProps<T>;
}
