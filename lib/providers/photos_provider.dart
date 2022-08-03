import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotosProvider extends ChangeNotifier{

  List <XFile>? selectedImages;
  List<XFile>? imagesList=[];

  final imagePicker=ImagePicker();

  Future selectImages()async{
   selectedImages= await imagePicker.pickMultiImage();
  if(selectedImages!.isNotEmpty)
    {
      imagesList!.addAll(selectedImages!);
    }
  notifyListeners();
  }

void clearAll(){
    imagesList!.clear();
    notifyListeners();
}

void deleteImage(int index){
    imagesList!.remove(imagesList![index]);
    notifyListeners();
}


}