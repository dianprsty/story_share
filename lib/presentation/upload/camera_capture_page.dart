import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';

import '../shared/widget/wavy_loading_indicator.dart';

class CameraCapturePage extends StatefulWidget {
  const CameraCapturePage({super.key});

  @override
  State<CameraCapturePage> createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCapturePage> {
  late List<CameraDescription> _cameras;
  CameraController? _controller;
  int _selectedCameraIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _lockOrientationToLandscape();
    _initCamera();
  }

  void _lockOrientationToLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _unlockOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _startCamera(_selectedCameraIndex);
  }

  Future<void> _startCamera(int cameraIndex) async {
    final camera = _cameras[cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await _controller?.initialize();
    } catch (e) {
      return;
    }

  
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _switchCamera() async {
    setState(() {
      _isLoading = true;
    });
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
    await _startCamera(_selectedCameraIndex);
  }

  void _captureImage() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    final picture = await _controller!.takePicture();
    if (!mounted) return;

    context.pop(File(picture.path));
  }

  @override
  void dispose() {
    _controller?.dispose();
    _unlockOrientation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? const Center(child: WavyLoadingIndicator())
              : Stack(
                fit: StackFit.expand,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CameraPreview(_controller!),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: FloatingActionButton(
                      heroTag: 'switch',
                      onPressed: _switchCamera,
                      child: const Icon(Icons.switch_camera),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      heroTag: 'capture',
                      onPressed: _captureImage,
                      child: const Icon(Icons.camera),
                    ),
                  ),
                ],
              ),
    );
  }
}
