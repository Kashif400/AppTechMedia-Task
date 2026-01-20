// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginIn => 'Log In';

  @override
  String get frontDeskMode => 'Front Desk Mode';

  @override
  String get connectAReader => 'Connect a Reader';

  @override
  String get skip => 'Skip';

  @override
  String get selectACardReaderToConnect =>
      'Select a card reader to connect this device';

  @override
  String get searchingForReaders => 'Searching for readers...';

  @override
  String get makeSureYourReaderIsPowered =>
      'Make sure your reader is powered on and in pairing mode.';

  @override
  String get cardReaderDisconnected => 'Card Reader Disconnected';

  @override
  String get cardReaderDisconnectedDescription =>
      'The card reader has been successfully disconnected from the terminal.';

  @override
  String get done => 'Done';

  @override
  String get cardReaderInformation => 'Card Reader Information';

  @override
  String get batteryLevel => 'Battery level:';

  @override
  String get status => 'Status';

  @override
  String get connected => 'Connected';

  @override
  String get deviceType => 'Device Type';

  @override
  String get serialNumber => 'Serial Number:';

  @override
  String get ok => 'OK';

  @override
  String get discoveringCardReaders => 'Discovering Card Readers';

  @override
  String get searchingForAvailableM2CardReaders =>
      'Searching for available M2 card readers...\n\nMake sure your card reader is:\n• Powered on\n• In pairing mode\n• Within Bluetooth range';

  @override
  String get deviceInformation => 'Device Information';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get connection => 'Connection';

  @override
  String get location => 'Location:';

  @override
  String get terminalId => 'Terminal ID:';

  @override
  String get discoveringDevices => 'Discovering Devices';

  @override
  String get discoveringDevicesDescription =>
      'Please wait while we search for available devices...';

  @override
  String get searching => 'Searching...';

  @override
  String get error => 'Error';

  @override
  String get unknownError => 'An unknown error occurred.';

  @override
  String get generalError => 'General Error';

  @override
  String get critical => 'critical';

  @override
  String get fatal => 'fatal';

  @override
  String get warning => 'warning';

  @override
  String get network => 'network';

  @override
  String get payment => 'payment';

  @override
  String get device => 'device';

  @override
  String get ashtraTerminal => 'Ashtra Terminal';

  @override
  String get connectTo => 'Connect to';

  @override
  String get noReaderConnect => 'No reader connected';

  @override
  String get connectReader => 'Connect Reader';

  @override
  String get disconnectReader => 'Disconnect Reader';

  @override
  String get quickAmounts => 'Quick Amounts';

  @override
  String get readCard => 'Read Card';

  @override
  String get completePayment => 'Complete Payment';

  @override
  String get serviceAmount => 'Service Amount';

  @override
  String get tipCanBeAddedNext => '(Tip can be added next)';

  @override
  String get processing => 'Processing...';

  @override
  String get howToFix => 'How to fix this:';

  @override
  String get toEnsureReliablePayments =>
      'To ensure reliable payments, charge your M2 device to at least 20% battery.';

  @override
  String get permissions => 'Permissions';

  @override
  String get settings => 'Settings';

  @override
  String get continues => 'Continue';

  @override
  String get refreshStatus => 'Refresh Status';

  @override
  String get locationAccess => 'Location Access';

  @override
  String get phoneAccess => 'Phone Access';

  @override
  String get bluetoothAccess => 'Bluetooth Access';

  @override
  String get cameraAccess => 'Camera Access';

  @override
  String get bluetoothScan => 'Bluetooth Scan';

  @override
  String get bluetoothConnect => 'Bluetooth Connect';

  @override
  String get locationAccessDescription =>
      'Required to discover nearby card readers';

  @override
  String get phoneAccessDescription =>
      'Required for device identification and calls if needed';

  @override
  String get cameraAccessDescription =>
      'Required for QR code scanning and reader setup';

  @override
  String get bluetoothAccessDescription =>
      'Required to connect to Bluetooth card readers';

  @override
  String get bluetoothScanDescription =>
      'Required to scan for Bluetooth devices';

  @override
  String get blueetoothConnectAccessDescription =>
      'Required to connect Bluetooth devices';

  @override
  String get requiredForAppFunctionality => 'Required for app functionality';

  @override
  String get enterThe6DigitCode =>
      'Enter the 6-digit code on your terminal device';

  @override
  String get enterThe6DigitPairingCode => 'Enter 6-digit pairing code';

  @override
  String get pair => 'Pair';

  @override
  String get codeAndQRCodeUpdateEvery2Minute =>
      'Code and QR Code updated every 2 minutes';

  @override
  String get pairTerminal => 'Pair Terminal';

  @override
  String get selectQRCodeToPairTerminal => 'Select QR Code to Pair Terminal';

  @override
  String get scanTheQRCodeDisplayedOnTheAdminPanel =>
      'Scan the QR code displayed on the admin panel to pair the device with your salon terminal.';

  @override
  String get searchingForReader => 'Searching for readers...';

  @override
  String get turnOnYourDeviceOrPleaseTryAgain =>
      'Turn on your device or please try again.';

  @override
  String get refresh => 'Refresh';

  @override
  String get bluetoothDisabled => 'Bluetooth is disabled';

  @override
  String get pleaseEnableBluetooth =>
      'Please enable Bluetooth to search for card readers.';

  @override
  String get establishingConnection => 'Establishing connection...';

  @override
  String get readerId => 'Reader ID:';

  @override
  String get deviceUpdateInProgress => 'Device Update in Progress';

  @override
  String get updateDevice => 'Updating device...';

  @override
  String get progress => 'Progress';

  @override
  String get updateToVersion => 'Updating to version';

  @override
  String get pleaseWaitDoNotDisconnectTheDevice =>
      'Please wait, do not disconnect the device';

  @override
  String get signatureRequired => 'Signature Required';

  @override
  String get paymentSummary => 'Payment Summary';

  @override
  String get subtotal => 'Subtotal:';

  @override
  String get tip => 'Tip:';

  @override
  String get total => 'Total:';

  @override
  String get pleaseSignBelow => 'Please sign below to authorize payment';

  @override
  String get clearSignature => 'Clear Signature';

  @override
  String get terminalSetupRequired => 'Terminal Setup Required';

  @override
  String get thisTerminalNeedsToBePaired =>
      'This terminal needs to be paired with your business account to get started.';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get terminalSetting => 'Terminal Settings';

  @override
  String get connectCardReader => 'Connect Card Reader';

  @override
  String get searchAndConnectM2CardReader =>
      'Search and connect M2 card reader';

  @override
  String get cardReaderInfo => 'Card Reader Info';

  @override
  String get connectedCardReaderInfo => 'View connected card reader info';

  @override
  String get disconnectCardReader => 'Disconnect Card Reader';

  @override
  String get disconnectTheConnectedCardReader =>
      'Disconnect the connected card reader';

  @override
  String get displaySettings => 'Display Settings';

  @override
  String get configureWhatToShowOnDashboard =>
      'Configure what to show on dashboard';

  @override
  String get scanCheckInQRCode => 'Scan Check-in QR Code';

  @override
  String get scanCustomerQRCode => 'Scan customer QR code for check-in';

  @override
  String get testPayment => 'Test Payment';

  @override
  String get processingTestPayment => 'Processing a test payment';

  @override
  String get refreshAllData => 'Refresh All Data';

  @override
  String get reloadWaitinglistAndServicesData =>
      'Reload waitinglist, services, and status';

  @override
  String get removeDeviceTerminal => 'Remove Device Terminal';

  @override
  String get clearAllDataAndReturnToHome =>
      'Clear all data and return to home screen';

  @override
  String get addToWishlist => 'Add to Wishlist';

  @override
  String get cancel => 'Cancel';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get displaySettingsSavedSuccessfully =>
      'Display settings saved successfully';

  @override
  String get failedToSaveSettings => 'Failed to save settings:';

  @override
  String get showWaitingList => 'Show Waiting List';

  @override
  String get displayCustomerWaitingListDashboard =>
      'Display customer waiting list on dashboard';

  @override
  String get showServiceList => 'Show Service List';

  @override
  String get displayAvailableService => 'Display available services';

  @override
  String get showServicePrices => 'Show Service Prices';

  @override
  String get displayPriceInformation => 'Display pricing information';

  @override
  String get showServiceDuration => 'Show Service Duration';

  @override
  String get advancedSettings => 'Advanced Settings';

  @override
  String get groupServicesByCategory => 'Group Services by Category';

  @override
  String get organizeServiceIntoCategories =>
      'Organize services into categories';

  @override
  String get showEstimatedWaitTime => 'Show Estimated Wait Time';

  @override
  String get displayExpectedWaitingTimeForCustomer =>
      'Display expected waiting time for customers';

  @override
  String get refreshInterval => 'Refresh Interval (seconds)';

  @override
  String get howOftenToUpdateWaitingList => 'How often to update waiting list';

  @override
  String get maxWaitingListItems => 'Max Waiting List Items';

  @override
  String get maximumNumberOfCustomerToShow =>
      'Maximum number of customers to show';

  @override
  String get pointTheCameraAtTheCustomer =>
      'Point the camera at the customer\'s QR code to check them in';

  @override
  String get processingQrCode => 'Processing QR Code...';

  @override
  String get cameraPermissionRequiredToQRCodes =>
      'Camera permission is required to scan QR codes';

  @override
  String get cameraPermissionRequired => 'Camera Permission Required';

  @override
  String get pleaseEnableCameraAccessInYourDevice =>
      'Please enable camera access in your device settings to scan QR codes for check-in.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get invalidQrCodeFormat => 'Invalid QR code format';

  @override
  String get invalidQrCodeMissingInformation =>
      'Invalid QR code: Missing required information';

  @override
  String get customerCheckedInSuccessfully =>
      'Customer checked in successfully!';

  @override
  String get failedToCheckInCustomerPleaseTryAgain =>
      'Failed to check in customer. Please try again.';

  @override
  String get addATip => 'Add a Tip?';

  @override
  String get serviceProviders => 'Service providers';

  @override
  String get services => 'services';

  @override
  String get noTip => 'No Tip';

  @override
  String get customTip => 'Custom Tip';

  @override
  String get enterAmount => 'Enter amount';

  @override
  String get enterCustomTipAmount => 'Enter Custom Tip Amount';

  @override
  String get tipAmount => 'Tip Amount';

  @override
  String get kioskMode => 'Kiosk mode:';

  @override
  String get errorCheckingKioskMode => 'Error checking kiosk mode:';

  @override
  String get startKioskMode => 'Starting kiosk mode...';

  @override
  String get kioskModeStartedSuccessfully => 'Kiosk mode started successfully';

  @override
  String get failedToStartKioskMode => 'Failed to start kiosk mode:';

  @override
  String get stoppingKioskMode => 'Stopping kiosk mode...';

  @override
  String get kioskModeStoppedSuccessfully => 'Kiosk mode stopped successfully';

  @override
  String get failedToStopKioskMode => 'Failed to stop kiosk mode:';

  @override
  String get deviceManagedKiosk => 'Device managed kiosk:';

  @override
  String get errorCheckingManagedKiosk => 'Error checking managed kiosk:';

  @override
  String get noServicesAvailable => 'No services available';

  @override
  String get waitingList => 'Waiting list';

  @override
  String get noCustomersWaiting => 'No customers waiting';

  @override
  String get appointmentsWillAppearHereWhenCustomersArrive =>
      'Appointments will appear here when customers arrive';

  @override
  String get withs => 'With:';

  @override
  String get timeLeft => 'Time Left\n';

  @override
  String get noSpecificActionSuggested =>
      'No specific action suggested. Contact support if the issue persists.';

  @override
  String get unknows1 => 'Unknown Error';

  @override
  String get unknownErrorPleaseTryAgain =>
      'An unexpected error occurred. Please try again.';

  @override
  String get errorCode => 'ERROR CODE';

  @override
  String get deviceStatus => 'Error Details';

  @override
  String get suggestAction => 'Suggested Action';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get retry => 'Retry';

  @override
  String get errorDetails => 'Error Details';

  @override
  String get reader => 'Reader';

  @override
  String get createPaymentIntent => 'Creating payment intent...';

  @override
  String get processingPayment => 'Processing payment...';

  @override
  String get paymentSuccessful => 'Payment successful!';

  @override
  String get pleasePresentCard => 'Please present card...';

  @override
  String get cardReaderNotImplemented =>
      'Card reading not implemented yet. Use payment flow instead.';

  @override
  String get paymentFailed => 'Payment failed';

  @override
  String get cardNotSupport =>
      'Card Not Supported\n\nThis card doesn\'t have chip payment apps. Please:\n• Try a different card with an EMV chip\n• Use a chip-enabled credit or debit card\n• Insert the card instead of tapping';

  @override
  String get cardReadingFailed =>
      'Card Reading Failed\n\nPlease try:\n• Insert the card fully into the chip reader\n• Hold contactless cards steady for 2-3 seconds\n• Clean the card and try again\n• Use a different card';

  @override
  String get paymentDeclined =>
      'Payment Declined\n\nThe card was declined. Please:\n• Try a different payment method\n• Contact your bank\n• Check available balance';

  @override
  String get lowBatteryWarning1 =>
      'Low Battery Warning\n\nThe card reader battery is critically low';

  @override
  String get lowBatteryWarning2 =>
      'Please:\n• Charge the M2 device to 20%+\n• Connect the charging cable\n• Wait for charging before processing payments';

  @override
  String get readerDisconnected =>
      'Reader Disconnected\n\nThe M2 card reader is not connected. Please:\n• Check Bluetooth connection\n• Reconnect the M2 device\n• Ensure reader is powered on';

  @override
  String get pleaseTryAgainOrSupport => 'Please try again or contact support.';

  @override
  String get paymentError => 'Payment Error';

  @override
  String get unexpectedError => 'Unexpected Error';

  @override
  String get pleaseTryAgain => 'Please try again.';

  @override
  String get useAChipEnabledCreditOrDebitCard =>
      'Use a chip-enabled credit or debit card';

  @override
  String get tryInsertingTheCardInsteadOfTapping =>
      'Try inserting the card instead of tapping';

  @override
  String get ensureTheCardHasAnEMVChip =>
      'Ensure the card has an EMV chip (small square on front)';

  @override
  String get contactYourBank => 'Contact your bank if the card should work';

  @override
  String get insertTheCardFullyAndLeaveItInTheReader =>
      'Insert the card fully and leave it in the reader';

  @override
  String get cleanTheCardChipAndMagneticStrip =>
      'Clean the card\'s chip and magnetic stripe';

  @override
  String get holdContactlessCardsSteadyFor2To3Seconds =>
      'Hold contactless cards steady for 2-3 seconds';

  @override
  String get tryADifferentCardIfIssuesPersist =>
      'Try a different card if issues persist';

  @override
  String get checkYourAccountBalance => 'Check your account balance';

  @override
  String get contactYourBankToVerifyTheCardIsActive =>
      'Contact your bank to verify the card is active';

  @override
  String get tryADifferentPaymentMethod => 'Try a different payment method';

  @override
  String get ensureTheCardHasNotExpired => 'Ensure the card hasn\'t expired';

  @override
  String get chargeTheM2DeviceToAtLeast20Percent =>
      'Charge the M2 device to at least 20%';

  @override
  String get connectTheChargingCableAndWait =>
      'Connect the charging cable and wait';

  @override
  String get useADifferentPaymentMethodWhileCharging =>
      'Use a different payment method while charging';

  @override
  String get checkTheChargingIndicatorLight =>
      'Check the charging indicator light';

  @override
  String get checkBluetoothConnectionOnThisDevice =>
      'Check Bluetooth connection on this device';

  @override
  String get powerCycleTheM2Reader => 'Power cycle the M2 reader (turn off/on)';

  @override
  String get moveCloserToTheM2Reader => 'Move closer to the M2 reader';

  @override
  String get restartTheAppIfConnectionIssuesPersist =>
      'Restart the app if connection issues persist';

  @override
  String get tryThePaymentAgain => 'Try the payment again';

  @override
  String get checkM2ReaderConnection => 'Check M2 reader connection';

  @override
  String get useADifferentCard => 'Use a different card';

  @override
  String get contactSupportIfIssuesContinue =>
      'Contact support if issues continue';

  @override
  String get connectingToReader => 'Connecting to Reader';

  @override
  String get bluetoothIsDisabledPleaseEnable =>
      'Bluetooth is disabled. Please enable Bluetooth.';

  @override
  String get failedToInitializeTerminal => 'Failed to initialize terminal';

  @override
  String get searchingForDemoReaders => 'Searching for demo readers...';

  @override
  String get noDemoReadersFound =>
      'No demo readers found. Tap \"Use Simulated Reader\" to create one.';

  @override
  String get noReaderFoundMakeSureYourReaderIsOnAndNearby =>
      'No reader found. Make sure your reader is on and nearby.';

  @override
  String get demoDiscoveryFailed => 'Demo discovery failed:';

  @override
  String get tryUsingSimulatedReader => 'Try using simulated reader';

  @override
  String get failedDuringDisconvery => 'Failed during discovery:';

  @override
  String get failedToStartDemoDiscovery => 'Failed to start demo discovery:';

  @override
  String get failedToStartDiscovery => 'Failed to start discovery:';

  @override
  String get connectingTo => 'Connecting to';

  @override
  String get unknownReader => 'Unknown reader';

  @override
  String get connectedSuccessfully => 'Connected successfully!';

  @override
  String get failedToConnectToReader => 'Failed to connect to reader:';

  @override
  String get connectionError => 'Connection error:';

  @override
  String get bluetoothManuallyEnabledStartingCardReaderDiscovery =>
      'Bluetooth manually enabled - starting card reader discovery...';

  @override
  String get bluetoothNotSupportOnThisDevice =>
      'Bluetooth not supported on this device';

  @override
  String get bluetoothInitializationFailed => 'Bluetooth initialization failed';

  @override
  String get bluetoothStatusUnknown => 'Bluetooth status unknown';

  @override
  String get bluetoothMonitoringFailed => 'Bluetooth monitoring failed';

  @override
  String get bluetoothIsEnabled => 'Bluetooth is enabled ✓';

  @override
  String get bluetoothIsDisabled =>
      'Bluetooth is disabled. Please enable Bluetooth.';

  @override
  String get unableToCheckBluetoothStatus => 'Unable to check Bluetooth status';

  @override
  String get granted => 'Granted';

  @override
  String get denied => 'Denied';

  @override
  String get permanentlyDenied =>
      'Permanently Denied - Go to Settings to enable';

  @override
  String get restricted => 'Restricted - Check Settings';

  @override
  String get limited => 'Limited';

  @override
  String get provisional => 'Provisional';

  @override
  String get locationServicesDisabled =>
      'Location Services disabled - Enable in Settings > Privacy > Location Services';

  @override
  String get simulator => 'Simulator - Tap Settings to test';

  @override
  String get qrCodeJsonMissingPairingCode =>
      'QR code JSON missing pairingCode field';

  @override
  String get invalidQRCodeFormate =>
      'Invalid QR code format. Expected 6-digit pairing code or JSON with pairingCode field.';

  @override
  String get failedToPairDeviceWithBackend =>
      'Failed to pair device with backend';

  @override
  String get invalidInput => 'Invalid Input';

  @override
  String get pleaseEnterAPairingCode => 'Please enter a pairing code';

  @override
  String get invalidCode => 'Invalid Code';

  @override
  String get pairingCodeMustBe6Digits =>
      'Pairing code must be a 6-digit number';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get viewCardReaderDetails => 'View card reader details';

  @override
  String get disconnectCurrentCardReader =>
      'Disconnect the current card reader';

  @override
  String get processATestPayment => 'Process a test payment';

  @override
  String get testCardCollection => 'Test Card Collection';

  @override
  String get testCollectingCardForSaving => 'Test collecting a card for saving';

  @override
  String get displayEstimatedServiceTime => 'Display estimated service time';

  @override
  String get closeScanner => 'Close Scanner';

  @override
  String get kioskSettings => 'Kiosk Settings';

  @override
  String get kioskModeStatus => 'Kiosk Mode Status';

  @override
  String get currentlyEnable => 'Currently enabled';

  @override
  String get currentlyDisable => 'Currently disable';

  @override
  String get checkManaged => 'Check Managed';

  @override
  String get disableKioskMode => 'Disable Kiosk Mode';

  @override
  String get enableKioskMode => 'Enable Kiosk Mode';

  @override
  String get checkingKioskStatus => 'Checking kiosk status...';

  @override
  String get kioskModeEnabled => 'Kiosk mode is enabled';

  @override
  String get kioskModeDisabled => 'Kiosk mode is disabled';

  @override
  String get tapForDetail => 'Tap for Detail';

  @override
  String get servicesWillAppearHereOnceTheyAreConfigured =>
      'Services will appear here once they are configured';

  @override
  String get addNewCustomer => 'Add New Customer';

  @override
  String get createNewCustomerProfile => 'Create a new customer profile';

  @override
  String get customerType => 'Customer Type';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get firstName => 'First Name';

  @override
  String get enterFirstName => 'Enter first name';

  @override
  String get lastName => 'Last Name';

  @override
  String get enterLastName => 'Enter last name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter email address';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get preferNotToSay => 'Prefer not to say';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get selectDateOfBirth => 'Select date of birth';

  @override
  String get notes => 'Notes';

  @override
  String get enterNotes => 'Enter any additional notes';

  @override
  String get consentRequired => 'Consent Required';

  @override
  String get customerConsentMessage =>
      'By creating this account, the customer agrees to Ashtra\'s terms and privacy policy.';

  @override
  String get agreeToTerms => 'I agree to the';

  @override
  String get agreeToPrivacy => 'I agree to the';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get createCustomer => 'Create Customer';

  @override
  String get regular => 'Regular';

  @override
  String get walkIn => 'Walk-In';

  @override
  String get vip => 'VIP';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get addPaymentMethod => 'Add Payment Method';

  @override
  String get savedPaymentMethods => 'Saved Payment Methods';

  @override
  String get noPaymentMethods => 'No payment methods saved';

  @override
  String get defaultPaymentMethod => 'Default';

  @override
  String get setAsDefault => 'Set as Default';

  @override
  String get deletePaymentMethod => 'Delete Payment Method';

  @override
  String get confirmDeletePaymentMethod =>
      'Are you sure you want to delete this payment method?';

  @override
  String get paymentMethodDeleted => 'Payment method deleted successfully';

  @override
  String get paymentMethodSetAsDefault => 'Payment method set as default';

  @override
  String get failedToDeletePaymentMethod => 'Failed to delete payment method';

  @override
  String get failedToSetDefaultPaymentMethod =>
      'Failed to set default payment method';

  @override
  String get cardEndingIn => 'Card ending in';

  @override
  String get expiresOn => 'Expires';

  @override
  String get expired => 'Expired';

  @override
  String get presentCard => 'Present Card';

  @override
  String get insertTapOrSwipeCard => 'Insert, tap, or swipe card to save';

  @override
  String get savingPaymentMethod => 'Saving payment method...';

  @override
  String get paymentMethodSaved => 'Payment method saved successfully';

  @override
  String get failedToSavePaymentMethod => 'Failed to save payment method';

  @override
  String get customerCreatedSuccessfully => 'Customer created successfully';

  @override
  String get failedToCreateCustomer => 'Failed to create customer';

  @override
  String get customerAlreadyExists =>
      'A customer with this phone number already exists';

  @override
  String get invalidPhoneNumber => 'Please enter a valid phone number';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get nameMinLength => 'Name must be at least 2 characters';

  @override
  String get pleaseAgreeToTerms => 'Please agree to the Terms of Service';

  @override
  String get pleaseAgreeToPrivacy => 'Please agree to the Privacy Policy';

  @override
  String get addPaymentMethodQuestion =>
      'Would you like to add a payment method for this customer?';

  @override
  String get addPaymentMethodNow => 'Add Payment Method';

  @override
  String get skipForNow => 'Skip';

  @override
  String get collectingCardDetails => 'Collecting card details...';

  @override
  String get presentCardToReader =>
      'Please present the customer\'s card to the reader';

  @override
  String get cardCollectedSuccessfully =>
      'Card collected and saved successfully';

  @override
  String get failedToCollectCard => 'Failed to collect card details';

  @override
  String get cardCollectionRequest => 'Card Collection Request';

  @override
  String get collectCardFor => 'Collect card for';

  @override
  String get customerRequestedCardCollection =>
      'A business has requested to collect card details for this customer.';

  @override
  String get collectCard => 'Collect Card';

  @override
  String get cancelCollection => 'Cancel';

  @override
  String get collectingCard => 'Collecting Card';

  @override
  String get pleaseInsertTapOrSwipeCard =>
      'Please insert, tap, or swipe the customer\'s card';

  @override
  String get cardCollectionSuccess => 'Card collected successfully';

  @override
  String get cardCollectionFailed => 'Card collection failed';

  @override
  String get cardCollectionCancelled => 'Card collection cancelled';

  @override
  String get noCardCollectionRequest => 'No card collection request';

  @override
  String get waitingForCardCollectionRequest =>
      'Waiting for card collection request from business...';

  @override
  String get cardCollectionDescription =>
      'Card to be saved for future payments';

  @override
  String get setAsDefaultCard => 'Set as default card';

  @override
  String get cardNickname => 'Card nickname';

  @override
  String get processingCardCollection => 'Processing card collection...';

  @override
  String get submittingCardDetails => 'Submitting card details...';

  @override
  String get cardCollectionComplete => 'Card collection complete';

  @override
  String get returnToDashboard => 'Return to Dashboard';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get cardDetailsCollected => 'Card details collected';

  @override
  String get cardBrand => 'Card brand';

  @override
  String get lastFourDigits => 'Last 4 digits';

  @override
  String get expirationDate => 'Expiration date';
}
