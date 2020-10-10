import 'package:fcash_app/utils/app_storage.dart';
import 'package:mobx/mobx.dart';
part 'app_drawer_controller.g.dart';

class AppDrawerController = _AppDrawerControllerBase with _$AppDrawerController;

abstract class _AppDrawerControllerBase with Store {
  
  @observable
  String userName = 'Usuário';

  @action
  Future<void> setUserName(String value) async {
    userName = value;

    await AppStorage.saveMap('userName', {
      'userName': userName,
    });
  }

  Future<void> getUserName() async {
    userName = await AppStorage.getUserName();
  }

  @observable
  String userImage = '';

  @action
  Future<void> setUserImage(String value) async {
    userImage = value;

    await AppStorage.saveMap('userImage', {
      'userImage': userImage,
    });
  }

  Future<void> getUserImage() async {
    userImage = await AppStorage.getUserImage();
  }

}