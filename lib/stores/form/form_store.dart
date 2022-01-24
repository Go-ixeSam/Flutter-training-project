import 'package:mobx/mobx.dart';
import 'package:online_croceries/models/vietname_zone_json/vietnam_zone.dart';
import 'package:online_croceries/models/vietname_zone_json/zone_list.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:validators/validators.dart';
part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => userName, validateUserName),
      reaction((_) => phone, validatePhone),
      // reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String userName = '';

  @observable
  String password = '';

  @observable
  String phone = '';

  @observable
  String confirmPassword = '';

  @observable
  String zoneSelection =
      ZoneList.fromJson(VietnameZone.Vietname).zone![0].city.toString();

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userName.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&
      userName.isNotEmpty;
  // confirmPassword.isNotEmpty;

  @computed
  bool get canPhoneLogin {
    return !formErrorStore.hasErrorInPhoneLogin && phone.isNotEmpty;
    // return phone.isNotEmpty;
  }

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setUserName(String value) {
    userName = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setPhone(String value) {
    print("hoat dong roi");
    phone = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void setZoneSelection(String value) {
    zoneSelection = value;
    print("new value= ${value}");
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  // @action
  // void validatePhone(String value){
  //   if(value.isEmpty){
  //     formErrorStore.phone="Phone cant be empty";
  //   }
  // }

  @action
  void validateUserName(String value) {
    if (value.isEmpty) {
      formErrorStore.userName = "User name can't be empty";
    } else {
      formErrorStore.userName = null;
    }
  }

  @action
  void validatePhone(String value) {
    RegExp regExp = new RegExp(
      r"(84|0[3|5|7|8|9])+([0-9]{8})\b",
      caseSensitive: false,
      multiLine: false,
    );
    if (value.isEmpty) {
      formErrorStore.phone = "Phone cant be empty";
    } else if (!regExp.hasMatch(value)) {
      formErrorStore.phone = "Phone number must be correct format";
    } else {
      formErrorStore.phone = null;
    }
    // print("phone: ${value}, valid: ${regex.hasMatch(value)}");
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doen't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future login() async {
    loading = true;
    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
    validateConfirmPassword(confirmPassword);
    validateUserName(userName);
    validatePhone(phone);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? userName;

  @observable
  String? phone;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || userName != null;

  @computed
  bool get hasErrorInPhoneLogin {
    return phone != null;
  }

  // confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
