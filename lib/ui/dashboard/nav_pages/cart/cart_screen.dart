import 'dart:async';
import 'dart:ui';
import 'package:ecomm_368/data/remote/models/cart_model.dart';
import 'package:ecomm_368/ui/dashboard/nav_pages/cart/bloc/cart_bloc.dart';
import 'package:ecomm_368/ui/dashboard/nav_pages/cart/bloc/cart_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [];

  /*[
    {
      "image":
          "https://content.jdmagicbox.com/quickquotes/images_main/atomberg-renesa-smart-bldc-iot-ceiling-fan-golden-oakwood-natural-oakwood-2220048496-fsjnlr3r.jpg?impolicy=queryparam&im=Resize=(360,360),aspect=fit",
      "Name": "UltraCool Smart Fan",
      "price": "2,499",
      "qty": 1,
    },
    {
      "image":
          "https://brain-images-ssl.cdn.dixons.com/5/2/10257225/l_10257225.jpg",
      "Name": "TurboMax Washing Machine",
      "price": "14,990",
      "qty": 1,
    },
    {
      "image":
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1729510459/Croma%20Assets/Entertainment/Television/Images/273733_0_w8e4qb.png",
      "Name": "Chroma LED TV 43",
      "price": "23,900",
      "qty": 2,
    },
    {
      "image":
          "https://www.simplyshopping.in/cdn/shop/products/716YmAfmCoL._SL1500_1200x1200.jpg?v=1676113454",
      "Name": "SoundPro Bluetooth Speaker",
      "price": "1,599",
      "qty": 1,
    },
    {
      "image":
          "https://electronicparadise.in/cdn/shop/files/Voltas_1.0_Ton_3_Star_Split_Air_Conditioner_123_Vectra_Elegant_1.webp?v=1739427287&width=640",
      "Name": "CoolMist Air Conditioner",
      "price": "38,500",
      "qty": 2,
    },
    {
      "image":
          "https://i5.walmartimages.com/asr/e3809b88-267e-4f13-bbb1-16e7cc98ee1b.75f3a22226dfbb1058c67906c0eaf942.jpeg",
      "Name": "InstaBrew Coffee Maker",
      "price": "3,750",
      "qty": 1,
    },
  ];*/
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchAllCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> disCountCodes = [
      {"name": "FLAT5000", "value": 5000, "type": 1},
      {"name": "FLAT1000", "value": 1000, "type": 1},
      {"name": "FLAT2000", "value": 2000, "type": 1},
      {"name": "FLAT3000", "value": 3000, "type": 1},
      {"name": "SALE20", "value": 20, "type": 2},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    TextTheme style = Theme.of(context).textTheme;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [Color(0xFF121212), Color(0xFF1E1E1E)]
              : [Color(0xFFe3f2fd), Color(0xFFbbdefb)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Image.asset("assets/images/app_icon_horizonal.png"),
          leadingWidth: 180,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text("My Cart", style: style.headlineLarge),
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (state is CartLoadedState) {
                          cartItems = state.allCartItems;
                          return ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 390),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cartItems.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: 120,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: Image.network(
                                            cartItems[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 140,
                                                child: Text(
                                                  cartItems[index].name,
                                                  style: style.titleMedium!
                                                      .copyWith(fontSize: 16),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "₹${cartItems[index].price}",
                                                style: style.titleLarge!
                                                    .copyWith(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 55,
                                          ),
                                          child: Icon(
                                            CupertinoIcons.delete_simple,
                                            color: Color(0xFF1E88E5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 10,
                                      bottom: 22,
                                      child: Container(
                                        width: 120,
                                        // margin: EdgeInsets.only(left: 25),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: BoxBorder.all(
                                            color: Colors.blueAccent,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                      ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Icon(
                                                    Icons.add_rounded,
                                                    color: Colors.blueAccent,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 30,
                                              child: Center(
                                                child: Text(
                                                  "${state.allCartItems[index].quantity}",
                                                  style: TextStyle(
                                                    fontFamily: "pop",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.blueAccent,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Icon(
                                                    Icons.remove_rounded,
                                                    color: Colors.blueAccent,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /*Row(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.blueAccent
                                                ),
                                                //color: isDark?Colors.white:Colors.grey.shade200,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20),
                                                ),
                                              ),
                                              child: Icon(Icons.add_rounded,color: Colors.black, size: 16,),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            //color: isDark?Colors.white:Colors.grey.shade200,
                                            child: Center(
                                              child: Text(
                                                cartItems[index].quantity.toString(),
                                                style: TextStyle(
                                                  fontFamily: "pop",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: isDark?Colors.black:Colors.black,
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
                                                color: isDark?Colors.white:Colors.grey.shade200,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),
                                                ),
                                              ),
                                              child: Icon(Icons.remove_rounded,color:isDark?Colors.black:Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),*/
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }

                        if (state is CartErrorState) {
                          return Center(child: Text(state.errorMsg));
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                height: 380,
                decoration: BoxDecoration(
                  color: isDark ? Color(0xff2C2C2C) : Color(0xffe8f5ff),
                  boxShadow: isDark
                      ? [
                          BoxShadow(
                            color: Color(0xaa3A3A3A),
                            blurRadius: 15,
                            spreadRadius: -5,
                            offset: Offset(0, -8),
                          ),
                        ]
                      : [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withAlpha(50),
                          ),
                        ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDark ? Color(0xFF121212) : Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Discount Code",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "pop",
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 15),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "pop",
                              fontSize: 16,
                              color: Color(0xFF1E88E5),
                            ),
                          ),
                        ),
                        //suffixStyle:  TextStyle(fontWeight: FontWeight.w500,fontFamily: "pop",color: Colors.black,fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "pop",
                            color: isDark
                                ? Color(0xff90A4AE)
                                : Colors.grey.shade700,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹52100",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "pop",
                            color: isDark
                                ? Color(0xff90A4AE)
                                : Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(height: 1, color: Colors.grey),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "pop",
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹52100",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "pop",
                            color: Color(0xFF1E88E5),
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1E88E5),
                        minimumSize: Size(280, 50),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "pop",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
