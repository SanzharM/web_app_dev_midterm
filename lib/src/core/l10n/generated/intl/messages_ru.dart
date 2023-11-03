// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(n) => "${n} лайков";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "appLanguage": MessageLookupByLibrary.simpleMessage("Язык приложения"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "done": MessageLookupByLibrary.simpleMessage("Готово"),
        "edit": MessageLookupByLibrary.simpleMessage("Изменить"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "fillTheField": MessageLookupByLibrary.simpleMessage("Заполните поле"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Понятно"),
        "listIsEmpty": MessageLookupByLibrary.simpleMessage("Список пуст"),
        "nLikes": m0,
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "post": MessageLookupByLibrary.simpleMessage("Пост"),
        "posts": MessageLookupByLibrary.simpleMessage("Посты"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "yes": MessageLookupByLibrary.simpleMessage("Да")
      };
}
