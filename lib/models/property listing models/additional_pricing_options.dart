import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class AdditionalPricing extends ChangeNotifier{


  final titleController=TextEditingController();
  final priceController=TextEditingController();

  File? iconImage;
  String? fileName;


  Future getImageFromGallery( BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png', 'jpg', 'JPEG', 'JPG', 'PNG'],
    );
    if (result != null) {
      iconImage = File(result.files.single.path!);
      fileName = iconImage!.path.split('/').last;
    }
    notifyListeners();
  }


}

