import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:students_app/MainPage/Dio_helper.dart';
import 'package:flutter/material.dart';

class chatGPT extends StatefulWidget {
  const chatGPT({super.key});

  @override
  State<chatGPT> createState() => _HomePageState();
}

class _HomePageState extends State<chatGPT> {
  TextEditingController chatTextEditing = TextEditingController();
  List<String> chat = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff343641),
        appBar: AppBar(
          title: const Text(
            "ChatGPT",
            style: TextStyle(color: Colors.white70, fontSize: 25),
          ),
          backgroundColor: Color(0xff404150),
          elevation: 2,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            leading: const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white54,
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.black,
                              ),
                            ),
                            title: AnimatedTextKit(animatedTexts: [
                              TypewriterAnimatedText(chat[index])
                            ])),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: Colors.grey,
                            child: ListTile(
                                leading: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white54,
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.black,
                                  ),
                                ),
                                title: AnimatedTextKit(animatedTexts: [
                                  TypewriterAnimatedText(chat[index])
                                ]))),
                      );
                    }
                  },
                  itemCount: chat.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  color: const Color(0xff404150),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: chatTextEditing,
                        style: const TextStyle(color: Colors.white60),
                        decoration: InputDecoration.collapsed(
                            hintText: "send a message.",
                            hintStyle: TextStyle(color: Colors.white70)),
                      )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              chat.add(chatTextEditing.text);
                              sendToChatGpt();
                            });
                            setState(() {
                              chatTextEditing.clear();
                            });
                          },
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  sendToChatGpt() {
    DioHelper.postData(url: "completions", data: {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": "${chatTextEditing.text}"}
      ],
      // "temperature": 0,
      // "max_tokens": 500
    }).then((value) {
      print(value.data);
    });
  }
}
