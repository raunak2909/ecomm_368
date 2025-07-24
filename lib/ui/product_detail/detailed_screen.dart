import 'package:ecomm_368/data/remote/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dashboard/nav_pages/cart/bloc/cart_bloc.dart';
import '../dashboard/nav_pages/cart/bloc/cart_event.dart';
import '../dashboard/nav_pages/cart/bloc/cart_state.dart';

class DetailedScreen extends StatefulWidget {
  ProductModel product;

  DetailedScreen({required this.product});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

int selectedInfo = 0;
List<Map<String, dynamic>> descriptionData = [
  {
    "title": "AI‑Powered Wash",
    "desc":
        "Uses an intelligent neural‑network algorithm to detect fabric type and load, then customizes duration, water level, wash intensity, and gentleness.",
  },
  {
    "title": "3D & 9‑Swirl Wash Motion",
    "desc":
        "Multi‑angled drum movements mimic hand wash for thorough yet gentle cleaning",
  },
  {
    "title": "Power Steam & Steam Refresh",
    "desc":
        "Sanitizes clothes, removes stubborn stains, and revives garments in just 30 minutes—no detergent needed",
  },
  {
    "title": "Eco‑Inverter Motor + 5‑Star BEE Rating",
    "desc":
        "Efficient and quiet operation, with 1200RPM spin for quicker drying and reduced energy bills.",
  },
  {
    "title": "AquaEnergie Device",
    "desc":
        "Softens hard water to enhance detergent action and protect fabric colours",
  },
  {
    "title": "Wi‑Fi & Voice Control",
    "desc":
        "Remotely monitor and control your wash via MyIFB app or voice assistants.",
  },
  {
    "title": "Self‑Diagnosis & Safety Features",
    "desc":
        "Auto‑imbalance control, voltage protection, foam detection, child‑lock, auto‑restart, and rat mesh cover",
  },
];

class _DetailedScreenState extends State<DetailedScreen> {
  bool isAdding = false;
  int indexColor = 0;
  int qty = 1;
  List<Color> productColor = [Colors.grey, Colors.red, Colors.black];
  List<String> banners = [
    "https://www.ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/s/e/serena-bxn-k-7.0kg-fv.webp",
    "https://www.ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/w/t/wty_img_wm_1_59.webp",
    "https://www.ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/s/e/serena-bxn-k-7.0kg-rv.webp",
    "https://www.ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/s/e/serena-bxn-k-7.0kg-lv.webp",
    "http://ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/s/e/serena-bxn-k-7.0kg-do-1.webp",
    "https://www.ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/s/e/serena-bxn-k-7.0kg-dt.webp",
  ];
  List<Widget> infos = [
    ListView.builder(
      itemCount: descriptionData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "* ${descriptionData[index]["title"]}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "pop",
              ),
            ),
            Text(
              descriptionData[index]["desc"],
              style: TextStyle(fontFamily: "pop"),
            ),
          ],
        );
      },
    ),
    Container(height: 500, child: Center(child: Text("Yet to Work"))),
    Container(height: 500, child: Center(child: Text("Yet to Work"))),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color icColor = isDark ? Colors.white : Colors.black;
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [Color(0xFF121212), Color(0xFF1E1E1E)]
              : [Color(0xFFe3f2fd), Color(0xFFbbdefb)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: widget.product.id.toString(),
                child: Container(
                  height: 330,
                  width: double.infinity,
                  child: Image.network(widget.product.image),
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.orangeAccent,
                                size: 20,
                              );
                            },
                          ),
                        ),
                        Text(
                          "(10)",
                          style: TextStyle(
                            fontFamily: "pop",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "M.R.P.: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "pop",
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "₹${widget.product.price}",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "pop",
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "pop",
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "₹${widget.product.price}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "pop",
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade600,
                          ),
                        ),
                        SizedBox(width: 90),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Icon(Icons.add_rounded),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.grey.shade200,
                              child: Center(
                                child: Text(
                                  "$qty",
                                  style: TextStyle(
                                    fontFamily: "pop",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Icon(Icons.remove_rounded),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You Save: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "pop",
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "(0%)",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "pop",
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Color",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "pop",
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productColor.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: index == indexColor
                                ? Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: productColor[index],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: productColor[index],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            selectedInfo = 0;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: selectedInfo == 0
                                  ? Colors.blueAccent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  color: selectedInfo == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: "pop",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedInfo = 1;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: selectedInfo == 1
                                  ? Colors.blueAccent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Specs",
                                style: TextStyle(
                                  color: selectedInfo == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: "pop",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedInfo = 2;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: selectedInfo == 2
                                  ? Colors.blueAccent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                  color: selectedInfo == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: "pop",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(child: infos[selectedInfo]),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 320,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 7),
                    Container(
                      width: 120,
                      // margin: EdgeInsets.only(left: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: BoxBorder.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  qty++;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.add_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "$qty",
                                style: TextStyle(
                                  fontFamily: "pop",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (qty > 1) {
                                    qty--;
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.remove_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocConsumer<CartBloc, CartState>(
                      listener: (_, state){

                        if(state is CartLoadingState){
                          isAdding = false;
                        }

                        if(state is CartSuccessState){
                          isAdding = false;
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Added to cart"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }

                        if(state is CartErrorState){
                          isAdding = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMsg),
                            ),
                          );
                        }

                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context.read<CartBloc>().add(
                              AddCartEvent(
                                productId: int.parse(widget.product.id),
                                quantity: qty,
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: isAdding ? CircularProgressIndicator(
                                color: Colors.blueAccent,
                              ) : Text(
                                "Add To Cart",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "pop",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                    /*Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "pop",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
