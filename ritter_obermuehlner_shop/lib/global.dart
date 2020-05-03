import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

String lorem =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas at, aspernatur blanditiis veritatis nam ea corrupti architecto, ipsum dolor sunt facere quasi, laborum fugiat earum laudantium adipisci corporis esse magnam.";


String currentCategory = cats[0].title;
List<dynamic> currentProductList = productLists[0];
List<Product> basket = [];
int currentCount = 1;

String userName = "Nadim";

class Product {
  final String title, description, img;
  double price;
  int amount;
  Product({this.title, this.description, this.price, this.img, this.amount});
}

List<List> productLists = [productsListBeer, productsListWine, productsListSprit];

List<Product> productsListBeer = [
  Product(
    description: lorem,
    title: "Feldschlösschen",
    price: 1.80,
    img:
        "https://www.volgshop.ch/wp-content/uploads/2015/04/FSO_Dose_50cl_10096.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Quöllfrisch",
    price: 1.85,
    img:
        "https://www.appenzellerbier.ch/fileadmin/_processed_/7/0/csm_petite_fraiche_25cl_prod_045f9e888d.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Heineken",
    price: 1.70,
    img:
        "http://pluspng.com/img-png/heineken-png-picture-of-heineken-beer-12-pack-bottles-550.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Serengeti Lager",
    price: 2.00,
    img:
        "https://www.eabl.com/sites/default/files/brands-images/serengeti_330ml.png",
    amount: 0
  )
];

List<Product> productsListWine = [
  Product(
    description: lorem,
    title: "Argento",
    price: 34.90,
    img:
        "https://purepng.com/public/uploads/medium/purepng.com-argento-wine-bottlebottlenarrowerjarexternalinnersealargento-wine-1421526457831tqzzt.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Bordeux",
    price: 31.85,
    img:
        "https://purepng.com/public/uploads/medium/purepng.com-red-wine-bottlebottlenarrowerjarexternalinnersealredwine-1421526457738f2et7.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Brunello",
    price: 47.70,
    img:
        "https://purepng.com/public/uploads/medium/purepng.com-wine-bottlebottle-food-wine-object-alcohol-beverage-cocktail-liquor-whiskey-drunk-941524623252aijrd.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Duplin",
    price: 23.00,
    img:
        "https://purepng.com/public/uploads/large/purepng.com-wine-bottlebottle-food-wine-object-drink-alcohol-beverage-941524620427wpunm.png",
    amount: 0
  )
];

List<Product> productsListSprit = [
  Product(
    description: lorem,
    title: "Gin",
    price: 25.00,
    img:
        "https://media.danmurphys.com.au/dmo/product/697326-1.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Vodka",
    price: 21.00,
    img:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Absolut_vodka_bottle.png/1200px-Absolut_vodka_bottle.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Rum",
    price: 32.00,
    img:
        "https://pluspng.com/img-png/rum-png--733.png",
    amount: 0
  ),
  Product(
    description: lorem,
    title: "Whiskey",
    price: 18.00,
    img:
        "https://pngimg.com/uploads/whisky/whisky_PNG64.png",
    amount: 0
  )
];

class Category {
  final String title;
  final IconData icon;

  Category({this.title, this.icon});
}

List<Category> cats = [
  Category(
    icon: MaterialCommunityIcons.beer,
    title: "Bier",
  ),
  Category(
    icon: MaterialCommunityIcons.bottle_wine,
    title: "Wein",
  ),
  Category(
    icon: MaterialCommunityIcons.glass_cocktail,
    title: "Spirituosen",
  )
];
