import 'package:applore_task/ui/search.dart';
import 'package:applore_task/utils/color_constants.dart';
import 'package:applore_task/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var latoStyle = GoogleFonts.lato();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset('assets/pngs/Vector.png'),
                ),
                label: 'Check'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/pngs/Vector (1).png'),
                label: 'Check'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/pngs/Vector (2).png'),
                label: 'Check'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.grey[400],
              ),
              label: 'Check',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              buildBackground(height, latoStyle),
              buildForeground(latoStyle, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForeground(TextStyle latoStyle, double height) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(latoStyle),
          buildSizedBox18(),
          SearchField(style: latoStyle),
          buildSizedBox18(),
          buildHealthCard(height, latoStyle),
          buildSizedBox18(),
          buildPageIndicator()
        ],
      ),
    );
  }

  SizedBox buildSizedBox18() {
    return SizedBox(
      height: 18,
    );
  }

  Widget buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                4,
                (index) => value == index
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightOrange),
                          height: 4,
                          width: 20,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightOrange),
                          height: 2,
                          width: 20,
                        ),
                      )).toList(),
          );
        },
      ),
    );
  }

  Widget buildHealthCard(double height, TextStyle latoStyle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 15,
      shadowColor: Colors.lightBlueAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: height * 0.6,
            child: PageView.builder(
              onPageChanged: (index) {
                currentIndex.value = index;
              },
              itemBuilder: (context, index) =>
                  buildHealthCareWidget(height, latoStyle),
              itemCount: 4,
            )),
      ),
    );
  }

  Widget buildHealthCareWidget(double height, TextStyle latoStyle) {
    return Container(
      height: height * 0.6,
      width: double.infinity,
      decoration: BoxDecoration(
        color: healthCardColor,
      ),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Covid-19\nHealth Care',
            style: latoStyle.copyWith(fontSize: 36, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Book your next online\nappointments',
            style: latoStyle.copyWith(fontSize: 16, color: Colors.white),
          ),
          Spacer(),
          Center(child: Image.asset('assets/pngs/illustration.png'))
        ],
      ),
    );
  }

  Widget buildSearchField(TextStyle latoStyle) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: latoStyle.copyWith(color: Colors.grey),
                  hintText: 'Search For Tests/Labs/Packages'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackground(double height, TextStyle latoStyle) {
    return Container(
      height: height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(250),
        ),
      ),
    );
  }

  Widget buildHeader(TextStyle latoStyle) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
              text: 'Welcome,\n',
              style: latoStyle.copyWith(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(
                    text: 'Jacob Jones',
                    style: latoStyle.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))
              ]),
        ),
        Spacer(),
        InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(),
                )),
            child: Image.asset('assets/pngs/bell.png')),
        SizedBox(
          width: 12,
        ),
        Image.asset('assets/pngs/Avatar 01.png'),
      ],
    );
  }
}
