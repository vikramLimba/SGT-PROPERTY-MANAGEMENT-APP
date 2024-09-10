// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/add_new_guard.dart';
import 'package:sgt_owner/feature/Guards/all_guard/assigned_properties/view/assigned_properties.dart';
import 'package:sgt_owner/feature/Guards/all_guard/completed_shifts/view/completed_shifts.dart';
import 'package:sgt_owner/feature/Guards/all_guard/edit_guard_profile/view/edit_guard_profile.dart';
import 'package:sgt_owner/feature/Guards/all_guard/guard_attendance/view/guard_attendence.dart';
import 'package:sgt_owner/feature/Guards/all_guard/guard_profile/view/guard_profile.dart';
import 'package:sgt_owner/feature/Guards/all_guard/missed_shifts/view/missed_shifts.dart';
import 'package:sgt_owner/feature/Guards/all_guard/total_leaves/view/total_leaves.dart';
import 'package:sgt_owner/feature/Guards/all_guard/all_guards.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/assign_guard/view/assign_guard.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/guards/view/guards_page.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/properties/view/properties_page.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/routes/view/route_page.dart';
import 'package:sgt_owner/feature/Guards/new_guard/address_page/view/address_page.dart';
import 'package:sgt_owner/feature/Guards/new_guard/id_card_page/view/id_card_page.dart';
import 'package:sgt_owner/feature/Guards/new_guard/password_page/view/password_page.dart';
import 'package:sgt_owner/feature/Guards/new_guard/profile_page/view/profile_page.dart';
import 'package:sgt_owner/feature/Messages/widgets/property_chat_listings.dart';
import 'package:sgt_owner/feature/Messages/widgets/messanger_profile.dart';
import 'package:sgt_owner/feature/Messages/widgets/shared_items/shared_items.dart';
import 'package:sgt_owner/feature/Messages/widgets/starred_messages.dart';
import 'package:sgt_owner/feature/More/checkpoint_screen/checkpoint_detail_screen.dart';
import 'package:sgt_owner/feature/More/checkpoint_screen/checkpoint_history_screen.dart';
import 'package:sgt_owner/feature/More/checkpoint_screen/checkpoint_listing_screen.dart';
import 'package:sgt_owner/feature/More/checkpoint_screen/edit_checkpoint_and_task/views/edit_checkpoint_and_task_screen.dart';
import 'package:sgt_owner/feature/More/guard_attendence_screen/absent_record/view/absent_record.dart';
import 'package:sgt_owner/feature/More/guard_attendence_screen/approved_leaves/view/approved_leaves.dart';
import 'package:sgt_owner/feature/More/guard_attendence_screen/attendence_total_guards.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/add_new_policy.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/leave_policy.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/leaves_listing_screen.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/rejected_leave.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/requested_leave_screen.dart';
import 'package:sgt_owner/feature/More/reports_screen/report_screen.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/add_role/view/add_role.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/role_&_permission_details/view/role_&_permission_details.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/roles_&_permissions/view/roles_and_permission.dart';
import 'package:sgt_owner/feature/More/route_screen/edit_route/views/edit_route_screen.dart';
import 'package:sgt_owner/feature/More/route_screen/route_detail_screen.dart';
import 'package:sgt_owner/feature/More/route_screen/route_listings_screen.dart';
import 'package:sgt_owner/feature/More/route_screen/route_map_screen.dart';
import 'package:sgt_owner/feature/More/settings/activity_log.dart';
import 'package:sgt_owner/feature/More/settings/billing_and_invoice.dart';
import 'package:sgt_owner/feature/More/settings/cancel_subscriptions.dart';
import 'package:sgt_owner/feature/More/settings/feedback.dart';
import 'package:sgt_owner/feature/More/settings/manage_notification.dart';
import 'package:sgt_owner/feature/More/settings/plans.dart';
import 'package:sgt_owner/feature/More/settings/send_application/view/send_application.dart';
import 'package:sgt_owner/feature/More/shifts_screen/edit_shift/views/edit_shift_screen.dart';
import 'package:sgt_owner/feature/More/shifts_screen/shift_detail_screen.dart';
import 'package:sgt_owner/feature/More/shifts_screen/shift_list_screen.dart';
import 'package:sgt_owner/feature/More/staff_screen/add_staff/views/add_staff.dart';
import 'package:sgt_owner/feature/More/staff_screen/staff_profile/views/edit_staff_profile.dart';
import 'package:sgt_owner/feature/More/staff_screen/staff_profile/views/staff_profile.dart';
import 'package:sgt_owner/feature/More/staff_screen/staff_screen.dart';
import 'package:sgt_owner/feature/More/timesheet_screen/day_timesheet/view/day_timesheet.dart';
import 'package:sgt_owner/feature/More/timesheet_screen/month_timesheet/view/month_timesheet.dart';
import 'package:sgt_owner/feature/More/timesheet_screen/timesheet_all_properties.dart';
import 'package:sgt_owner/feature/More/timesheet_screen/week_timesheet/view/week_timesheeet.dart';
import 'package:sgt_owner/feature/Properties/assign_guard/views/assign_guard.dart';
import 'package:sgt_owner/feature/Properties/checkpoint/views/create_checkpoints.dart';
import 'package:sgt_owner/feature/Properties/job_assigned_popup.dart';
import 'package:sgt_owner/feature/Properties/add_new_property_screen.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/manage_property.dart';
import 'package:sgt_owner/feature/Properties/property_creation/views/property_creation.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/feature/Properties/route/views/create_route.dart';
import 'package:sgt_owner/feature/Properties/shift/views/create_shift.dart';
import 'package:sgt_owner/feature/authentication/Privacy_policy/privacy_policy.dart';
import 'package:sgt_owner/feature/authentication/Privacy_policy/terms_and_conditions.dart';
import 'package:sgt_owner/feature/authentication/company_details/views/company_details_screen.dart';
import 'package:sgt_owner/feature/authentication/email_verification/views/email_verification.dart';
import 'package:sgt_owner/feature/authentication/new_password/views/new_password.dart';
import 'package:sgt_owner/feature/authentication/payment/views/apply_coupon_screen.dart';
import 'package:sgt_owner/feature/authentication/payment/views/billing_address_screen.dart';
import 'package:sgt_owner/feature/authentication/payment/views/coupon_applied_popup.dart';
import 'package:sgt_owner/feature/authentication/payment/views/oops_coupon_popup.dart';
import 'package:sgt_owner/feature/authentication/payment/views/payment_screen.dart';
import 'package:sgt_owner/feature/authentication/payment/views/select_plan_screen.dart';
import 'package:sgt_owner/feature/authentication/resetPassword/views/reset_password_screen.dart';
import 'package:sgt_owner/feature/authentication/signup/views/signup_screen.dart';
import 'package:sgt_owner/feature/home_tabs_screen.dart';
import 'package:sgt_owner/views/get_started_screen.dart';
import 'package:sgt_owner/feature/authentication/login/views/login.dart';
import 'package:sgt_owner/views/splash_screen.dart';
import 'package:sgt_owner/views/welcome_screen.dart';

class RouteClass {
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/getStart", page: () => GetStartedScreen()),
    GetPage(name: "/welcome", page: () => WelcomeScreen()),
    GetPage(name: "/login", page: () => LoginPage()),
    GetPage(name: "/reset", page: () => ResetPasswordPage()),
    GetPage(name: "/email_verification", page: () => EmailVerificationPage()),
    GetPage(name: "/new_password", page: () => NewPassword()),
    GetPage(name: "/signup", page: () => SignUpPage()),
    GetPage(name: "/company_details", page: () => CompanyDetailsPage()),
    GetPage(name: "/select_plan", page: () => SelectedPlanPage()),
    GetPage(name: "/billing_address", page: () => BillingAddressPage()),
    GetPage(name: "/payment_details", page: () => PaymentDetailsPage()),
    GetPage(name: "/apply_coupon", page: () => ApplyCouponPage()),
    GetPage(name: "/oops_coupon_popUp", page: () => OopsPopupDialog()),
    GetPage(name: "/coupon_applied_popup", page: () => CouponAppliedDialog()),
    GetPage(name: "/add_new_property_screen", page: () => AddNewPropertyScreen()),
    GetPage(name: "/property_creation", page: () => PropertyCreationPage()),
    GetPage(name: "/property_carousal", page: () => PropertyCarousal()),
    GetPage(name: "/create_shift", page: () => CreateShiftPage()),
    GetPage(name: "/create_checkpoint", page: () => CreateCheckPointPage()),
    GetPage(name: "/create_route", page: () => CreateRoutePage()),
    GetPage(name: "/assign_guard", page: () => AssignGuardPage()),
    GetPage(name: "/job_assigned_popup", page: () => JobAssignedPopup()),
    GetPage(name: "/manage_property_screen", page: () => ManagePropertyScreen()),
    GetPage(name: "/dashboard", page: () => HomeTabsScreens()),
    GetPage(name: "/shift_screen", page: () => ShiftListingScreen()),
    GetPage(name: "/shift_detail", page: () => ShiftDetailScreen()),
    GetPage(name: "/edit_shift", page: () => EditShiftScreen()),
    GetPage(name: "/staff_screen", page: () => StaffScreen()),
    GetPage(name: "/add_staff", page: () => AddStaffPage()),
    GetPage(name: "/staff_profile", page: () => StaffProfile()),
    GetPage(name: "/edit_staff", page: () => EditStaffProfile()),
    GetPage(name: "/checkpoint_listing_screen",page: () => CheckpointListingScreen()),
    GetPage(name: "/checkpoint_detail_screen",page: () => CheckpointDetailScreen()),
    GetPage(name: "/checkpoint_history_screen",page: () => CheckpointHistoryScreen()),
    GetPage(name: "/edit_checkpoint_and_task",page: () => EditCheckpointAndTaskScreen()),
    GetPage(name: "/route_listing_screen", page: () => RouteListingScreen()),
    GetPage(name: "/route_detail_screen", page: () => RouteDetailScreen()),
    GetPage(name: "/edit_route", page: () => EditRouteScreen()),
    GetPage(name: "/route_map_with_checkpoint_screen",page: () => RouteMapWithCheckpointScreen()),
    GetPage(name: "/leave_listing_screen", page: () => LeaveListingScreen()),
    GetPage(name: "/requested_leave_screen", page: () => RequestedLeaveScreen()),
    GetPage(name: "/rejected_leave_screen", page: () => RejectedLeaveScreen()),
    GetPage(name: "/add_new_policy", page: () => AddNewPolicyScreen()),
    GetPage(name: "/roles_and_permission_screen",page: () => RolesAndPermissionsScreen()),
    GetPage(name: "/add_guard_screen", page: () => AddNewGuard()),
    GetPage(name: '/ProfilePage', page: () => const ProfilePage()),
    GetPage(name: '/AddressPage', page: () => const AddressPage()),
    GetPage(name: '/IdCardPage', page: () => const IdCardPage()),
    GetPage(name: '/PasswordPage',page: () => const PasswordPage(),),
    GetPage(name: '/GuardsPage', page: () => const GuardsPage()),
    GetPage(name: '/PropertiesPage', page: () => const PropertiesPage()),
    GetPage(name: '/RoutePage', page: () => const RoutePage()),
    GetPage(name: '/AssignGuard', page: () => const AssignGuard()),
    GetPage(name: '/AllGuards', page: () => AllGuards()),
    GetPage(name: '/GuardProfile', page: () => const GuardProfile()),
    GetPage(name: '/AssignedProperties', page: () => const AssignedProperties()),
    GetPage(name: '/CompletedShifts', page: () => const CompletedShifts()),
    GetPage(name: '/TotalLeaves', page: () => const TotalLeaves()),
    GetPage(name: '/MissedShifts', page: () => const MissedShifts()),
    GetPage(name: '/EditGuardProfile', page: () => const EditGuardProfile()),
    GetPage(name: '/GuardAttendance', page: () => const GuardAttendance()),
    GetPage(name: '/report_screen', page: () => const ReportsScreen()),
    GetPage(name: '/RoleName', page: () => const RoleName()),
    GetPage(name: '/AddRole', page: () => const AddRole()),
    GetPage(name: '/attendence_total_guards',page: () => const AttendenceTotalGuards()),
    GetPage(name: '/AbsentRecord', page: () => const AbsentRecord()),
    GetPage(name: '/ApprovedLeaves', page: () => const ApprovedLeaves()),
    GetPage(name: '/timesheet_totalallproperties_screen',page: () => const TimesheetAllProperties()),
    GetPage(name: '/DayTimesheet', page: () => const DayTimesheet()),
    GetPage(name: '/MonthTimesheet', page: () => const MonthTimesheet()),
    GetPage(name: '/WeekTimesheet', page: () => const WeekTimesheet()),
    GetPage(name: '/LeavePolicyScreen', page: () => LeavePolicyScreen()),
    GetPage(name: '/TermsAndConditions', page: () => TermsAndConditions()),
    GetPage(name: '/PrivacyPolicy', page: () => PrivacyPolicy()),
    GetPage(name: '/ManageNotifications', page: () => ManageNotifications()),
    GetPage(name: '/BillingAndInvoice', page: () => BillingAndInvoice()),
    GetPage(name: '/connect_screen', page: () => ConnectScreen()),
    GetPage(name: '/Feedback', page: () => FeedbackPage()),
    GetPage(name: '/ActivityLog', page: () => ActivityLog()),
    GetPage(name: '/PlansPage', page: () => PlansPage()),
    GetPage(name: '/messangerProfile', page: () => MessangerProfileDetailScreen()),
    GetPage(name: '/starred_messages', page: () => StarredMessegedScreen()),
    GetPage(name: '/shared_items', page: () => ShareItemsScreen()),
    GetPage(name: '/CancelSubscription', page: () => CancelSubscription()),
    GetPage(name: '/SendApplication', page: () => SendApplication()),
  ];
}
