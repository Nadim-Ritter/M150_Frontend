import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_delivery/global.dart';
import 'package:shop_delivery/ui/screens/settings.dart';
import 'package:shop_delivery/ui/screens/user.dart';
import 'package:shop_delivery/ui/widgets/categorycontainer.dart';
import 'package:shop_delivery/ui/widgets/productcontainer.dart';

import '../../global.dart';
import '../../global.dart';
import '../../global.dart';
import '../../global.dart';
import 'details.dart';



class HomeScreen extends StatefulWidget{
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  int _active = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _tabs = [
      getHomePage(),
      User(),
      Settings()
    ];

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.glass_cocktail),
            title: Text("Getränke"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Profil"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Einstellungen"),
          ),
        ],
        onTap: onIconClicked,
        currentIndex: _currentIndex,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Color(0xfff9f9f9),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.pushNamed(context, 'orderscreen');
            },
          ),
        ],
      ),
      body: _tabs[_currentIndex]
    );
  }

  void onIconClicked(int index){
    setState(() {
      _currentIndex = index;
    });

  }

  Widget getHomePage(){
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Spirituosen",
            style: Theme.of(context).textTheme.display1.apply(
                  fontWeightDelta: 2,
                  color: Colors.black,
                ),
          ),
          Text("Shop Oberritter",
              style:
                  Theme.of(context).textTheme.display1.copyWith(height: .9)),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 81,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _active = i;
                      currentCategory = cats[i].title;
                      currentProductList = productLists[i];
                    });
                  },
                  child: Container(
                    constraints: BoxConstraints(minWidth: 121),
                    margin: EdgeInsets.only(right: i == cats.length - 1 ? 0 : 15.0),
                    decoration: BoxDecoration(
                      color: _active == i ? Color(0xff343c45) : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          cats[i].icon,
                          color: _active == i ? Colors.white : Colors.black,
                        ),
                        Text(
                          "${cats[i].title}",
                          style: Theme.of(context).textTheme.button.apply(
                                color: _active == i ? Colors.white : Colors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "$currentCategory",
            style: Theme.of(context).textTheme.title.apply(
                  fontWeightDelta: 2,
                ),
          ),
          SizedBox(
            height: 11,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: .7
            ),
            itemCount: currentProductList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(id: index)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(179, 179, 227, 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          currentProductList[index].price.toString() + " Fr.",
                          style: Theme.of(context).textTheme.title.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Hero(
                            tag: '$index',
                            child: Image.network(
                              "${currentProductList[index].img}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9.0),
                          ),
                        ),
                        child: Text(
                          "${currentProductList[index].title}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}