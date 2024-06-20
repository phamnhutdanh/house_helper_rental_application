import 'package:flutter/material.dart';

class FavoriteEmployeeItem extends StatelessWidget {
  final String imageUri;
  final String name;
  final String email;
  
  const FavoriteEmployeeItem({
    super.key,
    required this.imageUri,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(imageUri),
                  )),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  const Text('rating',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(email,
              // softWrap: true,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey[600],
              )),
        ],
      ),
    );
  }
}


// Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xffeeeeee)),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: MaterialButton(
//                   elevation: 0,
//                   color:
//                       user.isFollowedByMe ? Color(0xffeeeeee) : Color(0xffffff),
//                   onPressed: () {
//                     setState(() {
//                       user.isFollowedByMe = !user.isFollowedByMe;
//                     });
//                   },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
//                       style: TextStyle(color: Colors.black)),
//                 ),
//               ),

