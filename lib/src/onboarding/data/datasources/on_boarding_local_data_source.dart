import 'package:exam_app/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource{

  const OnBoardingLocalDataSource();

  Future<void> cacheFirstTimer();
  Future<bool> checkIfUserIsFirstTimer();
}

const kFirstTimerKey = 'first_timer';

class OnBoardingLocalDataSourceDataImp extends OnBoardingLocalDataSource{

  const OnBoardingLocalDataSourceDataImp(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> cacheFirstTimer() async{
    try{
      await _preferences.setBool(kFirstTimerKey, false);
    }catch(e){
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async{
    return _preferences.getBool(kFirstTimerKey)?? true;
  }

}
