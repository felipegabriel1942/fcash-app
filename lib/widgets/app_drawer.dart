import 'dart:convert';

import 'package:fcash_app/controllers/widgets/app_drawer_controller.dart';
import 'package:fcash_app/utils/app_routes.dart';
import 'package:fcash_app/widgets/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final controller = GetIt.I<AppDrawerController>();

  @override
  void initState() {
    controller.getUserName();
    controller.getUserImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _availableWidth = MediaQuery.of(context).size.width;
    final _availableHeight = MediaQuery.of(context).size.height;

    _showUserNameDialog() async {
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text(
            'Informe seu nome',
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  onChanged: controller.setUserName,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            color: Colors.blue,
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: _availableWidth * 0.2,
                  child: GestureDetector(
                    onTap: _showImageDialog,
                    child: Observer(builder: (_) {
                      return CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (controller.userImage.isEmpty)
                              Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              )
                            else
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: MemoryImage(
                                  base64.decode(
                                    controller.userImage,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                Observer(builder: (_) {
                  return GestureDetector(
                    onTap: _showUserNameDialog,
                    child: Container(
                      width: _availableWidth * 0.46,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.table_chart,
            ),
            title: Text('Resumo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(
              MdiIcons.minusBox,
            ),
            title: Text('Despesas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.EXPENSES);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(
              Icons.add_box,
            ),
            title: Text('Receitas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.REVENUES);
            },
          ),
          Divider(),
          Container(
            height: _availableHeight * 0.47,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Fcash (version: 1.0.1)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _showImageDialog() async {
    await showDialog(
      context: context,
      child: ImagePickerDialog(
        getFromCamera: _getFromCamera,
        getFromGallery: _getFromGallery,
      ),
    );
  }

  Future<void> _getFromCamera() async {
    Navigator.of(context).pop();

    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFile == null) {
      return;
    }

    _onSelectedImage(pickedFile);
  }

  Future<void> _getFromGallery() async {
    Navigator.of(context).pop();

    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

    _onSelectedImage(pickedFile);
  }

  Future<void> _onSelectedImage(PickedFile pickedFile) async {
    final image = base64.encode(await pickedFile.readAsBytes());
    controller.setUserImage(image);
  }
}
