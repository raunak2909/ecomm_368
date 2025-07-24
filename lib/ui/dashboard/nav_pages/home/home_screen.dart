
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecomm_368/data/remote/models/product_model.dart';
import 'package:ecomm_368/ui/product_detail/bloc/product_bloc.dart';
import 'package:ecomm_368/ui/product_detail/bloc/product_event.dart';
import 'package:ecomm_368/ui/product_detail/bloc/product_state.dart';
import 'package:ecomm_368/ui/product_detail/detailed_screen.dart';
import 'package:ecomm_368/utils/constants/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> banners = [
    "assets/images/hero/electronics_img.png",
    "assets/images/hero/homeApplicances.png",
    "assets/images/hero/watch.png",
  ];
  List<Map<String, dynamic>> categoriesItems = [
    {"image": "assets/images/categories/frg.png", "name": "fridge"},
    {"image": "assets/images/categories/phone.png", "name": "Phone"},
    {"image": "assets/images/categories/tv.png", "name": "Tv"},
    {"image": "assets/images/categories/lap.png", "name": "Laptop"},
    {"image": "assets/images/categories/ac.png", "name": "Ac"},
    {"image": "assets/images/categories/wash.png", "name": "Washing Machine"},
  ];
  List<Map<String, dynamic>> products = [
    {
      "image":
          "https://content.jdmagicbox.com/quickquotes/images_main/atomberg-renesa-smart-bldc-iot-ceiling-fan-golden-oakwood-natural-oakwood-2220048496-fsjnlr3r.jpg?impolicy=queryparam&im=Resize=(360,360),aspect=fit",
      "Name": "UltraCool Smart Fan",
      "price": "2,499",
      "mrp": "3,299",
      "off": 20,
      "id": 1,
    },
    {
      "image":
          "https://www.ifbappliances.com/media/opti_image/webp/catalog/product/cache/b0f3fdce25eaff9ceff91545b0591d40/s/e/serena-bxn-k-7.0kg-fv.webp",
      "Name": "IFB Serena BXN 7012K CMS Front Load Washing Machine 7 kg",
      "price": "34,490",
      "mrp": "41,850",
      "off": "18",
      "id": 2,
    },
    {
      "image":
          "https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1729510459/Croma%20Assets/Entertainment/Television/Images/273733_0_w8e4qb.png",
      "Name": "Chroma LED TV 43",
      "price": "23,900",
      "mrp": "23,900",
      "off": "42",
      "id": 3,
    },
    {
      "image":
          "https://www.simplyshopping.in/cdn/shop/products/716YmAfmCoL._SL1500_1200x1200.jpg?v=1676113454",
      "Name": "SoundPro Bluetooth Speaker",
      "price": "1,599",
      "mrp": "2,199",
      "off": "17",
      "id": 4,
    },
    {
      "image":
          "https://electronicparadise.in/cdn/shop/files/Voltas_1.0_Ton_3_Star_Split_Air_Conditioner_123_Vectra_Elegant_1.webp?v=1739427287&width=640",
      "Name": "CoolMist Air Conditioner",
      "price": "38,500",
      "mrp": "43,000",
      "off": "35",
      "id": 5,
    },
    {
      "image":
          "https://i5.walmartimages.com/asr/e3809b88-267e-4f13-bbb1-16e7cc98ee1b.75f3a22226dfbb1058c67906c0eaf942.jpeg",
      "Name": "InstaBrew Coffee Maker",
      "price": "3,750",
      "mrp": "4,499",
      "off": "50",
      "id": 6,
    },
  ];
  int _currentBanner = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetAllProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    TextTheme style = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: isDark
              ? [Color(0xFF121212), Color(0xFF1E1E1E)]
              : [Color(0xFFe3f2fd), Color(0xFFbbdefb)],
          // colors: [Color(0xFF121212), Color(0xFF252561)],
          //colors: [Color(0xFF0D47A1), Color(0xFF1A237E)],
          // colors: [Color(0xFF121212),Color(0xFF0D47A1) ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Image.asset("assets/images/app_icon_horizonal.png"),
          leadingWidth: 180,
          actions: [],
          actionsPadding: EdgeInsets.only(right: 20),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  "Hello,Athishay👋",
                  style: style.headlineLarge
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: isDark
                      ? Border.all(color: Color(0xFF404040), width: 1)
                      : null,
                  boxShadow: isDark
                  ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: Offset(0, 8),
                  ),
                    BoxShadow(
                      color: Color(0xaa3A3A3A),
                      blurRadius: 15,
                      spreadRadius: -5,
                      offset: Offset(0, -8),
                    ),
                    ]:[
                    BoxShadow(
                      color: isDark ?Color(0xff424242):Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  style: style.bodySmall!.copyWith(fontSize: 18,fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: isDark?Color(0xff1E1E1E):Colors.white.withAlpha(140),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: isDark?Color(0xff78909C):Color(0xff757575),
                    ),
                    suffixIcon: Icon(
                      CupertinoIcons.camera_viewfinder,
                      color: isDark?Color(0xff78909C):Color(0xff757575),
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    hintText: "Search",
                    hintStyle: style.bodySmall!.copyWith(fontSize: 18,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: CarouselSlider.builder(
                        itemCount: banners.length, itemBuilder: (_, index, realIdx) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                              child: Image.asset(banners[index],fit: BoxFit.cover,)));
                    }, options: CarouselOptions(
                      onPageChanged: (index, __){
                        _currentBanner = index;
                        setState(() {

                        });
                      },
                      //enlargeFactor: 2,
                      //enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      viewportFraction: 1
                    )),
                  ),
                  Positioned(
                    bottom: 7,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: double.infinity,
                      child: DotsIndicator(
                        dotsCount: banners.length,
                        animate: true,
                        position: _currentBanner.toDouble(),
                        decorator: DotsDecorator(
                          spacing: EdgeInsets.all(2),
                          activeColor: Colors.black,
                          color: Colors.transparent,
                          size: Size(8, 8),
                          activeSize: Size(16, 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: Colors.black)),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                ],
              ),




              /*CarouselSlider.builder(
                itemCount: banners.length,
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isDark?Color(0xff424242):Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(banners[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentBanner = index;
                    });
                  },
                ),
              ),
*/
              // Dots (below Carousel)
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banners.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToItem(entry.key),
                    child: Container(
                      width: _currentBanner == entry.key ? 20 : 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: _currentBanner == entry.key
                            ? isDark?Colors.black: Colors.white
                            : isDark?Colors.black.withOpacity(0.5):Colors.white.withOpacity(0.5),
                      ),
                    ),
                  );
                }).toList(),
              ),*/
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Categories",
                      style: style.headlineMedium
                    ),
                  ),
                  Spacer(),
                  Text(
                    "More",
                    style: TextStyle(
                      color: Color(0xff1E88E5),
                      fontWeight: FontWeight.w500,
                      fontFamily: "pop",
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff1E88E5),
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 160,
                child: Center(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesItems.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                           CircleAvatar(
                                radius: 40,
                                backgroundColor: isDark?Color(0xff2C2C2C):Colors.white,
                                backgroundImage: AssetImage(
                                  categoriesItems[index]["image"],
                                ),
                              ),
                            SizedBox(height: 6),
                            SizedBox(
                              width: 80,
                              child: Text(
                                categoriesItems[index]['name'],
                                style: style.bodyLarge,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "For you",
                      style:style.headlineMedium,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Color(0xff1E88E5),
                      fontWeight: FontWeight.w500,
                      fontFamily: "pop",
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff1E88E5),
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              BlocBuilder<ProductBloc, ProductState>(builder: (_, state){
                if(state is ProductLoadingState){
                  return Center(child: CircularProgressIndicator());
                }

                if(state is ProductErrorState){
                  return Center(child: Text(state.errorMsg));
                }

                if(state is ProductLoadedState){
                  return GridView.builder(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                      bottom: 110,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 9 / 10,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.mProducts.length,
                    itemBuilder: (_, index) {

                      ProductModel eachProduct = state.mProducts[index];

                      return InkWell(
                        onTap: (){
                          //Navigator.pushNamed(context, AppRoutes.productDetail, arguments: eachProduct.toJson());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedScreen(product: eachProduct),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:isDark?Color(0xff2C2C2C): Colors.white,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 10,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10),
                                    Hero(
                                      tag: eachProduct.id.toString(),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                          eachProduct.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                          eachProduct.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: style.bodyMedium!.copyWith(fontWeight: FontWeight.w500)
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                        "₹${eachProduct.price}",
                                        style: style.titleLarge!.copyWith(fontSize: 18)
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "M.R.P:",
                                            style: style.bodySmall
                                        ),
                                        Text(
                                            "₹${eachProduct.price}",

                                            style: style.bodySmall
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    "0 %off",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "pop",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xff64B5F6),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                   child: Icon(Icons.favorite_border, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }

                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}
