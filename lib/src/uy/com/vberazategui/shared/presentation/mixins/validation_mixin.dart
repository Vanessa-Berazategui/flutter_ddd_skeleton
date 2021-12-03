mixin ValidationMixin {
  String? validateEmptinessStr(String? field) {
    if (field!.trim().isEmpty) {
      return '';
    } else {
      return null;
    }
  }

  String? validateEmptinessInt(int? field) {
    if (field == null) {
      return '';
    } else {
      return null;
    }
  }
}
