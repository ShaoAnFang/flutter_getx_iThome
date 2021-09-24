import 'package:get/get.dart';

class BindingPageController extends GetxController {
  //String
  final _someString = ''.obs;
  set someString(value) => this._someString.value = value;
  get someString => this._someString.value;

  //int
  final _someInt = 0.obs;
  set someInt(value) => this._someInt.value = value;
  get someInt => this._someInt.value;

  //bool
  final _someBool = false.obs;
  set someBool(value) => this._someBool.value = value;
  get someBool => this._someBool.value;

  //List
  final _someBasicList = <String>[].obs;
  set someBasicList(value) => this._someBasicList.value = value;
  get someBasicList => this._someBasicList.toList();

  //List<DataModel>
  final _someModelList = <SomeModel>[].obs;
  set someModelList(value) => this._someModelList.value = value;
  List<SomeModel> get someModelList => this._someModelList.toList();

  //Map
  final someDict = {}.obs;

  //Enum
  final _enumSelectState = Rx<SomeEnumState>(SomeEnumState.stateOne);
  set enumSelectState(value) => this._enumSelectState.value = value;
  get enumSelectState => this._enumSelectState.value;

  @override
  void onInit() {
    enumSelectState = SomeEnumState.stateThree;
    super.onInit();
  }

  addSomeModelList() {
    final someModel = SomeModel()
      ..id = 55
      ..name = "itHome"
      ..trueFalse = true;
    _someModelList.add(someModel);
    this.update();
  }

  enumChanged() {
    switch (enumSelectState) {
      case SomeEnumState.stateOne:
        enumSelectState = SomeEnumState.stateTwo;
        break;
      case SomeEnumState.stateTwo:
        enumSelectState = SomeEnumState.stateThree;
        break;
      case SomeEnumState.stateThree:
        enumSelectState = SomeEnumState.stateOne;
        break;
    }
    update(["enum"]);
  }

  addBasicList() {
    _someBasicList.add("add");
  }
}

class SomeModel {
  int id = 0;
  String name = "";
  bool trueFalse = false;

  SomeModel();

  SomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    trueFalse = json['trueFalse'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['truealse'] = this.trueFalse;
    return data;
  }
}

enum SomeEnumState {
  stateOne,
  stateTwo,
  stateThree,
}
