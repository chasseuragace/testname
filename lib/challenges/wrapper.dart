import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengesWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FoodApp();
  }
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,

            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 20,
                  child: Icon(Icons.person, color: Colors.yellow),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-80,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'search for'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Recipes'.toUpperCase(),
                        style: Theme.of(context).textTheme.display1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(18)),
                    child: TextField(
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'recommended'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),

                  //color: Colors.red,

                  padding: EdgeInsets.only(left: 15),

                  height: 300,

                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return FoodTile(foodItem: 'name', height: 295.0);
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),

                  //color: Colors.red,

                  padding: EdgeInsets.only(left: 15),

                  height: 300,

                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return FoodTile(foodItem: 'name', height: 295.0);
                      }),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  final foodItem;
  final height;

  FoodTile({this.foodItem, this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Colors.pinkAccent[200].withOpacity(.5),
        borderRadius: BorderRadius.circular(8),
        elevation: 3,
        child: Center(child: Text('items')),
      ),
      height: height,

      margin: EdgeInsets.only(right: 8, left: 2),
      width: 250,
    );
  }
}
