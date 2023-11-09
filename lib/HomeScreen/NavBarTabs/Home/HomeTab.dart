import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpy_moto_custms/HomeScreen/NavBarTabs/Home/Components/BannerCarousel.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          TextField(
            //style: const TextStyle(),
            cursorColor: Colors.green,
            style:
                const TextStyle(color: Colors.black, fontSize: 15, height: 1),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              hintText: 'Search any Service'
              /*  const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, color: Colors.white),
                  Text(
                    'Search a service',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),*/
              ,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            //For Carousal
            height: 150,
            child: Container(
              child: BannerCarousel(),
              // color: Colors.green,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    //  textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    'Hire Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text('Schedule',
                        style: TextStyle(color: Colors.green))),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                'In 38 Minues',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Popular Services',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 230,
            child: GridView.builder(
              //padding: EdgeInsets.all(5),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: const Icon(Icons.car_crash),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: Get.size.width,
            //  color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: const Color.fromARGB(255, 230, 227, 227),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Cart',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text('2 Items| RS : Rs.2630> ')
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'View Cart',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
