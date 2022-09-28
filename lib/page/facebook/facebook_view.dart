import 'package:facebook_app/model/story_model.dart';
import 'package:facebook_app/page/facebook/widgets/reels_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FacebookView extends StatefulWidget {
  const FacebookView({super.key});

  @override
  State<FacebookView> createState() => _FacebookViewState();
}

class _FacebookViewState extends State<FacebookView> {
  int? currentIndex = 0;

  final List<Story> _listStory = [
    const Story(
        username: 'User',
        storyPhoto: 'assets/image/avatar.png',
        userPhoto: 'assets/image/avatar.png'),
    const Story(
      username: 'tom',
      storyPhoto: 'assets/image/story.png',
      userPhoto: 'assets/image/user_photo.png',
    ),
    const Story(
      username: 'lisa',
      storyPhoto: 'assets/image/story1.png',
      userPhoto: 'assets/image/user_girl.png',
    ),
    const Story(
        username: 'User',
        storyPhoto: 'assets/image/avatar.png',
        userPhoto: 'assets/image/avatar.png'),
    const Story(
      username: 'tom',
      storyPhoto: 'assets/image/story.png',
      userPhoto: 'assets/image/user_photo.png',
    ),
    const Story(
      username: 'lisa',
      storyPhoto: 'assets/image/story1.png',
      userPhoto: 'assets/image/user_girl.png',
    ),
    const Story(
        username: 'User',
        storyPhoto: 'assets/image/avatar.png',
        userPhoto: 'assets/image/avatar.png'),
    const Story(
      username: 'tom',
      storyPhoto: 'assets/image/story.png',
      userPhoto: 'assets/image/user_photo.png',
    ),
    const Story(
      username: 'tom',
      storyPhoto: 'assets/image/story1.png',
      userPhoto: 'assets/image/user_girl.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: .0,
            title: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      colors: [Color(0xFF384CFF), Color(0xFF00A3FF)])
                  .createShader(bounds),
              child: Text(
                'facebook',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
            ),
            bottom: TabBar(
              onTap: (value) => setState(() {
                currentIndex = value;
              }),
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              labelColor: const Color(0xFF384CFF),
              indicator: const UnderlineTabIndicator(
                  insets: EdgeInsets.symmetric(horizontal: 30),
                  borderSide: BorderSide(width: 5, color: Colors.black)),
              indicatorColor: const Color(0xFF384CFF),
              indicatorWeight: 2.0,
              tabs: [
                Tab(
                  icon: currentIndex == 0
                      ? SvgPicture.asset('assets/svg/home_filled.svg')
                      : SvgPicture.asset('assets/svg/home.svg'),
                ),
                const Tab(
                  icon: Icon(Icons.home),
                ),
                const Tab(
                  icon: Icon(Icons.home),
                ),
                const Tab(
                  icon: Icon(Icons.home),
                ),
                const Tab(
                  icon: Icon(Icons.home),
                ),
                const Tab(
                  icon: Icon(Icons.home),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    //? Sarch Tile
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.asset(
                              'assets/image/avatar.png',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                          SizedBox(
                              width: 230.w,
                              height: 34.h,
                              child: CupertinoTextField(
                                decoration: BoxDecoration(
                                    color:
                                        const Color(0xFFEEEEEE).withOpacity(.5),
                                    borderRadius: BorderRadius.circular(10.w)),
                                placeholder: 'What\'s on your mind?',
                              )),
                          SizedBox(
                            height: 30.w,
                            width: 30.w,
                            child: Card(
                                color: const Color(0xFFEEEEEE).withOpacity(.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: Icon(
                                  Icons.search,
                                  size: 18.w,
                                )),
                          )
                        ],
                      ),
                    ),
                    //? Select Chip

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ReelsWidget(
                              onPress: () {},
                              icon: Icons.video_collection_outlined,
                              color: const Color(0xFFF9C50F),
                              title: 'Reels'),
                          ReelsWidget(
                              onPress: () {},
                              icon: Icons.camera_alt,
                              color: const Color(0xFF44C041),
                              title: 'Room'),
                          ReelsWidget(
                              icon: Icons.people,
                              onPress: () {},
                              color: const Color(0xFFFC6565),
                              title: 'Group'),
                          ReelsWidget(
                              icon: Icons.live_tv_rounded,
                              onPress: () {},
                              color: const Color(0xFF486BE5),
                              title: 'Live'),
                        ],
                      ),
                    ),

                    //?Story Widgets

                    SizedBox(
                      height: 172.5.h,
                      width: 375.w,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: 5.w,
                              ),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _listStory.length,
                          itemBuilder: (context, index) => StoryCardWidget(
                                index: index,
                                story: _listStory[index],
                              )),
                    ),
                    //? post widget

                    for (var i = 0; i <= 10; i++) const PostWidget()
                  ],
                ),
              ),
              Container(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ));
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
            height: 50.w,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: const DecorationImage(
                    image: AssetImage('assets/image/user.png'))),
          ),
          title: const Text('Daven'),
          trailing:
              const RotatedBox(quarterTurns: 1, child: Icon(Icons.more_horiz)),
          subtitle: const Text('1 h .  Mumbai'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: const Text('Old is Gold..!! 👍❤️'),
        ),
        SizedBox(
          height: 5.h,
        ),
        Image.asset(
          'assets/image/car.png',
          fit: BoxFit.cover,
          width: 390.w,
          height: 250.h,
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/like.svg',
                width: 21.w,
              ),
              SizedBox(
                width: 30.w,
              ),
              SvgPicture.asset(
                'assets/svg/comment.svg',
                width: 21.w,
              ),
              SizedBox(
                width: 30.w,
              ),
              SvgPicture.asset(
                'assets/svg/messanger.svg',
                width: 21.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.w,
                child: Stack(
                  children: [
                    Positioned(
                      left: 8.w,
                      top: .0,
                      bottom: .0,
                      child: Container(
                          width: 15.w,
                          height: 15.w,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 10.w,
                          )),
                    ),
                    Container(
                      width: 15.w,
                      height: 15.w,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/like.svg',
                        width: 10.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Liked by Sachin Kamble and 155 others ',
                style: TextStyle(fontSize: 11.sp),
              ),
              Text(
                '4 comments',
                style: TextStyle(fontSize: 11.sp),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class StoryCardWidget extends StatelessWidget {
  final int? index;
  final Story? story;
  const StoryCardWidget({Key? key, required this.index, required this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 172.5.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 90.w,
            height: 130.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.w),
              child: Image.asset(
                story!.storyPhoto,
                width: 90.w,
                height: 130.h,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -12.5.h),
            child: Container(
              height: index == 0 ? 17.w : 25.w,
              width: index == 0 ? 17.w : 25.w,
              padding: EdgeInsets.all(1.5.w),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: index == 0 ? 1.w : 0),
                borderRadius: BorderRadius.circular(index == 0 ? 3.w : 12.5.w),
                gradient: const LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [Color(0xFF384CFF), Color(0xFF00A3FF)]),
              ),
              child: index == 0
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14.w,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(story!.userPhoto))),
                    ),
            ),
          ),

          //? Username
          if (index != 0)
            Flexible(
                child: Transform.translate(
              offset: Offset(0, -12.5.h),
              child: Text(
                story!.username,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
            ))
        ],
      ),
    );
  }
}
