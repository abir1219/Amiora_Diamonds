import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String url;
  WebSocketChannel? _channel;

  Function(String)? onMessage;
  Function()? onConnected;
  Function()? onDisconnected;

  WebSocketService({required this.url});

  bool get isConnected => _channel != null;

  bool connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      print("✅ WebSocket connected");

      _channel!.stream.listen(
            (message) {
          onMessage?.call(message);
        },
        onDone: () {
          print("⚠️ WebSocket closed");
          _channel = null;
          onDisconnected?.call();
        },
        onError: (error) {
          print("❌ WebSocket error: $error");
          _channel = null;
          onDisconnected?.call();
        },
      );

      onConnected?.call();
      return true;
    } catch (e) {
      print("❌ WebSocket connection failed: $e");
      return false;
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
    print("🔌 WebSocket disconnected");
    onDisconnected?.call();
  }

  void send(String message) {
    if (isConnected) {
      _channel!.sink.add(message);
    } else {
      print("WebSocket is not connected");
    }
  }
}