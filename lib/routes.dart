

import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/View/Screens/customaztion/customaztion.dart';
import 'package:fasty_admin/View/Screens/customaztion/linked_items.dart';
import 'package:fasty_admin/View/Screens/deliveries/add_delivery.dart';
import 'package:fasty_admin/View/Screens/deliveries/deliveries.dart';
import 'package:fasty_admin/View/Screens/faq.dart';
import 'package:fasty_admin/View/Screens/home.dart';
import 'package:fasty_admin/View/Screens/items/add_item.dart';
import 'package:fasty_admin/View/Screens/items/food.dart';
import 'package:fasty_admin/View/Screens/items/price_information.dart';
import 'package:fasty_admin/View/Screens/notifications.dart';
import 'package:fasty_admin/View/Screens/offers/add_offer.dart';
import 'package:fasty_admin/View/Screens/offers/offers.dart';
import 'package:fasty_admin/View/Screens/orders/archived_orders.dart';
import 'package:fasty_admin/View/Screens/orders/current_orders.dart';
import 'package:fasty_admin/View/Screens/orders/order_details.dart';
import 'package:fasty_admin/View/Screens/orders/shipping_orders.dart';
import 'package:fasty_admin/View/Screens/reviews.dart';
import 'package:fasty_admin/View/Screens/signin.dart';
import 'package:fasty_admin/View/Screens/users/user_orders.dart';
import 'package:fasty_admin/View/Screens/users/users.dart';
import 'package:fasty_admin/middleware.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Signin(), middlewares: [
    MiddleWare()
  ]),  GetPage(name: AppRoutes.login, page: () => const Signin()),
  GetPage(name: AppRoutes.home, page: () => const Home()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.currentOrders, page: () => const CurrentOrders(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.shippingOrders, page: () => const ShippingOrders(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.archivedOrders, page: () => const ArchivedOrders(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.customaztion, page: () => const Customaztion(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.linkedItems, page: () => const LinkedItems(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.offers, page: () => const Offers(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.addOffer, page: () => const AddOffer(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.food, page: () => const Food(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.addItem, page: () => const AddItem(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.priceInformation, page: () => const PriceInformation(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.users, page: () => const Users(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.userOrders, page: () => const UserOrders(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.deliveries, page: () => const Deliveries(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.addDelivery, page: () => const AddDelivery(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.reviews, page: () => const Reviews(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.notifications, page: () => const Notifications(), transition: Transition.rightToLeft),
  GetPage(name: AppRoutes.faq, page: () => const Faq(), transition: Transition.rightToLeft),
];
  

