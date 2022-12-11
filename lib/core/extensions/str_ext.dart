extension StrExt on String? {
  String get toABR {
    return this?[0] ?? 'JS';
  }
}
