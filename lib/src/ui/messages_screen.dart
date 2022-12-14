import 'package:flutter/material.dart';
import 'package:aicte_upskill_rural_youth/src/styles/app_colors.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late List<MessageModel> messageList;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    messageList = [];
    List.generate(20, (index) {
      messageList.add(MessageModel(
          "https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
          "Vishal",
          "Hi There, Who is this ??",
          "9:30 am",
          index % 2 == 0 ? true : false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Messages",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColors.linkedinBlue,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: messageList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  MessageCard(messageList[index]),
                  index < messageList.length - 1
                      ? Container(
                          margin: EdgeInsets.only(left: 14, right: 14),
                          child: Divider(
                            height: 4,
                            color: AppColors.linkedinDarkGray,
                          ),
                        )
                      : Container()
                ],
              ),
            );
          }),
    );
  }
}

class MessageModel {
  String avatarUrl;
  String name;
  String message;
  String time;
  bool isMessagesUnRead;

  MessageModel(this.avatarUrl, this.name, this.message, this.time,
      this.isMessagesUnRead);
}

class MessageCard extends StatelessWidget {
  final MessageModel messageModel;

  MessageCard(this.messageModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        messageModel.name,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          messageModel.avatarUrl,
          width: 40,
          height: 40,
        ),
      ),
      subtitle: Text(messageModel.message,
          maxLines: 1,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.linkedinBlack,
          )),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "at ${messageModel.time}",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 5),
          messageModel.isMessagesUnRead
              ? Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.linkedinBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "1",
                    style: TextStyle(color: AppColors.white, fontSize: 11),
                  ),
                )
              : SizedBox(
                  height: 10,
                )
        ],
      ),
    );
  }
}
