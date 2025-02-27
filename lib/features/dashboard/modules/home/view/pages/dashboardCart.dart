import 'package:ecommerceapp/core/context_extension.dart';
import 'package:ecommerceapp/features/dashboard/modules/home/view/component/cartItemWidgetAll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/view/component/containerButtonModel.dart';
import '../../controller/home_cubit.dart';

class dashboardCart extends StatelessWidget {
  // List<String> imageList = [
  //   "lib/images/image1.jpg",
  //   "lib/images/image2.jpg",
  //   "lib/images/image3.jpg",
  //   "lib/images/image4.jpg"
  // ];
  // List<String> productTitles = [
  //   "Warm Zipper",
  //   "Knitted Woo!",
  //   "Zipper Win",
  //   "Child Win"
  // ];
  // List<String> prices = ["\$300", "\$650", "\$50", "\$100"];
  int length1 = 4;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final HomeCubit controller = context.read<HomeCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text("cart", style:  Theme.of(context).textTheme.bodyMedium),
              leading: BackButton(),
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).badgeTheme.backgroundColor,
              elevation: 0,
              centerTitle: true,
            ),
            body:
            state is HomeStateLoading ?Center(child: CircularProgressIndicator()):
            state is HomeStateEmpty?Center(child:Icon(CupertinoIcons.delete)):
                controller.cartData.isEmpty?Center(child:Icon(CupertinoIcons.delete)):
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: length1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, int index) => cartItemWidgetAll(HomeModel: controller.homeData[index], controller: controller),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Divider(
                    //   height: 20,
                    //   thickness: 1,
                    //   color: Colors.black,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Select All",
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     Checkbox(
                    //       splashRadius: 20,
                    //       activeColor: Color(0xFFDB3022),
                    //       value: false,
                    //       onChanged: (val) {},
                    //     )
                    //   ],
                    // ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Payment",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          controller.cartPrice.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFDB3022),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: containerButtonModel(
                        itext: 'CheckOut',
                        containerWidth: context.width,
                        bgColor: Color(0xFFDB3022),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
