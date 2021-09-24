import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImagePickPageController extends GetxController {
  final _imageFilePath = "".obs;
  set imageFilePath(value) => this._imageFilePath.value = value;
  get imageFilePath => this._imageFilePath.value;

  @override
  void onInit() {
    super.onInit();
  }

  getImage(ImageSource source) async {
    final _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      // imageFilePath = pickedFile.path;
      // print(imageFilePath);
      imageFilePath = await cropImage(pickedFile.path);
      GallerySaver.saveImage(imageFilePath);
    } 
  }

  Future cropImage(String pickedFilePath) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: pickedFilePath,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.original,
                //CropAspectRatioPreset.ratio4x3,
                //CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                //CropAspectRatioPreset.ratio4x3,
                //CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(title: 'Cropper'));
    if (croppedFile != null) {
      return croppedFile.path;
    } else {
      return null;
    }
  }
}
