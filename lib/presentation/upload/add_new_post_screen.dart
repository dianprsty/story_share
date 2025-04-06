import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constant/general_state.dart';
import '../../core/extension/build_context_extension.dart';
import '../../core/route/go_router_config.dart';
import '../../domain/usecase/upload_post/upload_post_param.dart';
import '../home/bloc/post_list_bloc.dart';
import '../shared/widget/custom_button.dart';
import 'bloc/upload_bloc.dart';

class AddNewPostScreen extends StatefulWidget {
  const AddNewPostScreen({super.key});

  @override
  State<AddNewPostScreen> createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  File? _selectedImage;
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null && mounted) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  Future<void> _uploadPost(BuildContext context) async {
    if (_selectedImage == null || _descriptionController.text.isEmpty) {
      context.showSnackBar(
        'Please select an image and add a description.',
        success: false,
      );
      return;
    }

    UploadPostParam data = UploadPostParam(
      image: _selectedImage!,
      description: _descriptionController.text,
    );

    context.read<UploadBloc>().add(UploadEvent.upload(data));
  }

  Future<void> _openCamera() async {
    final image = await context.pushNamed<File?>(AppRoute.camera.name);
    if (image != null) {
      setState(() => _selectedImage = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Upload Post')),
      body: BlocConsumer<UploadBloc, UploadState>(
        listener: (context, state) {
          if (state.status == GeneralState.success) {
            context.read<PostListBloc>().add(PostListEvent.getPosts());
            context.goNamed(AppRoute.home.name);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (_selectedImage != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _selectedImage!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      child: const Center(child: Text('Choose an image')),
                    ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _openCamera,
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Kamera'),
                      ),
                      ElevatedButton.icon(
                        onPressed: _pickFromGallery,
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Galeri'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: _descriptionController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    minLines: 4,
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Deskripsi',
                      hintText: 'Masukkan deskripsi',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    isLoading: state.status == GeneralState.loading,
                    onPressed: () => _uploadPost(context),
                    text: 'Upload',
                    buttonType: ButtonType.primary,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
