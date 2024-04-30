class EndPoint {
  static String baseUrl = "https://kemet-gp2024.onrender.com/api/v1/";
  static String getChangePasswordEndPoint =
      "https://kemet-gp2024.onrender.com/api/v1/auth/changePassword";
  static String logoutEndpoint =
      "https://kemet-gp2024.onrender.com/api/v1/auth/logOut";


            static String ticketsList =
      "https://kemet-gp2024.onrender.com/api/v1/MyTickets";

  static String createOrder(myTicketId) {
    return "https://kemet-gp2024.onrender.com/api/v1/order/createCashOrder/$myTicketId";
  }

 static String createOnlineOrder(myTicketId) {
    return "https://kemet-gp2024.onrender.com/api/v1/order/checkOut/$myTicketId";
  }

    static String deleteTicket(TId) {
    return "https://kemet-gp2024.onrender.com/api/v1/MyTickets/$TId";
  }

      static String quantityTicket(TId) {
    return "https://kemet-gp2024.onrender.com/api/v1/MyTickets/$TId";
  }

  static String tourismWishList =
      "https://kemet-gp2024.onrender.com/api/v1/tourismPlaceWL/getLoggedUserWishList";

  static String deleteTourismWishList(favCard) {
    return "https://kemet-gp2024.onrender.com/api/v1/tourismPlaceWL/removeFromWishList/$favCard";
  }

  static String tripsWishList =
      "https://kemet-gp2024.onrender.com/api/v1/tripWL/getLoggedUserWishList";

  static String deleteTripWishList(favCard) {
    return "https://kemet-gp2024.onrender.com/api/v1/tripWL/removeFromWishList/$favCard";
  }

  static String legendWishList =
      "https://kemet-gp2024.onrender.com/api/v1/legendWL/getLoggedUserWishList";

  static String deleteLegendWishList(favCard) {
    return "https://kemet-gp2024.onrender.com/api/v1/legendWL/removeFromWishList/$favCard";
  }

}

class ApiKey {
  static String stripeUrl ="url";
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String TId = "_id";
  static String governorateId = "_id";
  static String legendId = "_id";
  static String tourismId = "_id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
