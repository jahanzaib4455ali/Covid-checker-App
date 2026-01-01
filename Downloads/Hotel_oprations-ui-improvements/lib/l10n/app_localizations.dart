import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_th.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('pt'),
    Locale('ru'),
    Locale('ta'),
    Locale('th'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @kunggy.
  ///
  /// In en, this message translates to:
  /// **'kunggy'**
  String get kunggy;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @usernamehint.
  ///
  /// In en, this message translates to:
  /// **'Rahul-123'**
  String get usernamehint;

  /// No description provided for @todayImportantNotices.
  ///
  /// In en, this message translates to:
  /// **'Today Important Notices'**
  String get todayImportantNotices;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @pleaseSelectYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Please select your language'**
  String get pleaseSelectYourLanguage;

  /// No description provided for @heyRajeev.
  ///
  /// In en, this message translates to:
  /// **'Hey Rajeev'**
  String get heyRajeev;

  /// No description provided for @welcomeBackToYourDashboard.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to your dashboard!'**
  String get welcomeBackToYourDashboard;

  /// No description provided for @createTask.
  ///
  /// In en, this message translates to:
  /// **'Create Task'**
  String get createTask;

  /// No description provided for @viewReports.
  ///
  /// In en, this message translates to:
  /// **'View Reports'**
  String get viewReports;

  /// No description provided for @totalCheckIns.
  ///
  /// In en, this message translates to:
  /// **'Total check-ins'**
  String get totalCheckIns;

  /// No description provided for @totalCheckOuts.
  ///
  /// In en, this message translates to:
  /// **'Total check-outs'**
  String get totalCheckOuts;

  /// No description provided for @totalBookings.
  ///
  /// In en, this message translates to:
  /// **'Total bookings'**
  String get totalBookings;

  /// No description provided for @totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total revenue'**
  String get totalRevenue;

  /// No description provided for @roomsAvailable.
  ///
  /// In en, this message translates to:
  /// **'Rooms Available '**
  String get roomsAvailable;

  /// No description provided for @pendingCheckouts.
  ///
  /// In en, this message translates to:
  /// **'Pending check-outs'**
  String get pendingCheckouts;

  /// No description provided for @selectEmployee.
  ///
  /// In en, this message translates to:
  /// **'Select Employee'**
  String get selectEmployee;

  /// No description provided for @selectDepartment.
  ///
  /// In en, this message translates to:
  /// **'Select Department'**
  String get selectDepartment;

  /// No description provided for @selectTask.
  ///
  /// In en, this message translates to:
  /// **'Select Task'**
  String get selectTask;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @roomDustingOnly.
  ///
  /// In en, this message translates to:
  /// **'Room Dusting Only'**
  String get roomDustingOnly;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get submit;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @tasksReports.
  ///
  /// In en, this message translates to:
  /// **'Tasks Reports'**
  String get tasksReports;

  /// No description provided for @securityReport.
  ///
  /// In en, this message translates to:
  /// **'Security Report'**
  String get securityReport;

  /// No description provided for @housekeepingReport.
  ///
  /// In en, this message translates to:
  /// **'Housekeeping Report'**
  String get housekeepingReport;

  /// No description provided for @maintenanceReport.
  ///
  /// In en, this message translates to:
  /// **'Maintenance Report'**
  String get maintenanceReport;

  /// No description provided for @laundryReport.
  ///
  /// In en, this message translates to:
  /// **'Laundry Report'**
  String get laundryReport;

  /// No description provided for @sampleReportDescription.
  ///
  /// In en, this message translates to:
  /// **'In vitae nulla ornare, malesuada urna eget, dictum magna. Nam finibus Eis sapien pharetra lectus pharetra.'**
  String get sampleReportDescription;

  /// No description provided for @foodOrder.
  ///
  /// In en, this message translates to:
  /// **'Food Order'**
  String get foodOrder;

  /// No description provided for @foodOrderFor.
  ///
  /// In en, this message translates to:
  /// **'Food Order For'**
  String get foodOrderFor;

  /// No description provided for @roomTableNo.
  ///
  /// In en, this message translates to:
  /// **'Room Number/Table Number'**
  String get roomTableNo;

  /// No description provided for @chickenTikka.
  ///
  /// In en, this message translates to:
  /// **'Chicken Tikka P...'**
  String get chickenTikka;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @veg.
  ///
  /// In en, this message translates to:
  /// **'Veg'**
  String get veg;

  /// No description provided for @nonVeg.
  ///
  /// In en, this message translates to:
  /// **'Non Veg'**
  String get nonVeg;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @payUsing.
  ///
  /// In en, this message translates to:
  /// **'PAY USING'**
  String get payUsing;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get cashOnDelivery;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @identificationNumber.
  ///
  /// In en, this message translates to:
  /// **'Identification Number'**
  String get identificationNumber;

  /// No description provided for @foodDescription.
  ///
  /// In en, this message translates to:
  /// **'Serving for 3 persons.Cheese chicken, chicken sharealike.chicken Cheese, chicken... read more'**
  String get foodDescription;

  /// No description provided for @foodItem.
  ///
  /// In en, this message translates to:
  /// **'Chicken Tikka Pizza (Medium)'**
  String get foodItem;

  /// No description provided for @foodPrice.
  ///
  /// In en, this message translates to:
  /// **'Medium - Rs. 1180.00'**
  String get foodPrice;

  /// No description provided for @foodItemCount.
  ///
  /// In en, this message translates to:
  /// **'1 item | View Menu'**
  String get foodItemCount;

  /// No description provided for @selectQuantity.
  ///
  /// In en, this message translates to:
  /// **'Select Quantity'**
  String get selectQuantity;

  /// No description provided for @addaRequest.
  ///
  /// In en, this message translates to:
  /// **'Add a request (optional)'**
  String get addaRequest;

  /// No description provided for @writeNote.
  ///
  /// In en, this message translates to:
  /// **'Write Note........'**
  String get writeNote;

  /// No description provided for @addtoCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addtoCart;

  /// No description provided for @cancellationPolicy.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Policy'**
  String get cancellationPolicy;

  /// No description provided for @policy.
  ///
  /// In en, this message translates to:
  /// **'An order cancellation policy provides security to your business in the event that your customer cancels an order. You may reasonably charge a cancellation fee after a certain deadline, covering costs you suffered due to the cancellation.'**
  String get policy;

  /// No description provided for @changeAmenities.
  ///
  /// In en, this message translates to:
  /// **'Change Amenities'**
  String get changeAmenities;

  /// No description provided for @selectRoomNo.
  ///
  /// In en, this message translates to:
  /// **'Select Room No'**
  String get selectRoomNo;

  /// No description provided for @roomType.
  ///
  /// In en, this message translates to:
  /// **'Room Type'**
  String get roomType;

  /// No description provided for @selectItemsYouAdded.
  ///
  /// In en, this message translates to:
  /// **'Select Items You Added:'**
  String get selectItemsYouAdded;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @addedQuantity.
  ///
  /// In en, this message translates to:
  /// **'Added Quantity'**
  String get addedQuantity;

  /// No description provided for @handSanitizer100ml.
  ///
  /// In en, this message translates to:
  /// **'Hand Sanitizer (100ml)'**
  String get handSanitizer100ml;

  /// No description provided for @miniBarRefill.
  ///
  /// In en, this message translates to:
  /// **'Mini Bar Refill'**
  String get miniBarRefill;

  /// No description provided for @redBull250ml.
  ///
  /// In en, this message translates to:
  /// **'RedBull 250ml (4 Pcs)'**
  String get redBull250ml;

  /// No description provided for @howManyAdded.
  ///
  /// In en, this message translates to:
  /// **'How Many Added?'**
  String get howManyAdded;

  /// No description provided for @juice250ml.
  ///
  /// In en, this message translates to:
  /// **'Juice 250ml (4 Pcs)'**
  String get juice250ml;

  /// No description provided for @noCameraPermission.
  ///
  /// In en, this message translates to:
  /// **'No camera permission'**
  String get noCameraPermission;

  /// No description provided for @flashOn.
  ///
  /// In en, this message translates to:
  /// **'Flash On'**
  String get flashOn;

  /// No description provided for @flashOff.
  ///
  /// In en, this message translates to:
  /// **'Flash Off'**
  String get flashOff;

  /// No description provided for @reportIssue.
  ///
  /// In en, this message translates to:
  /// **'Report Issue'**
  String get reportIssue;

  /// No description provided for @writeOrRecordIssue.
  ///
  /// In en, this message translates to:
  /// **'Write or Record Issue'**
  String get writeOrRecordIssue;

  /// No description provided for @writeNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Write Note……'**
  String get writeNoteHint;

  /// No description provided for @voiceToText.
  ///
  /// In en, this message translates to:
  /// **'Voice to Text'**
  String get voiceToText;

  /// No description provided for @tabHousekeeping.
  ///
  /// In en, this message translates to:
  /// **'Housekeeping'**
  String get tabHousekeeping;

  /// No description provided for @tabMyTasks.
  ///
  /// In en, this message translates to:
  /// **'My Tasks'**
  String get tabMyTasks;

  /// No description provided for @tasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasks;

  /// No description provided for @tabDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get tabDone;

  /// No description provided for @dialogSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get dialogSuccess;

  /// No description provided for @qrCodeScannedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'QR Code scanned successfully!'**
  String get qrCodeScannedSuccessfully;

  /// No description provided for @roomVerified.
  ///
  /// In en, this message translates to:
  /// **'Room verified: {code}'**
  String roomVerified(Object code);

  /// No description provided for @buttonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get buttonContinue;

  /// No description provided for @buttonAcceptAndStart.
  ///
  /// In en, this message translates to:
  /// **'Accept & Start'**
  String get buttonAcceptAndStart;

  /// No description provided for @buttonWorkDone.
  ///
  /// In en, this message translates to:
  /// **'Work Done'**
  String get buttonWorkDone;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @guestName.
  ///
  /// In en, this message translates to:
  /// **'Guest Name: '**
  String get guestName;

  /// No description provided for @roomNoLabel.
  ///
  /// In en, this message translates to:
  /// **'Room No: '**
  String get roomNoLabel;

  /// No description provided for @roomStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Room Status:'**
  String get roomStatusLabel;

  /// No description provided for @statusOccupied.
  ///
  /// In en, this message translates to:
  /// **'Occupied'**
  String get statusOccupied;

  /// No description provided for @currentlyWorking.
  ///
  /// In en, this message translates to:
  /// **'Currently Working'**
  String get currentlyWorking;

  /// No description provided for @buttonBreak.
  ///
  /// In en, this message translates to:
  /// **'Break'**
  String get buttonBreak;

  /// No description provided for @brakeTime.
  ///
  /// In en, this message translates to:
  /// **'Total Brake Time'**
  String get brakeTime;

  /// No description provided for @timeDetails.
  ///
  /// In en, this message translates to:
  /// **'Time Details'**
  String get timeDetails;

  /// No description provided for @requestDelay.
  ///
  /// In en, this message translates to:
  /// **'Request Delay'**
  String get requestDelay;

  /// No description provided for @totalIdleTime.
  ///
  /// In en, this message translates to:
  /// **'Total Idle Time'**
  String get totalIdleTime;

  /// No description provided for @todayCheckouts.
  ///
  /// In en, this message translates to:
  /// **'Today Checkouts'**
  String get todayCheckouts;

  /// No description provided for @hintSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get hintSearch;

  /// No description provided for @availForCleaning.
  ///
  /// In en, this message translates to:
  /// **'Avail For Cleaning'**
  String get availForCleaning;

  /// No description provided for @checkoutStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Checkout Status: '**
  String get checkoutStatusLabel;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @checkoutTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Checkout Time: '**
  String get checkoutTimeLabel;

  /// No description provided for @dustingOnly.
  ///
  /// In en, this message translates to:
  /// **'Dusting Only'**
  String get dustingOnly;

  /// No description provided for @fromLabel.
  ///
  /// In en, this message translates to:
  /// **'From:'**
  String get fromLabel;

  /// No description provided for @statusUnoccupied.
  ///
  /// In en, this message translates to:
  /// **'Unoccupied'**
  String get statusUnoccupied;

  /// No description provided for @checkoutToday.
  ///
  /// In en, this message translates to:
  /// **'Checkout Today'**
  String get checkoutToday;

  /// No description provided for @unoccupiedRooms.
  ///
  /// In en, this message translates to:
  /// **'Unoccupied Rooms'**
  String get unoccupiedRooms;

  /// No description provided for @requestIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Request ID : '**
  String get requestIdLabel;

  /// No description provided for @addAmenities.
  ///
  /// In en, this message translates to:
  /// **'Add Amenities'**
  String get addAmenities;

  /// No description provided for @roomStatus.
  ///
  /// In en, this message translates to:
  /// **'Room Status :'**
  String get roomStatus;

  /// No description provided for @ordersQue.
  ///
  /// In en, this message translates to:
  /// **'Orders Que'**
  String get ordersQue;

  /// No description provided for @orderPreparing.
  ///
  /// In en, this message translates to:
  /// **'Order Preparing'**
  String get orderPreparing;

  /// No description provided for @orderCompleted.
  ///
  /// In en, this message translates to:
  /// **'Order Completed'**
  String get orderCompleted;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @orderTime.
  ///
  /// In en, this message translates to:
  /// **'Order Time : '**
  String get orderTime;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity : '**
  String get quantity;

  /// No description provided for @chocolates4Pcs.
  ///
  /// In en, this message translates to:
  /// **'Chocolates (4 Pcs)'**
  String get chocolates4Pcs;

  /// No description provided for @roomServiceRequests.
  ///
  /// In en, this message translates to:
  /// **'Room Service Requests'**
  String get roomServiceRequests;

  /// No description provided for @orderDelivery.
  ///
  /// In en, this message translates to:
  /// **'Order Delivery'**
  String get orderDelivery;

  /// No description provided for @paymentCollection.
  ///
  /// In en, this message translates to:
  /// **'Payment Collection'**
  String get paymentCollection;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get enterAmount;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get selectPaymentMethod;

  /// No description provided for @posCash.
  ///
  /// In en, this message translates to:
  /// **'POS/CASH'**
  String get posCash;

  /// No description provided for @markDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get markDelivered;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'Deliver To:'**
  String get deliverTo;

  /// No description provided for @roomNo.
  ///
  /// In en, this message translates to:
  /// **'Room No:'**
  String get roomNo;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID :'**
  String get orderId;

  /// No description provided for @chickenTikkaPizzas.
  ///
  /// In en, this message translates to:
  /// **'2 Chicken Tikka Pizza\'s'**
  String get chickenTikkaPizzas;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time : '**
  String get time;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method:'**
  String get paymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount:'**
  String get totalAmount;

  /// No description provided for @paymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status:'**
  String get paymentStatus;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @deliveryStatus.
  ///
  /// In en, this message translates to:
  /// **'Delivery Status:'**
  String get deliveryStatus;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @deliveryDetails.
  ///
  /// In en, this message translates to:
  /// **'Delivery Details'**
  String get deliveryDetails;

  /// No description provided for @timer.
  ///
  /// In en, this message translates to:
  /// **'Timer:'**
  String get timer;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty:'**
  String get qty;

  /// No description provided for @assignedto.
  ///
  /// In en, this message translates to:
  /// **'Assigned to: Rahul'**
  String get assignedto;

  /// No description provided for @orderPrice.
  ///
  /// In en, this message translates to:
  /// **'Order Price'**
  String get orderPrice;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @foodOrders.
  ///
  /// In en, this message translates to:
  /// **'Food Orders'**
  String get foodOrders;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @otherOrders.
  ///
  /// In en, this message translates to:
  /// **'Other Orders'**
  String get otherOrders;

  /// No description provided for @prepairingStarted.
  ///
  /// In en, this message translates to:
  /// **'Prepairing Started'**
  String get prepairingStarted;

  /// No description provided for @orderSince.
  ///
  /// In en, this message translates to:
  /// **'Order Since :'**
  String get orderSince;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @additional.
  ///
  /// In en, this message translates to:
  /// **'Additional:  '**
  String get additional;

  /// No description provided for @orderAcceptedBy.
  ///
  /// In en, this message translates to:
  /// **'Order Accepted By: Rahul Kumar '**
  String get orderAcceptedBy;

  /// No description provided for @itemUsedinMiniBar.
  ///
  /// In en, this message translates to:
  /// **'Item Used in Mini Bar'**
  String get itemUsedinMiniBar;

  /// No description provided for @seeNow.
  ///
  /// In en, this message translates to:
  /// **'See Now'**
  String get seeNow;

  /// No description provided for @securityHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get securityHomeTitle;

  /// No description provided for @guestCheckInOut.
  ///
  /// In en, this message translates to:
  /// **'Guest Check in - Check Out'**
  String get guestCheckInOut;

  /// No description provided for @vehiclesInOut.
  ///
  /// In en, this message translates to:
  /// **'Vehicles Incoming - Outgoing'**
  String get vehiclesInOut;

  /// No description provided for @vendorOrderReceived.
  ///
  /// In en, this message translates to:
  /// **'Vendor Order Received'**
  String get vendorOrderReceived;

  /// No description provided for @employeesInOut.
  ///
  /// In en, this message translates to:
  /// **'Employees Incoming - Outgoing'**
  String get employeesInOut;

  /// No description provided for @seeList.
  ///
  /// In en, this message translates to:
  /// **'See List'**
  String get seeList;

  /// No description provided for @guestCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Guest Check-In'**
  String get guestCheckIn;

  /// No description provided for @noOfGuests.
  ///
  /// In en, this message translates to:
  /// **'No. of Guests'**
  String get noOfGuests;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'IN'**
  String get checkIn;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'OUT'**
  String get checkOut;

  /// No description provided for @incomingHistory.
  ///
  /// In en, this message translates to:
  /// **'Incoming  History'**
  String get incomingHistory;

  /// No description provided for @outgoingHistory.
  ///
  /// In en, this message translates to:
  /// **'Outgoing History'**
  String get outgoingHistory;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @vehicleNo.
  ///
  /// In en, this message translates to:
  /// **'Vehicle No'**
  String get vehicleNo;

  /// No description provided for @driverName.
  ///
  /// In en, this message translates to:
  /// **'Driver Name'**
  String get driverName;

  /// No description provided for @purpose.
  ///
  /// In en, this message translates to:
  /// **'Purpose'**
  String get purpose;

  /// No description provided for @gateNo.
  ///
  /// In en, this message translates to:
  /// **'Gate No'**
  String get gateNo;

  /// No description provided for @employeeInOut.
  ///
  /// In en, this message translates to:
  /// **'Employee Incoming - Outgoing'**
  String get employeeInOut;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department : '**
  String get department;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// No description provided for @priceAgreed.
  ///
  /// In en, this message translates to:
  /// **'Price Agreed'**
  String get priceAgreed;

  /// No description provided for @dispatchOrder.
  ///
  /// In en, this message translates to:
  /// **'Dispatch Order'**
  String get dispatchOrder;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @employeeName.
  ///
  /// In en, this message translates to:
  /// **'Employee Name : '**
  String get employeeName;

  /// No description provided for @gatepassNo.
  ///
  /// In en, this message translates to:
  /// **'Gatepass No :'**
  String get gatepassNo;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'Employee ID : '**
  String get id;

  /// No description provided for @out.
  ///
  /// In en, this message translates to:
  /// **'OUT'**
  String get out;

  /// No description provided for @inButton.
  ///
  /// In en, this message translates to:
  /// **'IN'**
  String get inButton;

  /// No description provided for @bookingName.
  ///
  /// In en, this message translates to:
  /// **'Booking Name'**
  String get bookingName;

  /// No description provided for @checkInDate.
  ///
  /// In en, this message translates to:
  /// **'Check-in Date'**
  String get checkInDate;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @indian.
  ///
  /// In en, this message translates to:
  /// **'Indian'**
  String get indian;

  /// No description provided for @incomingVehicles.
  ///
  /// In en, this message translates to:
  /// **'Incoming Vehicles'**
  String get incomingVehicles;

  /// No description provided for @todayHistory.
  ///
  /// In en, this message translates to:
  /// **'Today History'**
  String get todayHistory;

  /// No description provided for @todayVehicleInOutHistory.
  ///
  /// In en, this message translates to:
  /// **'Today vehicle in-out history'**
  String get todayVehicleInOutHistory;

  /// No description provided for @vehicleNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Number'**
  String get vehicleNumber;

  /// No description provided for @securityGuardName.
  ///
  /// In en, this message translates to:
  /// **'Security Guard Name'**
  String get securityGuardName;

  /// No description provided for @incomingEmployees.
  ///
  /// In en, this message translates to:
  /// **'Incoming Employees'**
  String get incomingEmployees;

  /// No description provided for @outgoingEmployees.
  ///
  /// In en, this message translates to:
  /// **'Outgoing Employees'**
  String get outgoingEmployees;

  /// No description provided for @employeeRules.
  ///
  /// In en, this message translates to:
  /// **'Employee Rules & Regulations'**
  String get employeeRules;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @cook.
  ///
  /// In en, this message translates to:
  /// **'cook'**
  String get cook;

  /// No description provided for @roomService.
  ///
  /// In en, this message translates to:
  /// **'Room Service'**
  String get roomService;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @basicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// No description provided for @employeeId.
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get employeeId;

  /// No description provided for @workLocation.
  ///
  /// In en, this message translates to:
  /// **'Work Location'**
  String get workLocation;

  /// No description provided for @workSchedule.
  ///
  /// In en, this message translates to:
  /// **'Work Schedule'**
  String get workSchedule;

  /// No description provided for @joiningDate.
  ///
  /// In en, this message translates to:
  /// **'Joining Date'**
  String get joiningDate;

  /// No description provided for @employeeStatus.
  ///
  /// In en, this message translates to:
  /// **'Employee Status'**
  String get employeeStatus;

  /// No description provided for @fullTime.
  ///
  /// In en, this message translates to:
  /// **'Full Time'**
  String get fullTime;

  /// No description provided for @occupationalInformation.
  ///
  /// In en, this message translates to:
  /// **'Occupational Information'**
  String get occupationalInformation;

  /// No description provided for @qualification.
  ///
  /// In en, this message translates to:
  /// **'Qualification'**
  String get qualification;

  /// No description provided for @designation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get designation;

  /// No description provided for @departments.
  ///
  /// In en, this message translates to:
  /// **'Departments'**
  String get departments;

  /// No description provided for @reportingTo.
  ///
  /// In en, this message translates to:
  /// **'Reporting To'**
  String get reportingTo;

  /// No description provided for @mainBranch.
  ///
  /// In en, this message translates to:
  /// **'Main Branch'**
  String get mainBranch;

  /// No description provided for @bwEngineering.
  ///
  /// In en, this message translates to:
  /// **'BW Engineering'**
  String get bwEngineering;

  /// No description provided for @generalManager.
  ///
  /// In en, this message translates to:
  /// **'General Manager'**
  String get generalManager;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @ceo.
  ///
  /// In en, this message translates to:
  /// **'CEO'**
  String get ceo;

  /// No description provided for @guestReview.
  ///
  /// In en, this message translates to:
  /// **'Guest Review:'**
  String get guestReview;

  /// No description provided for @reportedBy.
  ///
  /// In en, this message translates to:
  /// **'Reported By'**
  String get reportedBy;

  /// No description provided for @urgent.
  ///
  /// In en, this message translates to:
  /// **'urgent'**
  String get urgent;

  /// No description provided for @allItems.
  ///
  /// In en, this message translates to:
  /// **'All Items'**
  String get allItems;

  /// No description provided for @roti.
  ///
  /// In en, this message translates to:
  /// **'Roti'**
  String get roti;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// No description provided for @thai.
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get thai;

  /// No description provided for @pmsOperations.
  ///
  /// In en, this message translates to:
  /// **'PMS Operations'**
  String get pmsOperations;

  /// No description provided for @loginnote.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Please enter your login details'**
  String get loginnote;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'it',
        'pt',
        'ru',
        'ta',
        'th',
        'ur',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'ta':
      return AppLocalizationsTa();
    case 'th':
      return AppLocalizationsTh();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
