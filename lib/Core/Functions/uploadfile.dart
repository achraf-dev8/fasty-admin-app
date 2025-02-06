
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera()async{
  final XFile? result = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 90);

    if(result != null){
    return File(result.path);
  }
  return null;
}

  Future<File?> fileUpload() async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom, allowedExtensions: ["svg", "SVG", "png", "PNG", "jpg", "jpeg"]
  );
  if(result != null){
    return File(result.files.single.path!);
  }
  return null;
}