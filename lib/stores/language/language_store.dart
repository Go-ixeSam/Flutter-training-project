
import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/language/language.dart';
import 'package:online_croceries/stores/error/error_store.dart';
part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  static const String TAG = "LanguageStore";

  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // supported languages
  List<Language> supportedLanguages = [
    Language(code: 'US', locale: 'en', language: 'English'),
    Language(code: 'VI', locale: 'vi', language: 'Vietnamese'),
  ];

  // constructor:---------------------------------------------------------------
  _LanguageStore(Repository repository)
      : this._repository = repository {
    init();
  }

  // store variables:-----------------------------------------------------------
  @observable
  String _locale = "en";
  // String _locale = "vi";

  @computed
  String get locale => _locale;

  // actions:-------------------------------------------------------------------
  @action
  void changeLanguage(String value) {
    _locale = value;
    _repository.changeLanguage(value).then((_) {
      // write additional logic here
    });
  }

  @action
  String getCode() {
    var code;

    if (_locale == 'en') {
      code = "US";
    } else if (_locale == 'vi') {
      code = "VI";
    }

    return code;
  }

  @action
  String? getLanguage() {
    return supportedLanguages[supportedLanguages
            .indexWhere((language) => language.locale == _locale)]
        .language;
  }

  // general:-------------------------------------------------------------------
  void init() async {
    // getting current lang from shared preference
    if(_repository.currentLanguage != null) {
      _locale = _repository.currentLanguage!;
    }
  }

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}
}
