import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lecture_03/myclass.dart';

class Myhomepage extends StatelessWidget {
  const Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  List<Widget> myClasses() {
    //demo data
    List<MyClass> allMyClasses = List.empty(growable: true);
    allMyClasses.add(
      MyClass("2025-2026.1.TIN4583.001", "XML và ứng dụng - Nhóm 1", 58),
    );
    allMyClasses.add(
      MyClass(
        "2025-2026.1.TIN4403.006",
        "Lập trình ứng dụng cho các thiết bị di động - Nhóm 6",
        55,
      ),
    );
    allMyClasses.add(
      MyClass(
        "2025-2026.1.TIN4403.005",
        "Lập trình ứng dụng cho các thiết bị di động - Nhóm 5",
        52,
      ),
    );
    allMyClasses.add(
      MyClass(
        "2025-2026.1.TIN4403.004",
        "Lập trình ứng dụng cho các thiết bị di động - Nhóm 4",
        50,
      ),
    );
    allMyClasses.add(
      MyClass(
        "2025-2026.1.TIN4403.003",
        "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
        52,
      ),
    );

    List<Color> myColors = [
      Colors.lightBlueAccent,
      Colors.redAccent,
      Colors.purpleAccent,
      Colors.yellowAccent,
      Colors.lightGreenAccent,
    ];

    Random r = Random();

    List<Widget> classes = List.empty(growable: true);
    for (MyClass mc in allMyClasses) {
      classes.add(
        ggClass(
          mc.getClassId,
          mc.getClassName,
          mc.getNumberOfStudent,
          myColors[r.nextInt(5)],
        ),
      );
    }
    return classes;
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: myClasses(),
      // children: [
      //   ggClass("2025-2026.1.TIN4583.001", "XML và ứng dụng - Nhóm 1", 58),
      //   ggClass(
      //     "2025-2026.1.TIN4403.006",
      //     "Lập trình ứng dụng cho các thiết bị di động - Nhóm 6",
      //     55,
      //   ),
      //   ggClass(
      //     "2025-2026.1.TIN4403.005",
      //     "Lập trình ứng dụng cho các thiết bị di động - Nhóm 5",
      //     52,
      //   ),
      //   ggClass(
      //     "2025-2026.1.TIN4403.004",
      //     "Lập trình ứng dụng cho các thiết bị di động - Nhóm 4",
      //     50,
      //   ),
      //   ggClass(
      //     "2025-2026.1.TIN4403.003",
      //     "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
      //     52,
      //   ),
      // ],
    );
  }

  Widget ggClass(
    String? classId,
    String? className,
    int? numberOfStudent,
    Color classColor,
  ) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: classColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      className == null ? "Chưa có tên lớp" : className,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      classId == null ? "Chưa có mã lớp" : classId,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Text("$numberOfStudent học viên"),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     print("pressed on button");
          //   },
          //   icon: Icon(Icons.more_horiz),
          // ),
          PopupMenuButton(
            icon: Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Di chuyển")),
              PopupMenuItem(child: Text("Hủy")),
            ],
          ),
        ],
      ),
    );
  }
}
