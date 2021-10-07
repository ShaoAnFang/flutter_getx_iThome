import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'dart:core';
import 'dart:typed_data';

class SocketIOPageController extends GetxController {
  final textEditingController = TextEditingController();

  late IO.Socket socket;

  final _isOnConnect = false.obs;
  set isOnConnect(value) => this._isOnConnect.value = value;
  get isOnConnect => this._isOnConnect.value;

  final _message = ''.obs;
  set message(value) => this._message.value = value;
  get message => this._message.value;

  final _room = 'a'.obs;
  set room(value) => this._room.value = value;
  get room => this._room.value;

  final _userName = 'Flutter_client'.obs;
  set userName(value) => this._userName.value = value;
  get userName => this._userName.value;

  final _messageList = <String>[].obs;
  get messageList => _messageList.toList();

  RTCPeerConnection? _peerConnection;
  bool _inCalling = false;

  RTCDataChannelInit? _dataChannelDict;
  RTCDataChannel? _dataChannel;

  String _sdp = '';

  @override
  onInit() {
    connectSokcetIO();
    super.onInit();
  }

  connectSokcetIO() {
    socket = IO.io('ws://192.168.2.76:8090', <String, dynamic>{
      'transports': ['websocket']
    });

    socket.onConnect((_) {
      print('on connect');
      // socket.emit('msg', 'test');
      isOnConnect = true;
      socket.on('joined', (data) {
        print('joined');
        //room, id
        print(data.runtimeType);
        print(data);
      });
    });

    socket.on('message', (data) {
      print('message: ${data[1]}');
      // print(data.runtimeType);
      // print(data);

      final messageContent = data[1];
      _messageList.add(messageContent);
    });

    socket.onDisconnect((data) {
      print('disconnect');
      print(data);
    });

    socket.onConnectError((data) {
      print(data);
    });

    socket.emit('join', room);
  }

  sendMessage() {
    final sendData = userName + ':' + textEditingController.text;
    socket.emit('message', [room, sendData]);
    textEditingController.text = '';
  }

  _onSignalingState(RTCSignalingState state) {
    print(state);
  }

  _onIceGatheringState(RTCIceGatheringState state) {
    print(state);
  }

  _onIceConnectionState(RTCIceConnectionState state) {
    print(state);
  }

  _onCandidate(RTCIceCandidate candidate) {
    print('onCandidate: ${candidate.candidate}');
    _peerConnection?.addCandidate(candidate);
    // setState(() {
    _sdp += '\n';
    _sdp += candidate.candidate ?? '';
    print('onCandidate: update sdp');
    print(_sdp);
    // });
  }

  _onRenegotiationNeeded() {
    print('RenegotiationNeeded');
  }

  /// Send some sample messages and handle incoming messages.
  _onDataChannel(RTCDataChannel dataChannel) {
    dataChannel.onMessage = (message) {
      if (message.type == MessageType.text) {
        print(message.text);
      } else {
        // do something with message.binary
      }
    };
    // or alternatively:
    dataChannel.messageStream.listen((message) {
      if (message.type == MessageType.text) {
        print(message.text);
      } else {
        // do something with message.binary
      }
    });

    dataChannel.send(RTCDataChannelMessage('Hello!'));
    dataChannel.send(RTCDataChannelMessage.fromBinary(Uint8List(5)));
  }

  void makeCall() async {
    var configuration = <String, dynamic>{
      'iceServers': [
        {'url': 'stun:stun.l.google.com:19302'},
      ]
    };

    final offerSdpConstraints = <String, dynamic>{
      'mandatory': {
        'OfferToReceiveAudio': false,
        'OfferToReceiveVideo': false,
      },
      'optional': [],
    };

    final loopbackConstraints = <String, dynamic>{
      'mandatory': {},
      'optional': [
        {'DtlsSrtpKeyAgreement': true},
      ],
    };

    if (_peerConnection != null) return;

    try {
      _peerConnection =
          await createPeerConnection(configuration, loopbackConstraints);

      _peerConnection?.onSignalingState = _onSignalingState;
      _peerConnection?.onIceGatheringState = _onIceGatheringState;
      _peerConnection?.onIceConnectionState = _onIceConnectionState;
      // _peerConnection?.onIceCandidate = _onCandidate;
      _peerConnection?.onRenegotiationNeeded = _onRenegotiationNeeded;

      _dataChannelDict = RTCDataChannelInit();
      _dataChannelDict?.id = 1;
      _dataChannelDict?.ordered = true;
      _dataChannelDict?.maxRetransmitTime = -1;
      _dataChannelDict?.maxRetransmits = -1;
      _dataChannelDict?.protocol = 'sctp';
      _dataChannelDict?.negotiated = false;

      _dataChannel = await _peerConnection!
          .createDataChannel('dataChannel', _dataChannelDict!);
      _peerConnection?.onDataChannel = _onDataChannel;

      var description = await _peerConnection!.createOffer(offerSdpConstraints);
      print(description.sdp);
      //設定本地的SDP
      await _peerConnection?.setLocalDescription(description);

      _sdp = description.sdp ?? '';
      // print("sdp:");
      // print(_sdp);

      /* 
      "v=0
      o=- 7952352823390211101 2 IN IP4 127.0.0.1
      s=-
      t=0 0
      a=group:BUNDLE data
      a=extmap-allow-mixed
      a=msid-semantic: WMS
      m=application 9 UDP/DTLS/SCTP webrtc-datachannel
      c=IN IP4 0.0.0.0
      a=ice-ufrag:fEwz
      a=ice-pwd:jpAbq2rex2K3J4wvoGAjK23D
      a=ice-options:trickle renomination
      a=fingerprint:sha-256 A4:9C:7B:0C:D4:84:CE:1B:48:2C:5F:0D:63:88:4B:B5:C7:B0:43:E9:3F:20:13:5F:D8:AB:38:1D:FC:AD:EE:DF
      a=setup:actpass
      a=mid:data
      a=sctp-port:5000
      a=max-message-size:262144
      "
      */

      //change for loopback.
      //description.type = 'answer';
      //_peerConnection.setRemoteDescription(description);
    } catch (e) {
      print(e.toString());
    }
    // if (!mounted) return;

    // setState(() {
    //   _inCalling = true;
    // });
  }
}
