import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';
import 'package:shop_delivery/ui/widgets/counter.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String getPrice(double price, int amount){
      return double.parse((price * amount).toStringAsFixed(2)).toString() + " Fr.";
    }

    String getDeliveryPrice(){
      double price = 0;

      for(int i = 0; i < basket.length; i++){
        price += double.parse((basket[i].price * basket[i].amount).toStringAsFixed(2));
      }

      return price.toString() + " Fr.";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Meine Bestellung",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(fontWeightDelta: 2, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ...List.generate(basket.length, (id) {
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                "${basket[id].img}",
                                width: 70,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              "${basket[id].title}",
                              style: Theme.of(context).textTheme.title,
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                              ),
                              child: Text(
                                "Anzahl: ${basket[id].amount}"
                              )
                            ),
                            trailing: Text(
                              getPrice(basket[id].price, basket[id].amount),
                              style: Theme.of(context).textTheme.title,
                            ),
                          );
                        }).toList(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: ListTile(
                            leading: Container(
                              width: 70,
                              height: double.infinity,
                              // margin: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            title: Text(
                              "Lieferung",
                              style: Theme.of(context).textTheme.headline.apply(
                                    fontWeightDelta: 2,
                                  ),
                            ),
                            trailing: Text(
                              getDeliveryPrice(),
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Zahlung",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          ...List.generate(1, (i) {
                            return Container(
                              padding: const EdgeInsets.all(15.0),
                              margin: const EdgeInsets.only(right: 15),
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "**** 4832",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .apply(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    getDeliveryPrice(),
                                    style:
                                        Theme.of(context).textTheme.title.apply(
                                              color: Colors.white,
                                            ),
                                  ),
                                  Image.asset("assets/img/mastercard.png"),
                                ],
                              ),
                            );
                          }),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 15.0,
                              ),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        "Zahlung Bestätigen",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .apply(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'confirmOrder');
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
          ),
        ],
      ),
    );
  }
}
