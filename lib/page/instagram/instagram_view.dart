import 'dart:developer';

import 'package:facebook_app/model/post_model.dart';
import 'package:facebook_app/model/story_insta_model.dart';
import 'package:facebook_app/page/instagram/widget/indcator_item.dart';
import 'package:facebook_app/page/instagram/widget/story_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({super.key});

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {
  late final List<StoryInstaModel?> _users = [];
  late final List<PostModel?> _posts = [];
  @override
  void initState() {
    _users.addAll([
      const StoryInstaModel(
          image: 'assets/image/user_i.png', username: 'Zack Jordan'),
      const StoryInstaModel(
          image: 'assets/image/user_i1.png', username: 'Zack Jordan'),
      const StoryInstaModel(
          image: 'assets/image/user_i2.png', username: 'Karenne'),
      const StoryInstaModel(
          image: 'assets/image/user_i3.png', username: 'Zack Jordan'),
      const StoryInstaModel(
          image: 'assets/image/user_i.png', username: 'Zack Jordan'),
      const StoryInstaModel(
          image: 'assets/image/user_i1.png', username: 'Zack Jordan'),
      const StoryInstaModel(
          image: 'assets/image/user_i2.png', username: 'Karenne'),
      const StoryInstaModel(
          image: 'assets/image/user_i3.png', username: 'Zack Jordan'),
    ]);

    _posts.addAll([
      for (var i = 0; i < 7; i++)
        PostModel(
            userImage: "assets/image/Oval.png",
            isVIP: i.isEven ? true : false,
            comment:
                'joshua_l The game in Japan was amazing and I want to share some photos',
            datetime: 'September 29',
            imageList: [
              'assets/image/user_post.png',
              'assets/image/user_post1.png',
              'assets/image/user_post2.png',
              'assets/image/user_post.png',
              'assets/image/user_post1.png',
              'assets/image/user_post2.png',
            ],
            location: 'Tokyo Japan',
            username: 'Joshua $i'),
    ]);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .0,
        leading: Icon(
          Icons.camera_alt_outlined,
          color: Colors.black,
          size: 24.w,
        ),
        title: Text(
          'Instagram',
          style: TextStyle(
              color: Colors.black,
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Billabong'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/image/message.png',
                width: 25.w,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          /// Stories [List]
          SizedBox(
            height: 100.h,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                shrinkWrap: true,
                itemCount: _users.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: 20.w,
                    ),
                itemBuilder: (context, index) => StoryInstaWidget(
                      story: _users[index],
                    )),
          ),

          /// Posts [List]
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final PostModel? post = _posts[index];
                int? counter = 1;
                return StatefulBuilder(builder: (context, setStateLocal) {
                  return Card(
                    elevation: .0,
                    margin: EdgeInsets.zero,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                              post!.userImage,
                            ),
                            radius: 16.w,
                          ),
                          horizontalTitleGap: 10.w,
                          minVerticalPadding: 20.h,
                          trailing: const Icon(Icons.more_horiz_outlined),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                post.username,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              post.isVIP
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 13.w,
                                      color: Colors.blue,
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                          dense: true,
                          subtitle: Text(
                            'Tokyo, Japan',
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 375.h,
                          child: Stack(
                            children: [
                              PageView.builder(
                                itemCount: post.imageList.length,
                                onPageChanged: (newIndex) {
                                  log(newIndex.toString());
                                  setStateLocal(
                                    () {
                                      counter = newIndex + 1;
                                      log(counter.toString());
                                    },
                                  );
                                },
                                itemBuilder: (context, index) {
                                  final String image = post.imageList[index];
                                  return Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              Positioned(
                                top: 14.h,
                                right: 14.w,
                                child: Card(
                                  color:
                                      const Color(0xFF121212).withOpacity(.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(13.w)),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0.w),
                                    child: Text(
                                      '$counter/${post.imageList.length}',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: .0,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        size: 23.w,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Icon(
                                        CupertinoIcons.chat_bubble,
                                        size: 23.w,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Image.asset(
                                        'assets/image/message.png',
                                        width: 23.w,
                                      ),
                                      SizedBox(
                                        width: 60.w,
                                      ),
                                      Card(
                                          elevation: .0,
                                          child: SizedBox(
                                            height: 6.w,
                                            width: 6.w * post.imageList.length +
                                                4.w *
                                                    (post.imageList.length - 1),
                                            child: ListView.separated(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) =>
                                                    IndicatorItem(
                                                        isSelected: counter! ==
                                                            index + 1),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                itemCount:
                                                    post.imageList.length),
                                          )),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.bookmark_border)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              post.comment,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  post.datetime,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400),
                                )))
                      ],
                    ),
                  );
                });
              })
        ]),
      ),
    );
  }
}
