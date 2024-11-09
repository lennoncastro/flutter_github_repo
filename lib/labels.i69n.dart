// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Labels implements i69n.I69nMessageBundle {
  const Labels();
  TextFieldLabels get textField => TextFieldLabels(this);
  ErrorLabels get error => ErrorLabels(this);
  PullRequestsLabels get pullRequests => PullRequestsLabels(this);
  GeneralLabels get general => GeneralLabels(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'textField':
        return textField;
      case 'error':
        return error;
      case 'pullRequests':
        return pullRequests;
      case 'general':
        return general;
      default:
        return key;
    }
  }
}

class TextFieldLabels implements i69n.I69nMessageBundle {
  final Labels _parent;
  const TextFieldLabels(this._parent);
  String get search => "Procure por uma linguagem...";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'search':
        return search;
      default:
        return key;
    }
  }
}

class ErrorLabels implements i69n.I69nMessageBundle {
  final Labels _parent;
  const ErrorLabels(this._parent);
  String get noResultsFound => "Nenhum resultado encontrado";
  String get requestError => "Erro de requisição";
  String get serverError => "Erro do servidor";
  String get unknownError => "Erro desconhecido";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'noResultsFound':
        return noResultsFound;
      case 'requestError':
        return requestError;
      case 'serverError':
        return serverError;
      case 'unknownError':
        return unknownError;
      default:
        return key;
    }
  }
}

class PullRequestsLabels implements i69n.I69nMessageBundle {
  final Labels _parent;
  const PullRequestsLabels(this._parent);
  String opened(int count) => "Abertos $count";
  String closed(int count) => "Fechados $count";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'opened':
        return opened;
      case 'closed':
        return closed;
      default:
        return key;
    }
  }
}

class GeneralLabels implements i69n.I69nMessageBundle {
  final Labels _parent;
  const GeneralLabels(this._parent);
  String get slash => "/";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'slash':
        return slash;
      default:
        return key;
    }
  }
}
