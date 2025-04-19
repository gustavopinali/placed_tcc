import 'package:collection/collection.dart';

enum LinkType {
  Phone,
  Website,
  Instagram,
  WhatsApp,
  Others,
}

enum Gender {
  All,
  Male,
  Female,
}

enum EnumEventStatus {
  draft,
  published,
  finished,
}

enum LoginState {
  log_in,
  sign_in,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (LinkType):
      return LinkType.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (EnumEventStatus):
      return EnumEventStatus.values.deserialize(value) as T?;
    case (LoginState):
      return LoginState.values.deserialize(value) as T?;
    default:
      return null;
  }
}
