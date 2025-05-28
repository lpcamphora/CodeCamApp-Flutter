
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCService {
  RTCPeerConnection? _peerConnection;

  Future<void> initConnection() async {
    final config = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ]
    };
    _peerConnection = await createPeerConnection(config);

    final mediaStream = await navigator.mediaDevices.getUserMedia({'video': true});
    mediaStream.getTracks().forEach((track) {
      _peerConnection?.addTrack(track, mediaStream);
    });
  }
}
