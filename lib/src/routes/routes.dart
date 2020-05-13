import 'package:Africoncours_App/src/widgets/user/userpage/body/SettingsPages/Help_&_FeedbackPage.dart';
import 'package:flutter/material.dart';

import '../widgets/user/firstform/first.dart';
import '../widgets/user/userpage/body/AccountSecurityPages/change_email.dart';
import '../widgets/user/userpage/body/AccountSecurityPages/change_phone_number.dart';

import '../widgets/user/firstpage/firstpage.dart';

// Login Widget
import '../widgets/user/login/userLogin.dart';

// Signup Widgets
import '../widgets/user/signup/userSignUp.dart';

// Confirm email
import '../widgets/user/firstpage/confirmEmail.dart';

// Userpage
import '../widgets/user/userpage/main.dart';
import '../widgets/user/userpage/body/recentContests/viewNewsPage.dart';

//Settings Page
import '../widgets/user/userpage/body/SettingsPages/AccountSecurityPage.dart';
import '../widgets/user/userpage/body/SettingsPages/NotificationsPage.dart';
import '../widgets/user/userpage/body/SettingsPages/PrivacyPage.dart';
import '../widgets/user/userpage/body/SettingsPages/AboutPage.dart';
import '../widgets/user/userpage/body/SettingsPages/Help_&_FeedbackPage.dart';
import '../widgets/user/userpage/body/SettingsPages/ServicePage.dart';

//Account Security Pages
import '../widgets/user/userpage/body/AccountSecurityPages/change_password.dart';

//Side Menu Pages
import '../widgets/user/userpage/body/news.dart';
import '../widgets/user/userpage/body/SettingsPages/SideMenuSettings.dart';
import '../widgets/user/userpage/body/jobs.dart';
import '../widgets/user/userpage/body/competitions.dart';
import '../widgets/user/userpage/body/appliedJobs.dart';
import '../widgets/user/userpage/body/appliedCompetitions.dart';
import '../widgets/user/userpage/body/messages.dart';

//Student Profile Pages
import '../widgets/user/userpage/body/UserProfilePage/profile.dart';
import '../widgets/user/userpage/body/UserProfilePage/editProfilePages/ProfileEdit_landingPage.dart';
import '../widgets/user/userpage/body/UserProfilePage/editProfilePages/changeProfilePicture.dart';
import '../widgets/user/userpage/body/UserProfilePage/editProfilePages/editUserInformation.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Cover());
      case '/user/login':
        return MaterialPageRoute(builder: (_) => UserLogin());
      case '/user/signup':
        return MaterialPageRoute(builder: (_) => UserSignup());
      case '/confirm/email':
        return MaterialPageRoute(builder: (_) => ConfirmEmail());
      case '/user/page':
        return MaterialPageRoute(builder: (_) => UserPage());
      case '/user/continue/registration':
        return MaterialPageRoute(builder: (_) => UserLogin());
      case '/news':
        return MaterialPageRoute(
            builder: (_) => ViewNews(
                  data: arg,
                ));
      case '/user/second':
        return MaterialPageRoute(builder: (_) => Second(data: arg));
      case '/user/account/security':
        return MaterialPageRoute(builder: (_) => Account());
      case '/user/account/notifications':
        return MaterialPageRoute(builder: (_) => Notifications());
      case '/user/settings/privacy':
        return MaterialPageRoute(builder: (_) => Privacy());
      case '/user/settings/about':
        return MaterialPageRoute(builder: (_) => About());
      case '/user/settings/help':
        return MaterialPageRoute(builder: (_) => Help());
      case '/user/settings/services':
        return MaterialPageRoute(builder: (_) => Services());
      case '/user/settings/changepassword':
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case '/user/settings/changeemail':
        return MaterialPageRoute(builder: (_) => ChangeEmail());
      case '/user/settings/changephonenumber':
        return MaterialPageRoute(builder: (_) => ChangePhoneNumber());
      case '/user/sidemenu/contest/ongoing':
        return MaterialPageRoute(builder: (_) => Ongoing());
      case '/user/sidemenu/settings':
        return MaterialPageRoute(builder: (_) => SideMenuSettings());
      case '/user/sidemenu/profile':
        return MaterialPageRoute(builder: (_) => UserProfile());
      case '/user/profile/Edit/selectionPage':
        return MaterialPageRoute(builder: (_) => ProfileEditMainPage());
      case '/user/profile/Edit/changeProfilePicture':
        return MaterialPageRoute(builder: (_) => ChangeProfilePicture());
      case '/user/profile/Edit/editUserInformation':
        return MaterialPageRoute(builder: (_) => EditUserInformation());
      case '/user/sidemenu/jobs':
        return MaterialPageRoute(builder: (_) => Job());
      case '/user/sidemenu/competitions':
        return MaterialPageRoute(builder: (_) => Competition());
      case '/user/sidemenu/appliedjobs':
        return MaterialPageRoute(builder: (_) => AppliedJob());
      case '/user/sidemenu/appliedCompetitions':
        return MaterialPageRoute(builder: (_) => AppliedCompetition());
      case '/user/sidemenu/messages':
        return MaterialPageRoute(builder: (_) => Message());
    }
  }
}
