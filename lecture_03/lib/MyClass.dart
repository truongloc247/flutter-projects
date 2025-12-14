class MyClass {
  String? _classId;
  String? _className;
  int? _numberOfStudent;

  MyClass(String classId, String className, int numberOfStudent) {
    this._classId = classId;
    this._className = className;
    this._numberOfStudent = numberOfStudent;
  }

  String? get getClassId {
    return this._classId;
  }

  String? get getClassName {
    return this._className;
  }

  int? get getNumberOfStudent {
    return this._numberOfStudent;
  }
}
