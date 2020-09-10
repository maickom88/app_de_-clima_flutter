extension CheckListInStrings on List {
  bool check(List<String> stringList) {
    for (var i = 0; i < this.length; i++) {
      if (stringList.contains(this[i])) {
        return true;
      }
    }
    return false;
  }
}
