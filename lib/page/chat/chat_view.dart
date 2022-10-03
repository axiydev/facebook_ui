import 'package:badges/badges.dart';
import 'package:date_format/date_format.dart';
import 'package:facebook_app/model/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
/*
Created by Axmadjon Isaqov on 09:07:31 03.10.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::Chat UI
*/
class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  void sendMessage(
      {required DateTime? date,
      required bool isMyMessage,
      required String? userImage}) {
    final text = _messageController.text;
    if (text.isEmpty) return;
    MessageModel? newMessage = MessageModel(
        message: text.trim(),
        sendAt: date,
        isMyMessage: isMyMessage,
        userImage: userImage);
    _messageList.add(newMessage);
    _messageController.clear();
    setState(() {});
  }

  final List<MessageModel?> _messageList = [];
  @override
  void initState() {
    _messageList.addAll([
      MessageModel(
          message: 'Who was that photographer you shared with me recently? ',
          sendAt: DateTime.now(),
          userImage: 'assets/image/user_1.png',
          isMyMessage: false),
      MessageModel(
          message: 'Slim Aarons',
          sendAt: DateTime.now(),
          userImage: 'assets/image/user_1.png',
          isMyMessage: true),
      MessageModel(
          message: 'Who was that photographer you shared with me recently? ',
          sendAt: DateTime.now(),
          userImage: 'assets/image/user_1.png',
          isMyMessage: false),
      MessageModel(
          message: 'Slim Aarons',
          sendAt: DateTime.now(),
          userImage: 'assets/image/user_1.png',
          isMyMessage: true)
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: .5,
        leading: Badge(
          badgeContent: Text(
            '1',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          position: BadgePosition(
            top: 1.h,
            start: 32.w,
          ),
          child: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 30.w,
          ),
        ),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 5.h, end: 4.w),
            badgeColor: const Color(0xff20e070),
            padding: EdgeInsets.all(6.w),
            borderSide: BorderSide(width: 2.w, color: Colors.white),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/image/Oval.png'),
            ),
          ),
          SizedBox(
            width: 8.w,
          )
        ],
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sandra Dorsett',
              style: TextStyle(
                  fontFamily: 'SFPro',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp),
            ),
            Text(
              'seen 1 hour ago',
              style: TextStyle(
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7A7A7A),
                  fontSize: 12.sp),
            )
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            child: ListView.separated(
                padding: EdgeInsets.only(top: 20.h),
                itemCount: _messageList.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                      height: 5.5.h,
                    ),
                itemBuilder: (context, index) {
                  final messageModel = _messageList[index];
                  return MessageWidget(messageModel: messageModel);
                }),
          ),
          Positioned(
              bottom: .0,
              left: .0,
              right: .0,
              child: Container(
                margin: EdgeInsets.zero,
                height: 56.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(top: BorderSide(width: 1, color: Colors.grey))),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            // Transform.rotate(
                            //     angle: pi * .15,
                            //     child: const Icon(Icons.attach_file_rounded)),
                            Padding(
                              padding: EdgeInsets.only(left: 18.w),
                              child: Image.asset(
                                'assets/image/fill.png',
                                width: 14.w,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(8.w, 19.h, .0, 18.h),
                              child: const Icon(
                                Icons.bolt,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 8,
                        child: SizedBox(
                          height: 40.h,
                          width: 248.w,
                          child: CupertinoTextField(
                            controller: _messageController,
                            placeholder: 'Seand a massage',
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.w),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            sendMessage(
                                date: DateTime.now(),
                                isMyMessage: true,
                                userImage: 'assets/image/Oval.png');
                          },
                          icon: const Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.grey,
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class CustomContextMenu extends StatelessWidget {
  final Widget? child;
  const CustomContextMenu({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: const [
        CupertinoContextMenuAction(child: Text('Edit')),
        CupertinoContextMenuAction(child: Text('Delete')),
      ],
      previewBuilder: (context, animation, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: Material(color: Colors.transparent, child: child!),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final MessageModel? messageModel;
  const MessageWidget({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return messageModel!.isMyMessage!
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 250.w,
                child: Card(
                  elevation: .0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w),
                      bottomLeft: Radius.circular(16.w),
                    ),
                    child: GridView.custom(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          const QuiltedGridTile(2, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                        ],
                      ),
                      childrenDelegate: SliverChildListDelegate([
                        Image.asset(
                          'assets/image/story.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/image/user_post.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/image/user_post1.png',
                          fit: BoxFit.cover,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: .0,
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomContextMenu(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            elevation: .0,
                            margin: EdgeInsets.only(left: 8.w),
                            color: Colors.grey.withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.w),
                                topRight: Radius.circular(16.w),
                                bottomLeft: Radius.circular(16.w),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 8.h),
                              child: Text(
                                messageModel!.message ??
                                    'Who was that photographer you shared with me recently? ',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SFPro'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              formatDate(messageModel!.sendAt ?? DateTime.now(),
                                  [HH, ':', nn]),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF7A7A7A),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SFPro'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Card(
            elevation: .0,
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 16.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.w),
                      child: Image.asset(
                        messageModel!.userImage ?? 'assets/image/user_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 9,
                    child: CustomContextMenu(
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: .0,
                              margin: EdgeInsets.only(left: 8.w),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.w),
                                      topRight: Radius.circular(16.w),
                                      bottomRight: Radius.circular(16.w)),
                                  side: BorderSide(
                                      width: 1.w, color: Colors.grey)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                child: Text(
                                  messageModel!.message ??
                                      'Who was that photographer you shared with me recently? ',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SFPro'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                formatDate(
                                    messageModel!.sendAt ?? DateTime.now(),
                                    [HH, ':', nn]),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF7A7A7A),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'SFPro'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          );
  }
}
