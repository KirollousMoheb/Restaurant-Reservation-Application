import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_signup_screen/admin_profile.dart';
import 'package:login_signup_screen/admin_reservation.dart';
int index=0;
// List<String> username = [
//   "verver210",
//   "kirollos5",
//   "philo2",
//   "soso3",
//   "dondon8",
//   "ashraf7",
//   "medhat2",
//   "engy5",
//   "sedra14",
//   "alber15"
// ];
// List<String> date = [
//   "3/5/2022",
//   "4/6/2022",
//   "9/5/2022",
//   "6/12/2022",
//   "7/4/2022",
//   "3/4/2022",
//   "9/4/2022",
//   "2/10/2022",
//   "7/8/2022",
//   "8/6/2022"
// ];
// List<String> time = [
//   "10:30 pm",
//   "9:15 pm",
//   "8:12 pm",
//   "6:17 am",
//   "7:15 am",
//   "8:16 pm",
//   "7:18 pm",
//   "9:12 pm",
//   "1:30 pm",
//   "2:30 pm"
// ];
// List<String> persons = ["4", "6", "2", "1", "7", "2", "3", "5", "7", "2"];

List<String> username = ["", "", "", "", "", "", "", "", "", ""];
List<String> date = ["", "", "", "", "", "", "", "", "", ""];
List<String> time = ["", "", "", "", "", "", "", "", "", ""];
List<String> persons = ["", "", "", "", "", "", "", "", "", ""];

class ReservationCard extends StatelessWidget {
  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();
  final TextEditingController txt3 = TextEditingController();
  final TextEditingController txt4 = TextEditingController();
  ReservationCard(
      {Key? key,
      required String username,
      required String date,
      required String time,
      required String persons})
      : super(key: key) {
    txt1.text = username;
    txt2.text = date;
    txt3.text = time;
    txt4.text = persons;
    // print(txt1.text);
    // print(txt2.text);
    // print(txt3.text);
    // print(txt4.text);
  }

  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Username: ',
                  style: TextStyle(
                    fontSize: 0.00005 * width_ * height_,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 0.18 * width_,
                  height: 0.035 * height_,
                  color: Colors.white,
                  child: TextField(
                    maxLines: 2,
                    controller: txt1,
                    enabled: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.000046 * width_ * height_,
                    ),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[600]!))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.011 * height_),
            Row(
              children: [
                Text(
                  'Date: ',
                  style: TextStyle(
                    fontSize: 0.00005 * width_ * height_,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 0.23 * width_,
                  height: 0.035 * height_,
                  color: Colors.white,
                  child: TextField(
                    maxLines: 2,
                    controller: txt2,
                    enabled: false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[600]!))),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.000048 * width_ * height_,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.011 * height_),
            Row(
              children: [
                Text(
                  'Time: ',
                  style: TextStyle(
                    fontSize: 0.00005 * width_ * height_,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 0.23 * width_,
                  height: 0.035 * height_,
                  color: Colors.white,
                  child: TextField(
                    maxLines: 2,
                    controller: txt3,
                    enabled: false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[600]!))),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.000048 * width_ * height_,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.011 * height_),
            Row(
              children: [
                Text(
                  'No. Of Persons: ',
                  style: TextStyle(
                    fontSize: 0.00005 * width_ * height_,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 0.08 * width_,
                  height: 0.035 * height_,
                  color: Colors.white,
                  child: TextField(
                    controller: txt4,
                    maxLines: 2,
                    enabled: false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[600]!))),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.000048 * width_ * height_,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReservationList extends StatefulWidget {
  ReservationList({Key? key}) : super(key: key) {
    getMarkers();
  }
  Future<void>  getMarkers() async {
    CollectionReference productsRef =
       FirebaseFirestore.instance.collection('ReservationData');

    final snapshot = await productsRef.get();

    List<Map<String, dynamic>> listOfDocuments =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    for (int i = 0; i < listOfDocuments.length; i++) {
      username[i] = listOfDocuments[i]['username'];
      date[i] = listOfDocuments[i]['date'];
      time[i] = listOfDocuments[i]['time'];
      persons[i] = listOfDocuments[i]['persons'];
    }

    // for (int i = 0; i < list_of_documents.length; i++) {
    //    print(username[i]);
    //   print(date[i]);
    //   print(time[i]);
    //   print(persons[i]);
    // }
    
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReservationList> {
  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            
            onTap: (index){
              if (index==0){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  ReservationList(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
              if(index==1){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const AdminReserveScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
              if(index==2){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => AdminProfilePage(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );

              }

          },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Reservations',
          ),

          BottomNavigationBarItem (
            icon: Icon(Icons.table_bar),
            label: 'Book Table',
            
          ),
          BottomNavigationBarItem (
            icon: Icon(Icons.person),
            label: 'Profile',
            
          ),
          
        ],
              currentIndex: index,
      ),
        backgroundColor: Colors.black,
        appBar: AppBar(
                actions: <Widget>[

        IconButton(
          icon:const Icon(Icons.refresh),
          tooltip: "Save Todo and Retrun to List",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ReservationList()));

          },
        )
      ],
          title: Text(
            "Reservation List",
            style: TextStyle(
                fontSize: 0.00006 * height_ * width_,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  margin: const EdgeInsets.all(1.5),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0008 * height_,
                      mainAxisSpacing: 0.0008 * width_,
                    ),
                    children: [
                      ReservationCard(
                          username: username[0],
                          date: date[0],
                          time: time[0],
                          persons: persons[0]),
                      ReservationCard(
                          username: username[1],
                          date: date[1],
                          time: time[1],
                          persons: persons[1]),
                      ReservationCard(
                          username: username[2],
                          date: date[2],
                          time: time[2],
                          persons: persons[2]),
                      ReservationCard(
                          username: username[3],
                          date: date[3],
                          time: time[3],
                          persons: persons[3]),
                      ReservationCard(
                          username: username[4],
                          date: date[4],
                          time: time[4],
                          persons: persons[4]),
                      ReservationCard(
                          username: username[5],
                          date: date[5],
                          time: time[5],
                          persons: persons[5]),
                      ReservationCard(
                          username: username[6],
                          date: date[6],
                          time: time[6],
                          persons: persons[6]),
                      ReservationCard(
                          username: username[7],
                          date: date[7],
                          time: time[7],
                          persons: persons[7]),
                      ReservationCard(
                          username: username[8],
                          date: date[8],
                          time: time[8],
                          persons: persons[8]),
                      ReservationCard(
                          username: username[9],
                          date: date[9],
                          time: time[9],
                          persons: persons[9]),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}