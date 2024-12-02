part of 'image_picker_bloc.dart';

class ImagePickerStates extends Equatable {
  final XFile? file;

  const ImagePickerStates({this.file});

  ImagePickerStates copyWith({XFile? file}) {
    return ImagePickerStates(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
