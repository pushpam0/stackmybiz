import 'package:firebase_auth/firebase_auth.dart';
import 'package:stackmybiz/model/profile_details_model.dart';

class GetUserDetails {
  Future<ProfileDetailsModel> getUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      print(
          "User Details :  --  :  ${user.email}, ${user.displayName}, ${user.photoURL}, ${user.emailVerified}");
      return ProfileDetailsModel(
          user.email, user.displayName, user.photoURL, user.emailVerified);
    } else {
      return ProfileDetailsModel(null, null, null, false);
    }
  }
}
