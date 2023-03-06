
import 'package:flutter/material.dart';
import 'home_page.dart';

List names = [
  'ijasahmed',
  'Fawas',
  'Unais TH',
  'Devak',
  'Femin',
  'Siddique',
  'Hijas Mkz',
  'Nessi Broto',
  'Shiffi',
  'vaishnav pppc',
  'Liyah',
  'Nithu',
  'Ribin',
  'Abijith brocamp',
  'danush'
];

List imagesdp = [
  "images/sn9.webp",
  "images/sn4.webp",
  "images/sn5.webp",
  "images/sn6.webp",
  "images/sn7.webp",
  "images/sn8.webp",
  "images/sn2.webp",
  "images/sn10.webp",
  "images/sn11.webp",
  "images/sn12.webp",
  "images/sn13.webp",
  "images/sn3.webp",
  "images/sn14.webp",
  "images/sn15.webp",
];

class ChatContents extends StatelessWidget {
  const ChatContents({super.key});

  @override
  Widget build(BuildContext context) {
    return (ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              
              // =========== Profiles ========= //
              leading: index % 2 == 1
                  ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.red,
                        child: Image.asset(imagesdp[index]),
                      ),
                  )
                  : Container(
                    width: 60,
                        color: Colors.black,
                          child: Image.asset(imagesdp[index]),
                        
                      
                      ),
                

              // ========== body text ========= //
              title: Text(names[index]),
              subtitle: Row(
                children: [
                index%4==2? const Icon(Icons.done_rounded,color: Colors.blue,):
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border:
                          Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin:const  EdgeInsets.only(right: 5),
                  ),
                     index%4==2?Text((delivered[index]),style:const TextStyle(color: Colors.blue),
                  ):
                  Text(
                   newsnap[index],
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),

              // ========== Right side of chat ========= //

              trailing: Icon(
                Icons.mode_comment_outlined,
                color: Colors.grey[400],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 14)
      
    );
  }
}