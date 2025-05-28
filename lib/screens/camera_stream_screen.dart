import 'package:flutter/material.dart';
import '../services/webrtc_service.dart';

class CameraStreamScreen extends StatefulWidget {
  const CameraStreamScreen({super.key});

  @override
  State<CameraStreamScreen> createState() => _CameraStreamScreenState();
}

class _CameraStreamScreenState extends State<CameraStreamScreen> {
  final WebRTCService _webrtcService = WebRTCService();

  @override
  void initState() {
    super.initState();
    _webrtcService.initConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Transmissão iniciada...'),
      ),
    );
  }
}
