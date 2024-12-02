import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils ;
  ImagePickerBloc(
      this.imagePickerUtils
      ) : super(const ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
  }

  void _cameraCapture(CameraCapture event , Emitter<ImagePickerStates> emit)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(GalleryPicker event , Emitter<ImagePickerStates> emit)async{
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}