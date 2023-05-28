import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  double scrollPosition = 0.0;
  bool isScrolled = false;
  List<ChatModel> listChat = [];
  Socket socket = io(
    'ws://103.167.136.28:5000',
    OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
  );

  @override
  void initState() {
    scrollController.addListener(scrollListenter);
    connect();
    super.initState();
  }

  void connect() {
    socket.connect();
    socket.on("sendMsgServer", (chat) {
      print(chat);
      setState(() {
        listChat.add(ChatModel.fromJson(chat));
      });
    });
    socket.on("nego", (amount) {
      log(amount['sender']);
      if (amount["sender"] != socket.id) {
        final snackbar = GetSnackBar(
          title: "Nego",
          message: "Amount: ${amount['amount']}",
        );
        Get.showSnackbar(snackbar);
      }
    });
  }

  String dateParser(String sentAt) {
    final DateTime date = DateTime.parse(sentAt);
    final DateFormat timeFormatter = DateFormat.Hm();
    final String formatted = timeFormatter.format(date.toLocal());
    return formatted;
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void scrollListenter() {
    scrollPosition = scrollController.position.pixels;
    if (scrollPosition > 50) {
      setState(() {
        isScrolled = true;
      });
    } else {
      setState(() {
        isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const SizedBox xtraSmallVerticalGap = SizedBox(height: 4);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Group Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  reverse: true,
                  controller: scrollController,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  dragStartBehavior: DragStartBehavior.down,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      for (var chat in listChat) ...[
                        if (chat.sender == socket.id) ...[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width / 1.5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.pink.shade200,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${chat.message}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      xtraSmallVerticalGap,
                                      Text(
                                        dateParser(chat.sentAt!),
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width / 1.5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${chat.message}"),
                                      xtraSmallVerticalGap,
                                      Text(
                                        dateParser(chat.sentAt!),
                                        style: const TextStyle(fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        xtraSmallVerticalGap,
                      ],
                    ],
                  ),
                ),
                if (isScrolled)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: scrollDown,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink.shade100.withOpacity(.5),
                        ),
                        child: Transform.rotate(
                          angle: 1.6,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 16,
                      ),
                      fillColor: Colors.white,
                      hintText: "Pesan",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(48),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.all(
                          Radius.circular(48),
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    // final response =
                    //     await http.get(Uri.parse("http://localhost:1232"));
                    // print(response);
                    if (textEditingController.text != "") {
                      final ChatModel chat = ChatModel(
                          sender: socket.id,
                          message: textEditingController.text,
                          sentAt: DateTime.now().toLocal().toIso8601String());
                      socket.emit("sendMsg", chat.toJson());
                      scrollDown();
                      textEditingController.clear();
                    }
                  },
                  child: const Icon(Icons.send_rounded),
                ),
                TextButton(
                  onPressed: () {
                    print("send");
                    if (textEditingController.text != "") {
                      final nego = {
                        "sender": socket.id,
                        "amount": textEditingController.text,
                      };
                      socket.emit("negotiate", nego);
                      textEditingController.clear();
                    }
                  },
                  child: Text("nego"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
