import 'package:flutter/material.dart';
import 'package:aicte_upskill_rural_youth/src/styles/app_colors.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late List<NewsFeedModel> newsFeedList;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    newsFeedList = [];
    List.generate(30, (index) {
      newsFeedList.add(NewsFeedModel(
          "Ashish Rawat",
          "https://www.keela.co/wp-content/uploads/Roundedheadshots-37984972-1920w.png",
          "Android App Developer",
          "This is a demo description but we will add some",
          "https://media.gettyimages.com/id/1429909210/photo/an-asian-woman-working-with-laptop-in-a-natural-modern-office.jpg?s=612x612&w=0&k=20&c=KHQgZ-2kNg7tzs6nNV8LZBu6p-dODLhGDFclL7trs3M=",
          "344",
          "25"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.linkedinLightGray,
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_comment,
              color: AppColors.linkedinBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColors.linkedinBlue,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 5),
        child: ListView.builder(
            itemCount: newsFeedList.length,
            itemBuilder: (context, index) {
              return NewFeedCard(newsFeedList[index]);
            }),
      ),
    );
  }
}

class NewsFeedModel {
  String name;
  String avatarUrl;
  String designation;
  String description;
  String imageUrl;
  String likes;
  String comments;

  NewsFeedModel(this.name, this.avatarUrl, this.designation, this.description,
      this.imageUrl, this.likes, this.comments);
}

class NewFeedCard extends StatelessWidget {
  NewsFeedModel newsFeedModel;

  NewFeedCard(this.newsFeedModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            enabled: true,
            title: Text(
              newsFeedModel.name,
              style: TextStyle(
                  color: AppColors.linkedinBlack, fontWeight: FontWeight.w500),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                newsFeedModel.avatarUrl,
                height: 40,
                width: 40,
              ),
            ),
            subtitle: Text(
              newsFeedModel.designation,
              style: TextStyle(color: AppColors.linkedinBlue),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: AppColors.linkedinBlue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsFeedModel.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Image.network(newsFeedModel.imageUrl),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "${newsFeedModel.likes} likes",
                      style: TextStyle(color: AppColors.linkedinDarkGray),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "${newsFeedModel.comments} comments",
                      style: TextStyle(color: AppColors.linkedinDarkGray),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_rounded)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
