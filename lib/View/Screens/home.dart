import 'package:fasty_admin/Core/Constant/images.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Classes/account_row.dart';
import 'package:fasty_admin/View/Widgets/Classes/home_card.dart';
import 'package:fasty_admin/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => 
        HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.getData();},
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Center(
                child: ListView(children: [
                  const SizedBox(height: 23.5,),
                  welcomeBar(context, "Welcome!", 25),
                  GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 135, 
                  mainAxisSpacing: 12.5),
                  physics: const NeverScrollableScrollPhysics(), shrinkWrap: true,
                  children: [ HomeCard(name: "Pending Orders", image: AppImages.ordersApproveImage, onPressed: (){controller.toPage(AppRoutes.currentOrders);}),
                  HomeCard(name: "Shipping Orders", image: AppImages.shippingOrdersImage, onPressed: (){controller.toPage(AppRoutes.shippingOrders);}),
                  HomeCard(name: "Archived Orders", image: AppImages.archivedOrdersImgage, onPressed: (){controller.toPage(AppRoutes.archivedOrders);}),
                  HomeCard(name: "Notifications", image: AppImages.notificationsImage, onPressed: (){controller.toPage(AppRoutes.notifications);}),
                  HomeCard(name: "Offers", image: AppImages.offersImage, onPressed: (){controller.toPage(AppRoutes.offers);}),
                  HomeCard(name: "Food", image: AppImages.foodImage, onPressed: (){controller.toPage(AppRoutes.food);}),
                  HomeCard(name: "Customization", image: AppImages.menuImage, onPressed: (){controller.toPage(AppRoutes.customaztion);}),
                  HomeCard(name: "Users", image: AppImages.usersImage, onPressed: (){controller.toPage(AppRoutes.users);}),
                  HomeCard(name: "Deliveries", image: AppImages.deliveryImage, onPressed: (){controller.toPage(AppRoutes.deliveries);}),
                  HomeCard(name: "Reviews", image: AppImages.reviewImage, onPressed: (){controller.toPage(AppRoutes.reviews);}),
                  HomeCard(name: "FAQ", image: AppImages.faq, onPressed: (){controller.toPage(AppRoutes.faq);}),
                  ],
                  ),
                  const SizedBox(height: 20,),
                  AccountRow(name:  "Log out",icon:  FontAwesomeIcons.rightFromBracket,onTap: (){controller.logOut();}),
                  
                ],),
              ),
            ),
          )
      ),
    );
      }
  }
 