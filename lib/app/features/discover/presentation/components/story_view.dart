// import 'package:flutter/material.dart';
// import 'package:hootv/app/shared/config/constants/colors.dart';
// import 'package:hootv/app/shared/config/theme/theme.dart';
// import 'package:hootv/app/shared/core/models/story.dart';
//
// class StoryView extends StatelessWidget {
//   final Story story;
//
//   const StoryView({super.key, required this.story});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Stack(
//           children: [
//             CircleAvatar(
//               backgroundColor: CustomColors.primary,
//               radius: 40,
//               child: Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(story.image),
//                   radius: 40,
//                 ),
//               ),
//             ),
//             if (story.id == "3")
//               SizedBox(
//                 width: 80,
//                 height: 80,
//                 child: Align(
//                   alignment: const Alignment(0, 2.5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: CustomColors.primary,
//                             foregroundColor: Colors.black,
//                             minimumSize: const Size(22, 22),
//                             fixedSize: const Size(22, 22),
//                             padding: EdgeInsets.zero),
//                         child: const Icon(Icons.add, size: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//           ],
//         ),
//         const SizedBox(height: 8),
//         Text(
//           story.userName,
//           style: context.titleSmall?.copyWith(color: Colors.white),
//         )
//       ],
//     );
//   }
// }
