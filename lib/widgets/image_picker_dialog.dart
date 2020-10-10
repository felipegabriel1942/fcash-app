import 'package:flutter/material.dart';

class ImagePickerDialog extends StatelessWidget {

  final Function getFromCamera;
  final Function getFromGallery;

  ImagePickerDialog({
    this.getFromCamera,
    this.getFromGallery
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Escolher ação',
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                child: Text(
                  'Tirar foto',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                onTap: getFromCamera,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                child: Text(
                  'Galeria',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                onTap: getFromGallery,
              ),
            )
          ],
        ),
      ),
    );
  }
}
