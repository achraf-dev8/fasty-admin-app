class ApiLinks{
   //static const String server = "http://10.0.2.2/fasty";
   static const String server = "http://172.20.10.5/fasty";

   static const String admin = "$server/admin";

   static const String loginLink = "$admin/login.php";

   static const String homeLink = "$admin/home.php";

   static const String orders = "$admin/orders";

   static const String ordersShow = "$orders/show";

   static const String currentOrders = "$ordersShow/current_orders.php";

   static const String shippingOrders = "$ordersShow/shipping_orders.php";

   static const String archivedOrders = "$ordersShow/archived_orders.php";

   static const String approveOrder = "$orders/approve_order.php";

   static const String disapproveOrder = "$orders/disapprove_order.php";

   static const String orderDetailsLink = "$server/orders/order_details.php";


   static const String customaztionLink = "$admin/customaztion";

   static const String customaztionDelete = "$customaztionLink/delete.php";

   static const String customaztionAdd = "$customaztionLink/add.php";

   static const String customaztionUpdate = "$customaztionLink/update.php";


  static const String offerLink = "$admin/offers";

  static const String offerShow= "$offerLink/show.php";

   static const String offerDelete = "$offerLink/delete.php";

   static const String offerAdd = "$offerLink/add.php";

   static const String offerUpdate= "$offerLink/update.php";

   static const String offerOrder= "$offerLink/order.php";


   static const String itemLink = "$admin/items";

   static const String itemAdd = "$itemLink/add.php";

   static const String itemDelete = "$itemLink/delete.php";

   static const String itemUpdate = "$itemLink/update.php";

   static const String itemUpdateSizes = "$itemLink/update_sizes.php";
   

   static const String usersLink = "$admin/users";

   static const String usersShow = "$usersLink/show.php";

   static const String usersBan = "$usersLink/ban.php";

   static const String usersOrders = "$usersLink/orders.php";


   static const String deliveriesLink = "$admin/deliveries";

   static const String deliveriesShow = "$deliveriesLink/show.php";

   static const String deliveriesDelete = "$deliveriesLink/delete.php";

   static const String deliveriesAdd = "$deliveriesLink/add.php";


   static const String reviewsLink = "$admin/reviews";

   static const String showReviews = "$reviewsLink/show.php";

   static const String deleteReviews = "$server/reviews/delete_review.php";


   static const String notificationLink = "$admin/notifications";

   static const String showNotifications = "$notificationLink/show.php";

   static const String sendNotification = "$notificationLink/send.php";


   static const String faqLink = "$admin/faq";

   static const String showFaq = "$faqLink/show.php";

   static const String addFaq = "$faqLink/add.php";

   static const String deleteFaq = "$faqLink/delete.php";

   static const String updateFaq = "$faqLink/update.php";


   static const String upload = "$server/upload";

   static const String offersUploadLink = "$upload/offers";

   static const String itemsUploadLink = "$upload/items";


   

}