import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppPreferences {
  AppPreferences._privateConstructor();

  static final AppPreferences _instance = AppPreferences._privateConstructor();

  static AppPreferences get instance => _instance;

  late Box<dynamic> _box;

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox('mexpertz');
  }

  Box<dynamic> get hiveDb => _box;

  String get name => _box.get('name') ?? '';
  set name(String value) => _box.put('name', value);

  bool get isLogin => _box.get('isLogin') ?? false;
  set isLogin(bool value) => _box.put('isLogin', value);
}
