import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/image_picker/image_picker_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Bloc"),
      ),
      body: Center( // Center the entire body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align content vertically at the center
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
                return state.file == null
                    ? InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                    radius: 70,
                    child: Icon(Icons.camera, size: 70,),
                  ),
                )
                    : Image.file(
                  File(state.file!.path.toString()),
                  height: 200,
                  width: 200,
                );
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
                return state.file == null
                    ? InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(GalleryPicker());
                  },
                  child: const CircleAvatar(
                    radius: 70,
                    child: Icon(Icons.photo_library, size: 70,),
                  ),
                )
                    : Image.file(
                  File(state.file!.path.toString()),
                  height: 200,
                  width: 200,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

