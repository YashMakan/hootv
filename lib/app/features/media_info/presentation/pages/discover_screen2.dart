// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:hootv/app/features/discover/presentation/components/media_vertical_card.dart';
// import 'package:hootv/app/features/discover/presentation/components/discover_screen_app_bar.dart';
// import 'package:hootv/app/features/discover/presentation/components/story_view.dart';
// import 'package:hootv/app/features/discover/presentation/components/update.dart';
// import 'package:hootv/app/shared/components/section_heading_widget.dart';
// import 'package:hootv/app/shared/config/assets/asset.dart';
// import 'package:hootv/app/shared/core/models/movie_entity.dart';
// import 'package:hootv/app/shared/core/models/story.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class DiscoverScreen extends StatefulWidget {
//   const DiscoverScreen({super.key});
//
//   @override
//   State<DiscoverScreen> createState() => _DiscoverScreenState();
// }
//
// class _DiscoverScreenState extends State<DiscoverScreen> {
//   ScrollController discoverScrollController = ScrollController();
//   List<Story> stories = [
//     Story(image: Assets.dummy.s1, userName: "xxcasey", id: "0", userId: ""),
//     Story(image: Assets.dummy.s2, userName: "Jetra", id: "1", userId: ""),
//     Story(image: Assets.dummy.s3, userName: "Ade 👑", id: "2", userId: ""),
//     Story(image: Assets.dummy.s4, userName: "Masego", id: "3", userId: ""),
//   ];
//   List<Movie> updates = [
//     Movie(
//         image: Assets.dummy.u1,
//         title: "Wedding bells",
//         id: "0",
//         duration: const Duration(minutes: 14)),
//     Movie(
//         image: Assets.dummy.u2,
//         title: "Nalatravels  👑",
//         id: "1",
//         duration: const Duration(hours: 1)),
//     Movie(
//         image: Assets.dummy.u3,
//         title: "Africa's biggest ",
//         id: "2",
//         duration: const Duration(hours: 4)),
//     Movie(
//         image: Assets.dummy.u4,
//         title: "Nala Travel",
//         id: "3",
//         duration: const Duration(hours: 8)),
//   ];
//   List<Movie> medias = [
//     Movie(image: Assets.dummy.db1, title: "BIBI: MY LIFE", id: "0"),
//     Movie(image: Assets.dummy.db2, title: "Come UP", id: "1"),
//     Movie(image: Assets.dummy.db3, title: "🤑Asat", id: "0"),
//     Movie(image: Assets.dummy.db4, title: "Lorem", id: "1"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0D0D0D),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             width: 60.w,
//             height: 200,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: const Alignment(0.0, 0.0),
//                 end: const Alignment(0.0, 1.0),
//                 colors: [
//                   const Color(0xFF2A0552).withOpacity(0.7),
//                   const Color(0x00000000),
//                 ],
//                 stops: const [0.0, 0.5],
//               ),
//             ),
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
//             child: Container(color: Colors.transparent),
//           ),
//           SafeArea(
//             child: SingleChildScrollView(
//               controller: discoverScrollController,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   const DiscoverScreenAppBar(),
//                   const SizedBox(height: 20),
//                   SectionHeadingWidget(
//                       title: "Stories",
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: List.generate(
//                                 stories.length,
//                                 (index) => Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 16.0),
//                                       child: StoryView(story: stories[index]),
//                                     )),
//                           ),
//                         ),
//                       )),
//                   const SizedBox(height: 20),
//                   SectionHeadingWidget(
//                       title: "Updates",
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 6),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: List.generate(updates.length,
//                                 (index) => Update(media: updates[index])),
//                           ),
//                         ),
//                       )),
//                   const SizedBox(height: 20),
//                   SectionHeadingWidget(
//                       title: "Discover",
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 6),
//                         child: GridView.builder(
//                             itemCount: medias.length,
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     crossAxisSpacing: 0,
//                                     mainAxisSpacing: 8,
//                                     childAspectRatio: .7),
//                             itemBuilder: (context, index) =>
//                                 Discover(media: medias[index])),
//                       )),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
