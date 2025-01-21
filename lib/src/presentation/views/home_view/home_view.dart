import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_picker/src/core/router/app_router.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: Colors.white,
          width: 90.w,
          child: Column(
            children: [
              Container(
                height: 28.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.dp),
                    bottomRight: Radius.circular(20.dp),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.greenAccent,
                      Colors.green,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    CircleAvatar(
                      radius: 36.dp,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                      ),
                    ),
                    Gap(16.dp),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "ID : 4120",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(const CartRoute());
              },
              icon: Badge(
                label: Text("0"),
                child: const Icon(
                  Icons.shopping_cart_rounded,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.redAccent,
            labelColor: Colors.redAccent,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Favorite'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DishWidget(),
            DishWidget(),
            DishWidget(),
          ],
        ),
      ),
    );
  }
}

class DishWidget extends StatelessWidget {
  const DishWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16.dp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.dp),
                child: Container(
                  height: 20.dp,
                  width: 20.dp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.dp),
                  ),
                  child: Image.asset(
                    "assets/images/non_veg.png",
                  ),
                ),
              ),
              Gap(12.dp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Spanish Salad",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Gap(4.dp),
                    Row(
                      children: [
                        Text(
                          "SAR 12.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "15 Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    Gap(12.dp),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quasi. Autem, repellendus? Quisquam, quasi. Autem, repellendus?",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp,
                      ),
                    ),
                    Gap(12.dp),
                    Container(
                      width: 120.dp,
                      height: 42.dp,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(56.dp),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(12.dp),
                    Text("Customizations Available", style: TextStyle(color: Colors.redAccent, fontSize: 14.sp)),
                  ],
                ),
              ),
              Gap(12.dp),
              SizedBox(
                height: 68.dp,
                width: 68.dp,
                child: Image.network(
                  "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
