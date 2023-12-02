import 'package:chatting/domain/entities/modelChat.dart';
import 'package:chatting/presentation/modules/chatScreen/widgets/bottomSheet.dart';
import 'package:chatting/presentation/modules/chatScreen/widgets/ownerCardView.dart';
import 'package:chatting/presentation/modules/chatScreen/widgets/replayCardView.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatScreen();
  }
}

class _ChatScreen extends State<ChatScreen> {
  @override
  void initState() {
    _controler = TextEditingController() ; 
    _scrollController = ScrollController() ;  
    super.initState();
  }
  late ScrollController _scrollController ;
  late TextEditingController _controler;
  List<MessageModel> mess = [];
  bool sendButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 186, 180, 159),
        appBar: AppBar(
            centerTitle: false,
            leadingWidth: 70,
            title: InkWell(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Minh Hiếu",
                      style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Last seen today at 12:05",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: "Views Contact",
                        child: Text("Views Contact"),
                      ),
                      const PopupMenuItem(
                        value: "Media, links and docs",
                        child: Text("Media, links and docs"),
                      ),
                      const PopupMenuItem(
                        value: "Whatsapp web",
                        child: Text("Whatsapp webb"),
                      ),
                      const PopupMenuItem(
                        value: "Search",
                        child: Text("Search"),
                      ),
                      const PopupMenuItem(
                        value: "Wallpaper",
                        child: Text("Wallpaper"),
                      ),
                    ];
                  })
            ],
            leading: InkWell(
              onTap: () {
                // Navigator.pop(context);
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ]),
            )),
        body: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                  // controller: _scrollController,
                  // shrinkWrap: true,
                  itemCount: mess.length,
                  itemBuilder: (context, index) {
                    if (index == mess.length) {
                      return const SizedBox(
                        height: 300,
                      );
                    }
                    if (mess[index].type == "source") {
                      return OwnMessageCard(
                        message: mess[index].message,
                      );
                    } else if (mess[index].type == "destination") {
                      return ReplayCard(message: mess[index].message);
                    }
                    return Container();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 65,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: _controler,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    contentPadding: const EdgeInsets.all(5),
                                    prefixIcon: IconButton(
                                      icon: const Icon(Icons.emoji_emotions),
                                      onPressed: () {
                                        setState(() {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "This function is not completed!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.SNACKBAR,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      BottomSheets());
                                            },
                                            icon:
                                                const Icon(Icons.attach_file)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.camera_alt))
                                      ],
                                    )),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, bottom: 8),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 34, 137, 15),
                            child: IconButton(
                                onPressed: () {
                                  if (sendButton) {
                                    _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                    // sendMessage(
                                    //     _controler.text,
                                    //     widget.sourceChat.id,
                                    //     widget.chatModel.id);
                                    _controler.clear();
                                  }
                                },
                                icon: Icon(
                                  sendButton ? Icons.send : Icons.mic,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
