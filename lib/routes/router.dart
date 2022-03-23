class Routes {
  static const String init = "/";
  static const String home = "/home";
  static const String auth = "/auth";
  static const String attendance = "/attendance";
  static const String profile = "/profile";
  static const String modifyEmployeeProfile = "/modify-employee-profile";
  static const String allEmployeeProfile = "/all-employee-profile";
  static const String leave = "/leave";
  static const String applyLeave = "/apply-leave";
  static const String allEmployeeLeaves = "/all-employee-leaves";

  static Set<String> routes = {
    init,
    home,
    auth,
    attendance,
    profile,
   // modifyEmployeeProfile,
    allEmployeeProfile,
    applyLeave,
    allEmployeeLeaves,
    leave,
  };
  static bool validateRoute(String? route) {
    if (route == null) {
      return false;
    } else {
      return routes.contains(route);
    }
  }
}



// class WorkifyRouter {
//   static Map<Routes, String> routes = {};
//   WorkifyRouter() {
//     Routes.values.map((e) => routes[e] = camelToSnake(e.toString()));
//   }

//   static bool validateRoute(String route) {
//     return routes.containsValue(route);
//   }

//   static String camelToSnake(String key) {
//     if (key.toString() == Routes.INITIAL.toString()) return "/";
//     RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
//     return "/"+key
//         .replaceAllMapped(exp, (Match m) => ('-' + m.group(0)!))
//         .toLowerCase();
//   }
// }
