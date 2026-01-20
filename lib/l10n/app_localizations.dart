import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
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
    Locale('en'),
    Locale('es'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @loginIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginIn;

  /// No description provided for @frontDeskMode.
  ///
  /// In en, this message translates to:
  /// **'Front Desk Mode'**
  String get frontDeskMode;

  /// No description provided for @connectAReader.
  ///
  /// In en, this message translates to:
  /// **'Connect a Reader'**
  String get connectAReader;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @selectACardReaderToConnect.
  ///
  /// In en, this message translates to:
  /// **'Select a card reader to connect this device'**
  String get selectACardReaderToConnect;

  /// No description provided for @searchingForReaders.
  ///
  /// In en, this message translates to:
  /// **'Searching for readers...'**
  String get searchingForReaders;

  /// No description provided for @makeSureYourReaderIsPowered.
  ///
  /// In en, this message translates to:
  /// **'Make sure your reader is powered on and in pairing mode.'**
  String get makeSureYourReaderIsPowered;

  /// No description provided for @cardReaderDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Card Reader Disconnected'**
  String get cardReaderDisconnected;

  /// No description provided for @cardReaderDisconnectedDescription.
  ///
  /// In en, this message translates to:
  /// **'The card reader has been successfully disconnected from the terminal.'**
  String get cardReaderDisconnectedDescription;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cardReaderInformation.
  ///
  /// In en, this message translates to:
  /// **'Card Reader Information'**
  String get cardReaderInformation;

  /// No description provided for @batteryLevel.
  ///
  /// In en, this message translates to:
  /// **'Battery level:'**
  String get batteryLevel;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @deviceType.
  ///
  /// In en, this message translates to:
  /// **'Device Type'**
  String get deviceType;

  /// No description provided for @serialNumber.
  ///
  /// In en, this message translates to:
  /// **'Serial Number:'**
  String get serialNumber;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @discoveringCardReaders.
  ///
  /// In en, this message translates to:
  /// **'Discovering Card Readers'**
  String get discoveringCardReaders;

  /// No description provided for @searchingForAvailableM2CardReaders.
  ///
  /// In en, this message translates to:
  /// **'Searching for available M2 card readers...\n\nMake sure your card reader is:\n• Powered on\n• In pairing mode\n• Within Bluetooth range'**
  String get searchingForAvailableM2CardReaders;

  /// No description provided for @deviceInformation.
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get deviceInformation;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location:'**
  String get location;

  /// No description provided for @terminalId.
  ///
  /// In en, this message translates to:
  /// **'Terminal ID:'**
  String get terminalId;

  /// No description provided for @discoveringDevices.
  ///
  /// In en, this message translates to:
  /// **'Discovering Devices'**
  String get discoveringDevices;

  /// No description provided for @discoveringDevicesDescription.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we search for available devices...'**
  String get discoveringDevicesDescription;

  /// No description provided for @searching.
  ///
  /// In en, this message translates to:
  /// **'Searching...'**
  String get searching;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred.'**
  String get unknownError;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'General Error'**
  String get generalError;

  /// No description provided for @critical.
  ///
  /// In en, this message translates to:
  /// **'critical'**
  String get critical;

  /// No description provided for @fatal.
  ///
  /// In en, this message translates to:
  /// **'fatal'**
  String get fatal;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'warning'**
  String get warning;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'network'**
  String get network;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'payment'**
  String get payment;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'device'**
  String get device;

  /// No description provided for @ashtraTerminal.
  ///
  /// In en, this message translates to:
  /// **'Ashtra Terminal'**
  String get ashtraTerminal;

  /// No description provided for @connectTo.
  ///
  /// In en, this message translates to:
  /// **'Connect to'**
  String get connectTo;

  /// No description provided for @noReaderConnect.
  ///
  /// In en, this message translates to:
  /// **'No reader connected'**
  String get noReaderConnect;

  /// No description provided for @connectReader.
  ///
  /// In en, this message translates to:
  /// **'Connect Reader'**
  String get connectReader;

  /// No description provided for @disconnectReader.
  ///
  /// In en, this message translates to:
  /// **'Disconnect Reader'**
  String get disconnectReader;

  /// No description provided for @quickAmounts.
  ///
  /// In en, this message translates to:
  /// **'Quick Amounts'**
  String get quickAmounts;

  /// No description provided for @readCard.
  ///
  /// In en, this message translates to:
  /// **'Read Card'**
  String get readCard;

  /// No description provided for @completePayment.
  ///
  /// In en, this message translates to:
  /// **'Complete Payment'**
  String get completePayment;

  /// No description provided for @serviceAmount.
  ///
  /// In en, this message translates to:
  /// **'Service Amount'**
  String get serviceAmount;

  /// No description provided for @tipCanBeAddedNext.
  ///
  /// In en, this message translates to:
  /// **'(Tip can be added next)'**
  String get tipCanBeAddedNext;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processing;

  /// No description provided for @howToFix.
  ///
  /// In en, this message translates to:
  /// **'How to fix this:'**
  String get howToFix;

  /// No description provided for @toEnsureReliablePayments.
  ///
  /// In en, this message translates to:
  /// **'To ensure reliable payments, charge your M2 device to at least 20% battery.'**
  String get toEnsureReliablePayments;

  /// No description provided for @permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @continues.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// No description provided for @refreshStatus.
  ///
  /// In en, this message translates to:
  /// **'Refresh Status'**
  String get refreshStatus;

  /// No description provided for @locationAccess.
  ///
  /// In en, this message translates to:
  /// **'Location Access'**
  String get locationAccess;

  /// No description provided for @phoneAccess.
  ///
  /// In en, this message translates to:
  /// **'Phone Access'**
  String get phoneAccess;

  /// No description provided for @bluetoothAccess.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth Access'**
  String get bluetoothAccess;

  /// No description provided for @cameraAccess.
  ///
  /// In en, this message translates to:
  /// **'Camera Access'**
  String get cameraAccess;

  /// No description provided for @bluetoothScan.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth Scan'**
  String get bluetoothScan;

  /// No description provided for @bluetoothConnect.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth Connect'**
  String get bluetoothConnect;

  /// No description provided for @locationAccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Required to discover nearby card readers'**
  String get locationAccessDescription;

  /// No description provided for @phoneAccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Required for device identification and calls if needed'**
  String get phoneAccessDescription;

  /// No description provided for @cameraAccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Required for QR code scanning and reader setup'**
  String get cameraAccessDescription;

  /// No description provided for @bluetoothAccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Required to connect to Bluetooth card readers'**
  String get bluetoothAccessDescription;

  /// No description provided for @bluetoothScanDescription.
  ///
  /// In en, this message translates to:
  /// **'Required to scan for Bluetooth devices'**
  String get bluetoothScanDescription;

  /// No description provided for @blueetoothConnectAccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Required to connect Bluetooth devices'**
  String get blueetoothConnectAccessDescription;

  /// No description provided for @requiredForAppFunctionality.
  ///
  /// In en, this message translates to:
  /// **'Required for app functionality'**
  String get requiredForAppFunctionality;

  /// No description provided for @enterThe6DigitCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code on your terminal device'**
  String get enterThe6DigitCode;

  /// No description provided for @enterThe6DigitPairingCode.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit pairing code'**
  String get enterThe6DigitPairingCode;

  /// No description provided for @pair.
  ///
  /// In en, this message translates to:
  /// **'Pair'**
  String get pair;

  /// No description provided for @codeAndQRCodeUpdateEvery2Minute.
  ///
  /// In en, this message translates to:
  /// **'Code and QR Code updated every 2 minutes'**
  String get codeAndQRCodeUpdateEvery2Minute;

  /// No description provided for @pairTerminal.
  ///
  /// In en, this message translates to:
  /// **'Pair Terminal'**
  String get pairTerminal;

  /// No description provided for @selectQRCodeToPairTerminal.
  ///
  /// In en, this message translates to:
  /// **'Select QR Code to Pair Terminal'**
  String get selectQRCodeToPairTerminal;

  /// No description provided for @scanTheQRCodeDisplayedOnTheAdminPanel.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code displayed on the admin panel to pair the device with your salon terminal.'**
  String get scanTheQRCodeDisplayedOnTheAdminPanel;

  /// No description provided for @searchingForReader.
  ///
  /// In en, this message translates to:
  /// **'Searching for readers...'**
  String get searchingForReader;

  /// No description provided for @turnOnYourDeviceOrPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Turn on your device or please try again.'**
  String get turnOnYourDeviceOrPleaseTryAgain;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @bluetoothDisabled.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is disabled'**
  String get bluetoothDisabled;

  /// No description provided for @pleaseEnableBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Please enable Bluetooth to search for card readers.'**
  String get pleaseEnableBluetooth;

  /// No description provided for @establishingConnection.
  ///
  /// In en, this message translates to:
  /// **'Establishing connection...'**
  String get establishingConnection;

  /// No description provided for @readerId.
  ///
  /// In en, this message translates to:
  /// **'Reader ID:'**
  String get readerId;

  /// No description provided for @deviceUpdateInProgress.
  ///
  /// In en, this message translates to:
  /// **'Device Update in Progress'**
  String get deviceUpdateInProgress;

  /// No description provided for @updateDevice.
  ///
  /// In en, this message translates to:
  /// **'Updating device...'**
  String get updateDevice;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @updateToVersion.
  ///
  /// In en, this message translates to:
  /// **'Updating to version'**
  String get updateToVersion;

  /// No description provided for @pleaseWaitDoNotDisconnectTheDevice.
  ///
  /// In en, this message translates to:
  /// **'Please wait, do not disconnect the device'**
  String get pleaseWaitDoNotDisconnectTheDevice;

  /// No description provided for @signatureRequired.
  ///
  /// In en, this message translates to:
  /// **'Signature Required'**
  String get signatureRequired;

  /// No description provided for @paymentSummary.
  ///
  /// In en, this message translates to:
  /// **'Payment Summary'**
  String get paymentSummary;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal:'**
  String get subtotal;

  /// No description provided for @tip.
  ///
  /// In en, this message translates to:
  /// **'Tip:'**
  String get tip;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get total;

  /// No description provided for @pleaseSignBelow.
  ///
  /// In en, this message translates to:
  /// **'Please sign below to authorize payment'**
  String get pleaseSignBelow;

  /// No description provided for @clearSignature.
  ///
  /// In en, this message translates to:
  /// **'Clear Signature'**
  String get clearSignature;

  /// No description provided for @terminalSetupRequired.
  ///
  /// In en, this message translates to:
  /// **'Terminal Setup Required'**
  String get terminalSetupRequired;

  /// No description provided for @thisTerminalNeedsToBePaired.
  ///
  /// In en, this message translates to:
  /// **'This terminal needs to be paired with your business account to get started.'**
  String get thisTerminalNeedsToBePaired;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @terminalSetting.
  ///
  /// In en, this message translates to:
  /// **'Terminal Settings'**
  String get terminalSetting;

  /// No description provided for @connectCardReader.
  ///
  /// In en, this message translates to:
  /// **'Connect Card Reader'**
  String get connectCardReader;

  /// No description provided for @searchAndConnectM2CardReader.
  ///
  /// In en, this message translates to:
  /// **'Search and connect M2 card reader'**
  String get searchAndConnectM2CardReader;

  /// No description provided for @cardReaderInfo.
  ///
  /// In en, this message translates to:
  /// **'Card Reader Info'**
  String get cardReaderInfo;

  /// No description provided for @connectedCardReaderInfo.
  ///
  /// In en, this message translates to:
  /// **'View connected card reader info'**
  String get connectedCardReaderInfo;

  /// No description provided for @disconnectCardReader.
  ///
  /// In en, this message translates to:
  /// **'Disconnect Card Reader'**
  String get disconnectCardReader;

  /// No description provided for @disconnectTheConnectedCardReader.
  ///
  /// In en, this message translates to:
  /// **'Disconnect the connected card reader'**
  String get disconnectTheConnectedCardReader;

  /// No description provided for @displaySettings.
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get displaySettings;

  /// No description provided for @configureWhatToShowOnDashboard.
  ///
  /// In en, this message translates to:
  /// **'Configure what to show on dashboard'**
  String get configureWhatToShowOnDashboard;

  /// No description provided for @scanCheckInQRCode.
  ///
  /// In en, this message translates to:
  /// **'Scan Check-in QR Code'**
  String get scanCheckInQRCode;

  /// No description provided for @scanCustomerQRCode.
  ///
  /// In en, this message translates to:
  /// **'Scan customer QR code for check-in'**
  String get scanCustomerQRCode;

  /// No description provided for @testPayment.
  ///
  /// In en, this message translates to:
  /// **'Test Payment'**
  String get testPayment;

  /// No description provided for @processingTestPayment.
  ///
  /// In en, this message translates to:
  /// **'Processing a test payment'**
  String get processingTestPayment;

  /// No description provided for @refreshAllData.
  ///
  /// In en, this message translates to:
  /// **'Refresh All Data'**
  String get refreshAllData;

  /// No description provided for @reloadWaitinglistAndServicesData.
  ///
  /// In en, this message translates to:
  /// **'Reload waitinglist, services, and status'**
  String get reloadWaitinglistAndServicesData;

  /// No description provided for @removeDeviceTerminal.
  ///
  /// In en, this message translates to:
  /// **'Remove Device Terminal'**
  String get removeDeviceTerminal;

  /// No description provided for @clearAllDataAndReturnToHome.
  ///
  /// In en, this message translates to:
  /// **'Clear all data and return to home screen'**
  String get clearAllDataAndReturnToHome;

  /// No description provided for @addToWishlist.
  ///
  /// In en, this message translates to:
  /// **'Add to Wishlist'**
  String get addToWishlist;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @displaySettingsSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Display settings saved successfully'**
  String get displaySettingsSavedSuccessfully;

  /// No description provided for @failedToSaveSettings.
  ///
  /// In en, this message translates to:
  /// **'Failed to save settings:'**
  String get failedToSaveSettings;

  /// No description provided for @showWaitingList.
  ///
  /// In en, this message translates to:
  /// **'Show Waiting List'**
  String get showWaitingList;

  /// No description provided for @displayCustomerWaitingListDashboard.
  ///
  /// In en, this message translates to:
  /// **'Display customer waiting list on dashboard'**
  String get displayCustomerWaitingListDashboard;

  /// No description provided for @showServiceList.
  ///
  /// In en, this message translates to:
  /// **'Show Service List'**
  String get showServiceList;

  /// No description provided for @displayAvailableService.
  ///
  /// In en, this message translates to:
  /// **'Display available services'**
  String get displayAvailableService;

  /// No description provided for @showServicePrices.
  ///
  /// In en, this message translates to:
  /// **'Show Service Prices'**
  String get showServicePrices;

  /// No description provided for @displayPriceInformation.
  ///
  /// In en, this message translates to:
  /// **'Display pricing information'**
  String get displayPriceInformation;

  /// No description provided for @showServiceDuration.
  ///
  /// In en, this message translates to:
  /// **'Show Service Duration'**
  String get showServiceDuration;

  /// No description provided for @advancedSettings.
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings'**
  String get advancedSettings;

  /// No description provided for @groupServicesByCategory.
  ///
  /// In en, this message translates to:
  /// **'Group Services by Category'**
  String get groupServicesByCategory;

  /// No description provided for @organizeServiceIntoCategories.
  ///
  /// In en, this message translates to:
  /// **'Organize services into categories'**
  String get organizeServiceIntoCategories;

  /// No description provided for @showEstimatedWaitTime.
  ///
  /// In en, this message translates to:
  /// **'Show Estimated Wait Time'**
  String get showEstimatedWaitTime;

  /// No description provided for @displayExpectedWaitingTimeForCustomer.
  ///
  /// In en, this message translates to:
  /// **'Display expected waiting time for customers'**
  String get displayExpectedWaitingTimeForCustomer;

  /// No description provided for @refreshInterval.
  ///
  /// In en, this message translates to:
  /// **'Refresh Interval (seconds)'**
  String get refreshInterval;

  /// No description provided for @howOftenToUpdateWaitingList.
  ///
  /// In en, this message translates to:
  /// **'How often to update waiting list'**
  String get howOftenToUpdateWaitingList;

  /// No description provided for @maxWaitingListItems.
  ///
  /// In en, this message translates to:
  /// **'Max Waiting List Items'**
  String get maxWaitingListItems;

  /// No description provided for @maximumNumberOfCustomerToShow.
  ///
  /// In en, this message translates to:
  /// **'Maximum number of customers to show'**
  String get maximumNumberOfCustomerToShow;

  /// No description provided for @pointTheCameraAtTheCustomer.
  ///
  /// In en, this message translates to:
  /// **'Point the camera at the customer\'s QR code to check them in'**
  String get pointTheCameraAtTheCustomer;

  /// No description provided for @processingQrCode.
  ///
  /// In en, this message translates to:
  /// **'Processing QR Code...'**
  String get processingQrCode;

  /// No description provided for @cameraPermissionRequiredToQRCodes.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan QR codes'**
  String get cameraPermissionRequiredToQRCodes;

  /// No description provided for @cameraPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission Required'**
  String get cameraPermissionRequired;

  /// No description provided for @pleaseEnableCameraAccessInYourDevice.
  ///
  /// In en, this message translates to:
  /// **'Please enable camera access in your device settings to scan QR codes for check-in.'**
  String get pleaseEnableCameraAccessInYourDevice;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @invalidQrCodeFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code format'**
  String get invalidQrCodeFormat;

  /// No description provided for @invalidQrCodeMissingInformation.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code: Missing required information'**
  String get invalidQrCodeMissingInformation;

  /// No description provided for @customerCheckedInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer checked in successfully!'**
  String get customerCheckedInSuccessfully;

  /// No description provided for @failedToCheckInCustomerPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Failed to check in customer. Please try again.'**
  String get failedToCheckInCustomerPleaseTryAgain;

  /// No description provided for @addATip.
  ///
  /// In en, this message translates to:
  /// **'Add a Tip?'**
  String get addATip;

  /// No description provided for @serviceProviders.
  ///
  /// In en, this message translates to:
  /// **'Service providers'**
  String get serviceProviders;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'services'**
  String get services;

  /// No description provided for @noTip.
  ///
  /// In en, this message translates to:
  /// **'No Tip'**
  String get noTip;

  /// No description provided for @customTip.
  ///
  /// In en, this message translates to:
  /// **'Custom Tip'**
  String get customTip;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmount;

  /// No description provided for @enterCustomTipAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Custom Tip Amount'**
  String get enterCustomTipAmount;

  /// No description provided for @tipAmount.
  ///
  /// In en, this message translates to:
  /// **'Tip Amount'**
  String get tipAmount;

  /// No description provided for @kioskMode.
  ///
  /// In en, this message translates to:
  /// **'Kiosk mode:'**
  String get kioskMode;

  /// No description provided for @errorCheckingKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Error checking kiosk mode:'**
  String get errorCheckingKioskMode;

  /// No description provided for @startKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Starting kiosk mode...'**
  String get startKioskMode;

  /// No description provided for @kioskModeStartedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Kiosk mode started successfully'**
  String get kioskModeStartedSuccessfully;

  /// No description provided for @failedToStartKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Failed to start kiosk mode:'**
  String get failedToStartKioskMode;

  /// No description provided for @stoppingKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Stopping kiosk mode...'**
  String get stoppingKioskMode;

  /// No description provided for @kioskModeStoppedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Kiosk mode stopped successfully'**
  String get kioskModeStoppedSuccessfully;

  /// No description provided for @failedToStopKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Failed to stop kiosk mode:'**
  String get failedToStopKioskMode;

  /// No description provided for @deviceManagedKiosk.
  ///
  /// In en, this message translates to:
  /// **'Device managed kiosk:'**
  String get deviceManagedKiosk;

  /// No description provided for @errorCheckingManagedKiosk.
  ///
  /// In en, this message translates to:
  /// **'Error checking managed kiosk:'**
  String get errorCheckingManagedKiosk;

  /// No description provided for @noServicesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No services available'**
  String get noServicesAvailable;

  /// No description provided for @waitingList.
  ///
  /// In en, this message translates to:
  /// **'Waiting list'**
  String get waitingList;

  /// No description provided for @noCustomersWaiting.
  ///
  /// In en, this message translates to:
  /// **'No customers waiting'**
  String get noCustomersWaiting;

  /// No description provided for @appointmentsWillAppearHereWhenCustomersArrive.
  ///
  /// In en, this message translates to:
  /// **'Appointments will appear here when customers arrive'**
  String get appointmentsWillAppearHereWhenCustomersArrive;

  /// No description provided for @withs.
  ///
  /// In en, this message translates to:
  /// **'With:'**
  String get withs;

  /// No description provided for @timeLeft.
  ///
  /// In en, this message translates to:
  /// **'Time Left\n'**
  String get timeLeft;

  /// No description provided for @noSpecificActionSuggested.
  ///
  /// In en, this message translates to:
  /// **'No specific action suggested. Contact support if the issue persists.'**
  String get noSpecificActionSuggested;

  /// No description provided for @unknows1.
  ///
  /// In en, this message translates to:
  /// **'Unknown Error'**
  String get unknows1;

  /// No description provided for @unknownErrorPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get unknownErrorPleaseTryAgain;

  /// No description provided for @errorCode.
  ///
  /// In en, this message translates to:
  /// **'ERROR CODE'**
  String get errorCode;

  /// No description provided for @deviceStatus.
  ///
  /// In en, this message translates to:
  /// **'Error Details'**
  String get deviceStatus;

  /// No description provided for @suggestAction.
  ///
  /// In en, this message translates to:
  /// **'Suggested Action'**
  String get suggestAction;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @errorDetails.
  ///
  /// In en, this message translates to:
  /// **'Error Details'**
  String get errorDetails;

  /// No description provided for @reader.
  ///
  /// In en, this message translates to:
  /// **'Reader'**
  String get reader;

  /// No description provided for @createPaymentIntent.
  ///
  /// In en, this message translates to:
  /// **'Creating payment intent...'**
  String get createPaymentIntent;

  /// No description provided for @processingPayment.
  ///
  /// In en, this message translates to:
  /// **'Processing payment...'**
  String get processingPayment;

  /// No description provided for @paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment successful!'**
  String get paymentSuccessful;

  /// No description provided for @pleasePresentCard.
  ///
  /// In en, this message translates to:
  /// **'Please present card...'**
  String get pleasePresentCard;

  /// No description provided for @cardReaderNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Card reading not implemented yet. Use payment flow instead.'**
  String get cardReaderNotImplemented;

  /// No description provided for @paymentFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed'**
  String get paymentFailed;

  /// No description provided for @cardNotSupport.
  ///
  /// In en, this message translates to:
  /// **'Card Not Supported\n\nThis card doesn\'t have chip payment apps. Please:\n• Try a different card with an EMV chip\n• Use a chip-enabled credit or debit card\n• Insert the card instead of tapping'**
  String get cardNotSupport;

  /// No description provided for @cardReadingFailed.
  ///
  /// In en, this message translates to:
  /// **'Card Reading Failed\n\nPlease try:\n• Insert the card fully into the chip reader\n• Hold contactless cards steady for 2-3 seconds\n• Clean the card and try again\n• Use a different card'**
  String get cardReadingFailed;

  /// No description provided for @paymentDeclined.
  ///
  /// In en, this message translates to:
  /// **'Payment Declined\n\nThe card was declined. Please:\n• Try a different payment method\n• Contact your bank\n• Check available balance'**
  String get paymentDeclined;

  /// No description provided for @lowBatteryWarning1.
  ///
  /// In en, this message translates to:
  /// **'Low Battery Warning\n\nThe card reader battery is critically low'**
  String get lowBatteryWarning1;

  /// No description provided for @lowBatteryWarning2.
  ///
  /// In en, this message translates to:
  /// **'Please:\n• Charge the M2 device to 20%+\n• Connect the charging cable\n• Wait for charging before processing payments'**
  String get lowBatteryWarning2;

  /// No description provided for @readerDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Reader Disconnected\n\nThe M2 card reader is not connected. Please:\n• Check Bluetooth connection\n• Reconnect the M2 device\n• Ensure reader is powered on'**
  String get readerDisconnected;

  /// No description provided for @pleaseTryAgainOrSupport.
  ///
  /// In en, this message translates to:
  /// **'Please try again or contact support.'**
  String get pleaseTryAgainOrSupport;

  /// No description provided for @paymentError.
  ///
  /// In en, this message translates to:
  /// **'Payment Error'**
  String get paymentError;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected Error'**
  String get unexpectedError;

  /// No description provided for @pleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again.'**
  String get pleaseTryAgain;

  /// No description provided for @useAChipEnabledCreditOrDebitCard.
  ///
  /// In en, this message translates to:
  /// **'Use a chip-enabled credit or debit card'**
  String get useAChipEnabledCreditOrDebitCard;

  /// No description provided for @tryInsertingTheCardInsteadOfTapping.
  ///
  /// In en, this message translates to:
  /// **'Try inserting the card instead of tapping'**
  String get tryInsertingTheCardInsteadOfTapping;

  /// No description provided for @ensureTheCardHasAnEMVChip.
  ///
  /// In en, this message translates to:
  /// **'Ensure the card has an EMV chip (small square on front)'**
  String get ensureTheCardHasAnEMVChip;

  /// No description provided for @contactYourBank.
  ///
  /// In en, this message translates to:
  /// **'Contact your bank if the card should work'**
  String get contactYourBank;

  /// No description provided for @insertTheCardFullyAndLeaveItInTheReader.
  ///
  /// In en, this message translates to:
  /// **'Insert the card fully and leave it in the reader'**
  String get insertTheCardFullyAndLeaveItInTheReader;

  /// No description provided for @cleanTheCardChipAndMagneticStrip.
  ///
  /// In en, this message translates to:
  /// **'Clean the card\'s chip and magnetic stripe'**
  String get cleanTheCardChipAndMagneticStrip;

  /// No description provided for @holdContactlessCardsSteadyFor2To3Seconds.
  ///
  /// In en, this message translates to:
  /// **'Hold contactless cards steady for 2-3 seconds'**
  String get holdContactlessCardsSteadyFor2To3Seconds;

  /// No description provided for @tryADifferentCardIfIssuesPersist.
  ///
  /// In en, this message translates to:
  /// **'Try a different card if issues persist'**
  String get tryADifferentCardIfIssuesPersist;

  /// No description provided for @checkYourAccountBalance.
  ///
  /// In en, this message translates to:
  /// **'Check your account balance'**
  String get checkYourAccountBalance;

  /// No description provided for @contactYourBankToVerifyTheCardIsActive.
  ///
  /// In en, this message translates to:
  /// **'Contact your bank to verify the card is active'**
  String get contactYourBankToVerifyTheCardIsActive;

  /// No description provided for @tryADifferentPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Try a different payment method'**
  String get tryADifferentPaymentMethod;

  /// No description provided for @ensureTheCardHasNotExpired.
  ///
  /// In en, this message translates to:
  /// **'Ensure the card hasn\'t expired'**
  String get ensureTheCardHasNotExpired;

  /// No description provided for @chargeTheM2DeviceToAtLeast20Percent.
  ///
  /// In en, this message translates to:
  /// **'Charge the M2 device to at least 20%'**
  String get chargeTheM2DeviceToAtLeast20Percent;

  /// No description provided for @connectTheChargingCableAndWait.
  ///
  /// In en, this message translates to:
  /// **'Connect the charging cable and wait'**
  String get connectTheChargingCableAndWait;

  /// No description provided for @useADifferentPaymentMethodWhileCharging.
  ///
  /// In en, this message translates to:
  /// **'Use a different payment method while charging'**
  String get useADifferentPaymentMethodWhileCharging;

  /// No description provided for @checkTheChargingIndicatorLight.
  ///
  /// In en, this message translates to:
  /// **'Check the charging indicator light'**
  String get checkTheChargingIndicatorLight;

  /// No description provided for @checkBluetoothConnectionOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Check Bluetooth connection on this device'**
  String get checkBluetoothConnectionOnThisDevice;

  /// No description provided for @powerCycleTheM2Reader.
  ///
  /// In en, this message translates to:
  /// **'Power cycle the M2 reader (turn off/on)'**
  String get powerCycleTheM2Reader;

  /// No description provided for @moveCloserToTheM2Reader.
  ///
  /// In en, this message translates to:
  /// **'Move closer to the M2 reader'**
  String get moveCloserToTheM2Reader;

  /// No description provided for @restartTheAppIfConnectionIssuesPersist.
  ///
  /// In en, this message translates to:
  /// **'Restart the app if connection issues persist'**
  String get restartTheAppIfConnectionIssuesPersist;

  /// No description provided for @tryThePaymentAgain.
  ///
  /// In en, this message translates to:
  /// **'Try the payment again'**
  String get tryThePaymentAgain;

  /// No description provided for @checkM2ReaderConnection.
  ///
  /// In en, this message translates to:
  /// **'Check M2 reader connection'**
  String get checkM2ReaderConnection;

  /// No description provided for @useADifferentCard.
  ///
  /// In en, this message translates to:
  /// **'Use a different card'**
  String get useADifferentCard;

  /// No description provided for @contactSupportIfIssuesContinue.
  ///
  /// In en, this message translates to:
  /// **'Contact support if issues continue'**
  String get contactSupportIfIssuesContinue;

  /// No description provided for @connectingToReader.
  ///
  /// In en, this message translates to:
  /// **'Connecting to Reader'**
  String get connectingToReader;

  /// No description provided for @bluetoothIsDisabledPleaseEnable.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is disabled. Please enable Bluetooth.'**
  String get bluetoothIsDisabledPleaseEnable;

  /// No description provided for @failedToInitializeTerminal.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize terminal'**
  String get failedToInitializeTerminal;

  /// No description provided for @searchingForDemoReaders.
  ///
  /// In en, this message translates to:
  /// **'Searching for demo readers...'**
  String get searchingForDemoReaders;

  /// No description provided for @noDemoReadersFound.
  ///
  /// In en, this message translates to:
  /// **'No demo readers found. Tap \"Use Simulated Reader\" to create one.'**
  String get noDemoReadersFound;

  /// No description provided for @noReaderFoundMakeSureYourReaderIsOnAndNearby.
  ///
  /// In en, this message translates to:
  /// **'No reader found. Make sure your reader is on and nearby.'**
  String get noReaderFoundMakeSureYourReaderIsOnAndNearby;

  /// No description provided for @demoDiscoveryFailed.
  ///
  /// In en, this message translates to:
  /// **'Demo discovery failed:'**
  String get demoDiscoveryFailed;

  /// No description provided for @tryUsingSimulatedReader.
  ///
  /// In en, this message translates to:
  /// **'Try using simulated reader'**
  String get tryUsingSimulatedReader;

  /// No description provided for @failedDuringDisconvery.
  ///
  /// In en, this message translates to:
  /// **'Failed during discovery:'**
  String get failedDuringDisconvery;

  /// No description provided for @failedToStartDemoDiscovery.
  ///
  /// In en, this message translates to:
  /// **'Failed to start demo discovery:'**
  String get failedToStartDemoDiscovery;

  /// No description provided for @failedToStartDiscovery.
  ///
  /// In en, this message translates to:
  /// **'Failed to start discovery:'**
  String get failedToStartDiscovery;

  /// No description provided for @connectingTo.
  ///
  /// In en, this message translates to:
  /// **'Connecting to'**
  String get connectingTo;

  /// No description provided for @unknownReader.
  ///
  /// In en, this message translates to:
  /// **'Unknown reader'**
  String get unknownReader;

  /// No description provided for @connectedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Connected successfully!'**
  String get connectedSuccessfully;

  /// No description provided for @failedToConnectToReader.
  ///
  /// In en, this message translates to:
  /// **'Failed to connect to reader:'**
  String get failedToConnectToReader;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error:'**
  String get connectionError;

  /// No description provided for @bluetoothManuallyEnabledStartingCardReaderDiscovery.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth manually enabled - starting card reader discovery...'**
  String get bluetoothManuallyEnabledStartingCardReaderDiscovery;

  /// No description provided for @bluetoothNotSupportOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth not supported on this device'**
  String get bluetoothNotSupportOnThisDevice;

  /// No description provided for @bluetoothInitializationFailed.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth initialization failed'**
  String get bluetoothInitializationFailed;

  /// No description provided for @bluetoothStatusUnknown.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth status unknown'**
  String get bluetoothStatusUnknown;

  /// No description provided for @bluetoothMonitoringFailed.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth monitoring failed'**
  String get bluetoothMonitoringFailed;

  /// No description provided for @bluetoothIsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is enabled ✓'**
  String get bluetoothIsEnabled;

  /// No description provided for @bluetoothIsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is disabled. Please enable Bluetooth.'**
  String get bluetoothIsDisabled;

  /// No description provided for @unableToCheckBluetoothStatus.
  ///
  /// In en, this message translates to:
  /// **'Unable to check Bluetooth status'**
  String get unableToCheckBluetoothStatus;

  /// No description provided for @granted.
  ///
  /// In en, this message translates to:
  /// **'Granted'**
  String get granted;

  /// No description provided for @denied.
  ///
  /// In en, this message translates to:
  /// **'Denied'**
  String get denied;

  /// No description provided for @permanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Permanently Denied - Go to Settings to enable'**
  String get permanentlyDenied;

  /// No description provided for @restricted.
  ///
  /// In en, this message translates to:
  /// **'Restricted - Check Settings'**
  String get restricted;

  /// No description provided for @limited.
  ///
  /// In en, this message translates to:
  /// **'Limited'**
  String get limited;

  /// No description provided for @provisional.
  ///
  /// In en, this message translates to:
  /// **'Provisional'**
  String get provisional;

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location Services disabled - Enable in Settings > Privacy > Location Services'**
  String get locationServicesDisabled;

  /// No description provided for @simulator.
  ///
  /// In en, this message translates to:
  /// **'Simulator - Tap Settings to test'**
  String get simulator;

  /// No description provided for @qrCodeJsonMissingPairingCode.
  ///
  /// In en, this message translates to:
  /// **'QR code JSON missing pairingCode field'**
  String get qrCodeJsonMissingPairingCode;

  /// No description provided for @invalidQRCodeFormate.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code format. Expected 6-digit pairing code or JSON with pairingCode field.'**
  String get invalidQRCodeFormate;

  /// No description provided for @failedToPairDeviceWithBackend.
  ///
  /// In en, this message translates to:
  /// **'Failed to pair device with backend'**
  String get failedToPairDeviceWithBackend;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid Input'**
  String get invalidInput;

  /// No description provided for @pleaseEnterAPairingCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter a pairing code'**
  String get pleaseEnterAPairingCode;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid Code'**
  String get invalidCode;

  /// No description provided for @pairingCodeMustBe6Digits.
  ///
  /// In en, this message translates to:
  /// **'Pairing code must be a 6-digit number'**
  String get pairingCodeMustBe6Digits;

  /// No description provided for @disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// No description provided for @viewCardReaderDetails.
  ///
  /// In en, this message translates to:
  /// **'View card reader details'**
  String get viewCardReaderDetails;

  /// No description provided for @disconnectCurrentCardReader.
  ///
  /// In en, this message translates to:
  /// **'Disconnect the current card reader'**
  String get disconnectCurrentCardReader;

  /// No description provided for @processATestPayment.
  ///
  /// In en, this message translates to:
  /// **'Process a test payment'**
  String get processATestPayment;

  /// No description provided for @testCardCollection.
  ///
  /// In en, this message translates to:
  /// **'Test Card Collection'**
  String get testCardCollection;

  /// No description provided for @testCollectingCardForSaving.
  ///
  /// In en, this message translates to:
  /// **'Test collecting a card for saving'**
  String get testCollectingCardForSaving;

  /// No description provided for @displayEstimatedServiceTime.
  ///
  /// In en, this message translates to:
  /// **'Display estimated service time'**
  String get displayEstimatedServiceTime;

  /// No description provided for @closeScanner.
  ///
  /// In en, this message translates to:
  /// **'Close Scanner'**
  String get closeScanner;

  /// No description provided for @kioskSettings.
  ///
  /// In en, this message translates to:
  /// **'Kiosk Settings'**
  String get kioskSettings;

  /// No description provided for @kioskModeStatus.
  ///
  /// In en, this message translates to:
  /// **'Kiosk Mode Status'**
  String get kioskModeStatus;

  /// No description provided for @currentlyEnable.
  ///
  /// In en, this message translates to:
  /// **'Currently enabled'**
  String get currentlyEnable;

  /// No description provided for @currentlyDisable.
  ///
  /// In en, this message translates to:
  /// **'Currently disable'**
  String get currentlyDisable;

  /// No description provided for @checkManaged.
  ///
  /// In en, this message translates to:
  /// **'Check Managed'**
  String get checkManaged;

  /// No description provided for @disableKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Disable Kiosk Mode'**
  String get disableKioskMode;

  /// No description provided for @enableKioskMode.
  ///
  /// In en, this message translates to:
  /// **'Enable Kiosk Mode'**
  String get enableKioskMode;

  /// No description provided for @checkingKioskStatus.
  ///
  /// In en, this message translates to:
  /// **'Checking kiosk status...'**
  String get checkingKioskStatus;

  /// No description provided for @kioskModeEnabled.
  ///
  /// In en, this message translates to:
  /// **'Kiosk mode is enabled'**
  String get kioskModeEnabled;

  /// No description provided for @kioskModeDisabled.
  ///
  /// In en, this message translates to:
  /// **'Kiosk mode is disabled'**
  String get kioskModeDisabled;

  /// No description provided for @tapForDetail.
  ///
  /// In en, this message translates to:
  /// **'Tap for Detail'**
  String get tapForDetail;

  /// No description provided for @servicesWillAppearHereOnceTheyAreConfigured.
  ///
  /// In en, this message translates to:
  /// **'Services will appear here once they are configured'**
  String get servicesWillAppearHereOnceTheyAreConfigured;

  /// No description provided for @addNewCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add New Customer'**
  String get addNewCustomer;

  /// No description provided for @createNewCustomerProfile.
  ///
  /// In en, this message translates to:
  /// **'Create a new customer profile'**
  String get createNewCustomerProfile;

  /// No description provided for @customerType.
  ///
  /// In en, this message translates to:
  /// **'Customer Type'**
  String get customerType;

  /// No description provided for @basicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get enterFirstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get enterLastName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterPhoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email address'**
  String get enterEmail;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @preferNotToSay.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get preferNotToSay;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @selectDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Select date of birth'**
  String get selectDateOfBirth;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @enterNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter any additional notes'**
  String get enterNotes;

  /// No description provided for @consentRequired.
  ///
  /// In en, this message translates to:
  /// **'Consent Required'**
  String get consentRequired;

  /// No description provided for @customerConsentMessage.
  ///
  /// In en, this message translates to:
  /// **'By creating this account, the customer agrees to Ashtra\'s terms and privacy policy.'**
  String get customerConsentMessage;

  /// No description provided for @agreeToTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get agreeToTerms;

  /// No description provided for @agreeToPrivacy.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get agreeToPrivacy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @createCustomer.
  ///
  /// In en, this message translates to:
  /// **'Create Customer'**
  String get createCustomer;

  /// No description provided for @regular.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get regular;

  /// No description provided for @walkIn.
  ///
  /// In en, this message translates to:
  /// **'Walk-In'**
  String get walkIn;

  /// No description provided for @vip.
  ///
  /// In en, this message translates to:
  /// **'VIP'**
  String get vip;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @addPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Add Payment Method'**
  String get addPaymentMethod;

  /// No description provided for @savedPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Saved Payment Methods'**
  String get savedPaymentMethods;

  /// No description provided for @noPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'No payment methods saved'**
  String get noPaymentMethods;

  /// No description provided for @defaultPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultPaymentMethod;

  /// No description provided for @setAsDefault.
  ///
  /// In en, this message translates to:
  /// **'Set as Default'**
  String get setAsDefault;

  /// No description provided for @deletePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Delete Payment Method'**
  String get deletePaymentMethod;

  /// No description provided for @confirmDeletePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this payment method?'**
  String get confirmDeletePaymentMethod;

  /// No description provided for @paymentMethodDeleted.
  ///
  /// In en, this message translates to:
  /// **'Payment method deleted successfully'**
  String get paymentMethodDeleted;

  /// No description provided for @paymentMethodSetAsDefault.
  ///
  /// In en, this message translates to:
  /// **'Payment method set as default'**
  String get paymentMethodSetAsDefault;

  /// No description provided for @failedToDeletePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete payment method'**
  String get failedToDeletePaymentMethod;

  /// No description provided for @failedToSetDefaultPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Failed to set default payment method'**
  String get failedToSetDefaultPaymentMethod;

  /// No description provided for @cardEndingIn.
  ///
  /// In en, this message translates to:
  /// **'Card ending in'**
  String get cardEndingIn;

  /// No description provided for @expiresOn.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get expiresOn;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @presentCard.
  ///
  /// In en, this message translates to:
  /// **'Present Card'**
  String get presentCard;

  /// No description provided for @insertTapOrSwipeCard.
  ///
  /// In en, this message translates to:
  /// **'Insert, tap, or swipe card to save'**
  String get insertTapOrSwipeCard;

  /// No description provided for @savingPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Saving payment method...'**
  String get savingPaymentMethod;

  /// No description provided for @paymentMethodSaved.
  ///
  /// In en, this message translates to:
  /// **'Payment method saved successfully'**
  String get paymentMethodSaved;

  /// No description provided for @failedToSavePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Failed to save payment method'**
  String get failedToSavePaymentMethod;

  /// No description provided for @customerCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer created successfully'**
  String get customerCreatedSuccessfully;

  /// No description provided for @failedToCreateCustomer.
  ///
  /// In en, this message translates to:
  /// **'Failed to create customer'**
  String get failedToCreateCustomer;

  /// No description provided for @customerAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A customer with this phone number already exists'**
  String get customerAlreadyExists;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhoneNumber;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @nameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get nameMinLength;

  /// No description provided for @pleaseAgreeToTerms.
  ///
  /// In en, this message translates to:
  /// **'Please agree to the Terms of Service'**
  String get pleaseAgreeToTerms;

  /// No description provided for @pleaseAgreeToPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Please agree to the Privacy Policy'**
  String get pleaseAgreeToPrivacy;

  /// No description provided for @addPaymentMethodQuestion.
  ///
  /// In en, this message translates to:
  /// **'Would you like to add a payment method for this customer?'**
  String get addPaymentMethodQuestion;

  /// No description provided for @addPaymentMethodNow.
  ///
  /// In en, this message translates to:
  /// **'Add Payment Method'**
  String get addPaymentMethodNow;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipForNow;

  /// No description provided for @collectingCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Collecting card details...'**
  String get collectingCardDetails;

  /// No description provided for @presentCardToReader.
  ///
  /// In en, this message translates to:
  /// **'Please present the customer\'s card to the reader'**
  String get presentCardToReader;

  /// No description provided for @cardCollectedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Card collected and saved successfully'**
  String get cardCollectedSuccessfully;

  /// No description provided for @failedToCollectCard.
  ///
  /// In en, this message translates to:
  /// **'Failed to collect card details'**
  String get failedToCollectCard;

  /// No description provided for @cardCollectionRequest.
  ///
  /// In en, this message translates to:
  /// **'Card Collection Request'**
  String get cardCollectionRequest;

  /// No description provided for @collectCardFor.
  ///
  /// In en, this message translates to:
  /// **'Collect card for'**
  String get collectCardFor;

  /// No description provided for @customerRequestedCardCollection.
  ///
  /// In en, this message translates to:
  /// **'A business has requested to collect card details for this customer.'**
  String get customerRequestedCardCollection;

  /// No description provided for @collectCard.
  ///
  /// In en, this message translates to:
  /// **'Collect Card'**
  String get collectCard;

  /// No description provided for @cancelCollection.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelCollection;

  /// No description provided for @collectingCard.
  ///
  /// In en, this message translates to:
  /// **'Collecting Card'**
  String get collectingCard;

  /// No description provided for @pleaseInsertTapOrSwipeCard.
  ///
  /// In en, this message translates to:
  /// **'Please insert, tap, or swipe the customer\'s card'**
  String get pleaseInsertTapOrSwipeCard;

  /// No description provided for @cardCollectionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card collected successfully'**
  String get cardCollectionSuccess;

  /// No description provided for @cardCollectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Card collection failed'**
  String get cardCollectionFailed;

  /// No description provided for @cardCollectionCancelled.
  ///
  /// In en, this message translates to:
  /// **'Card collection cancelled'**
  String get cardCollectionCancelled;

  /// No description provided for @noCardCollectionRequest.
  ///
  /// In en, this message translates to:
  /// **'No card collection request'**
  String get noCardCollectionRequest;

  /// No description provided for @waitingForCardCollectionRequest.
  ///
  /// In en, this message translates to:
  /// **'Waiting for card collection request from business...'**
  String get waitingForCardCollectionRequest;

  /// No description provided for @cardCollectionDescription.
  ///
  /// In en, this message translates to:
  /// **'Card to be saved for future payments'**
  String get cardCollectionDescription;

  /// No description provided for @setAsDefaultCard.
  ///
  /// In en, this message translates to:
  /// **'Set as default card'**
  String get setAsDefaultCard;

  /// No description provided for @cardNickname.
  ///
  /// In en, this message translates to:
  /// **'Card nickname'**
  String get cardNickname;

  /// No description provided for @processingCardCollection.
  ///
  /// In en, this message translates to:
  /// **'Processing card collection...'**
  String get processingCardCollection;

  /// No description provided for @submittingCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Submitting card details...'**
  String get submittingCardDetails;

  /// No description provided for @cardCollectionComplete.
  ///
  /// In en, this message translates to:
  /// **'Card collection complete'**
  String get cardCollectionComplete;

  /// No description provided for @returnToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Return to Dashboard'**
  String get returnToDashboard;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @cardDetailsCollected.
  ///
  /// In en, this message translates to:
  /// **'Card details collected'**
  String get cardDetailsCollected;

  /// No description provided for @cardBrand.
  ///
  /// In en, this message translates to:
  /// **'Card brand'**
  String get cardBrand;

  /// No description provided for @lastFourDigits.
  ///
  /// In en, this message translates to:
  /// **'Last 4 digits'**
  String get lastFourDigits;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Expiration date'**
  String get expirationDate;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
