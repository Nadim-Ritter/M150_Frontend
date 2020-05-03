import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';
import 'package:shop_delivery/ui/widgets/counter.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  const DetailsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    currentCount = 1;
 
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(179, 179, 227, 1),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
              children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_basket,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, 'orderscreen')),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Hero(
                        tag: '$id',
                        child: Image.network(
                          "${currentProductList[id].img}",
                          width: MediaQuery.of(context).size.width * .7,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${currentProductList[id].title}",
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ],
                    ),
                    Text(
                      "Beschreibung",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      "${currentProductList[id].description}",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(),
                        Text(
                          "${currentProductList[id].price} Fr.",
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          "Zum Warenkorb hinzufügen",
                          style: Theme.of(context).textTheme.button.apply(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {

                          basket.add(Product(title: currentProductList[id].title, description: currentProductList[id].description, price: currentProductList[id].price, img: currentProductList[id].img, amount: currentCount));

                          // debugPrint("---------------------------");
                          // for(int i = 0; i < basket.length; i++){
                          //   debugPrint(i.toString() + ": " + basket[i].title + " " + basket[i].amount.toString());
                          // }
                          // debugPrint("---------------------------");
                        },
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
