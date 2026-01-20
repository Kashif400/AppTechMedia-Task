// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get loginIn => 'Đăng nhập';

  @override
  String get frontDeskMode => 'Chế độ lễ tân';

  @override
  String get connectAReader => 'Kết nối đầu đọc';

  @override
  String get skip => 'Nhảy';

  @override
  String get selectACardReaderToConnect =>
      'Chọn đầu đọc thẻ để kết nối thiết bị này';

  @override
  String get searchingForReaders => 'Đang tìm kiếm độc giả...';

  @override
  String get makeSureYourReaderIsPowered =>
      'Đảm bảo đầu đọc của bạn đã được bật và đang ở chế độ ghép nối.';

  @override
  String get cardReaderDisconnected => 'Đầu đọc thẻ bị ngắt kết nối';

  @override
  String get cardReaderDisconnectedDescription =>
      'Đầu đọc thẻ đã được ngắt kết nối thành công khỏi thiết bị đầu cuối.';

  @override
  String get done => 'Xong';

  @override
  String get cardReaderInformation => 'Thông tin đầu đọc thẻ';

  @override
  String get batteryLevel => 'Mức pin:';

  @override
  String get status => 'Trạng thái';

  @override
  String get connected => 'Đã kết nối';

  @override
  String get deviceType => 'Loại thiết bị';

  @override
  String get serialNumber => 'Số seri:';

  @override
  String get ok => 'ĐƯỢC RỒI';

  @override
  String get discoveringCardReaders => 'Khám phá đầu đọc thẻ';

  @override
  String get searchingForAvailableM2CardReaders =>
      'Đang tìm kiếm đầu đọc thẻ M2 khả dụng...\n\nĐảm bảo đầu đọc thẻ của bạn:\n• Đã bật\n• Đang ở chế độ ghép nối\n• Trong phạm vi Bluetooth';

  @override
  String get deviceInformation => 'Thông tin thiết bị';

  @override
  String get online => 'Trực tuyến';

  @override
  String get offline => 'Ngoại tuyến';

  @override
  String get connection => 'Kết nối';

  @override
  String get location => 'Vị trí:';

  @override
  String get terminalId => 'ID thiết bị đầu cuối:';

  @override
  String get discoveringDevices => 'Khám phá thiết bị';

  @override
  String get discoveringDevicesDescription =>
      'Vui lòng đợi trong khi chúng tôi tìm kiếm các thiết bị khả dụng...';

  @override
  String get searching => 'Đang tìm kiếm...';

  @override
  String get error => 'Lỗi';

  @override
  String get unknownError => 'Đã xảy ra lỗi không xác định.';

  @override
  String get generalError => 'Lỗi chung';

  @override
  String get critical => 'phê bình';

  @override
  String get fatal => 'gây tử vong';

  @override
  String get warning => 'cảnh báo';

  @override
  String get network => 'mạng';

  @override
  String get payment => 'sự chi trả';

  @override
  String get device => 'thiết bị';

  @override
  String get ashtraTerminal => 'Nhà ga Ashtra';

  @override
  String get connectTo => 'Kết nối với';

  @override
  String get noReaderConnect => 'Không có đầu đọc nào được kết nối';

  @override
  String get connectReader => 'Kết nối đầu đọc';

  @override
  String get disconnectReader => 'Ngắt kết nối đầu đọc';

  @override
  String get quickAmounts => 'Số tiền nhanh';

  @override
  String get readCard => 'Đọc thẻ';

  @override
  String get completePayment => 'Hoàn tất thanh toán';

  @override
  String get serviceAmount => 'Số tiền dịch vụ';

  @override
  String get tipCanBeAddedNext => '(Tiền boa có thể được thêm vào tiếp theo)';

  @override
  String get processing => 'Xử lý...';

  @override
  String get howToFix => 'Cách khắc phục:';

  @override
  String get toEnsureReliablePayments =>
      'Để đảm bảo thanh toán đáng tin cậy, hãy sạc pin cho thiết bị M2 của bạn đến mức ít nhất 20%.';

  @override
  String get permissions => 'Quyền';

  @override
  String get settings => 'Cài đặt';

  @override
  String get continues => 'Tiếp tục';

  @override
  String get refreshStatus => 'Trạng thái làm mới';

  @override
  String get locationAccess => 'Quyền truy cập vị trí';

  @override
  String get phoneAccess => 'Truy cập điện thoại';

  @override
  String get bluetoothAccess => 'Truy cập Bluetooth';

  @override
  String get cameraAccess => 'Truy cập máy ảnh';

  @override
  String get bluetoothScan => 'Quét Bluetooth';

  @override
  String get bluetoothConnect => 'Kết nối Bluetooth';

  @override
  String get locationAccessDescription => 'Cần phải tìm đầu đọc thẻ gần đó';

  @override
  String get phoneAccessDescription =>
      'Cần thiết để nhận dạng thiết bị và gọi điện nếu cần';

  @override
  String get cameraAccessDescription =>
      'Cần thiết để quét mã QR và thiết lập trình đọc';

  @override
  String get bluetoothAccessDescription =>
      'Cần phải kết nối với đầu đọc thẻ Bluetooth';

  @override
  String get bluetoothScanDescription => 'Cần phải quét các thiết bị Bluetooth';

  @override
  String get blueetoothConnectAccessDescription =>
      'Cần thiết để kết nối các thiết bị Bluetooth';

  @override
  String get requiredForAppFunctionality => 'Cần thiết cho chức năng ứng dụng';

  @override
  String get enterThe6DigitCode =>
      'Nhập mã 6 chữ số trên thiết bị đầu cuối của bạn';

  @override
  String get enterThe6DigitPairingCode => 'Nhập mã ghép nối 6 chữ số';

  @override
  String get pair => 'Đôi';

  @override
  String get codeAndQRCodeUpdateEvery2Minute =>
      'Mã và Mã QR được cập nhật 2 phút một lần';

  @override
  String get pairTerminal => 'Cặp thiết bị đầu cuối';

  @override
  String get selectQRCodeToPairTerminal =>
      'Chọn Mã QR để Ghép nối Thiết bị đầu cuối';

  @override
  String get scanTheQRCodeDisplayedOnTheAdminPanel =>
      'Quét mã QR hiển thị trên bảng quản trị để ghép nối thiết bị với thiết bị đầu cuối của tiệm bạn.';

  @override
  String get searchingForReader => 'Đang tìm kiếm độc giả...';

  @override
  String get turnOnYourDeviceOrPleaseTryAgain =>
      'Bật thiết bị của bạn hoặc vui lòng thử lại.';

  @override
  String get refresh => 'Làm cho khỏe lại';

  @override
  String get bluetoothDisabled => 'Bluetooth bị tắt';

  @override
  String get pleaseEnableBluetooth =>
      'Vui lòng bật Bluetooth để tìm kiếm đầu đọc thẻ.';

  @override
  String get establishingConnection => 'Đang thiết lập kết nối...';

  @override
  String get readerId => 'ID người đọc:';

  @override
  String get deviceUpdateInProgress => 'Đang cập nhật thiết bị';

  @override
  String get updateDevice => 'Đang cập nhật thiết bị...';

  @override
  String get progress => 'Tiến triển';

  @override
  String get updateToVersion => 'Đang cập nhật phiên bản';

  @override
  String get pleaseWaitDoNotDisconnectTheDevice =>
      'Vui lòng đợi, không ngắt kết nối thiết bị';

  @override
  String get signatureRequired => 'Cần có chữ ký';

  @override
  String get paymentSummary => 'Tóm tắt thanh toán';

  @override
  String get subtotal => 'Tổng phụ:';

  @override
  String get tip => 'Mẹo:';

  @override
  String get total => 'Tổng cộng:';

  @override
  String get pleaseSignBelow =>
      'Vui lòng ký tên bên dưới để ủy quyền thanh toán';

  @override
  String get clearSignature => 'Xóa chữ ký';

  @override
  String get terminalSetupRequired => 'Yêu cầu thiết lập thiết bị đầu cuối';

  @override
  String get thisTerminalNeedsToBePaired =>
      'Thiết bị đầu cuối này cần được ghép nối với tài khoản doanh nghiệp của bạn để bắt đầu.';

  @override
  String get welcomeTo => 'Chào mừng đến với';

  @override
  String get terminalSetting => 'Cài đặt thiết bị đầu cuối';

  @override
  String get connectCardReader => 'Kết nối đầu đọc thẻ';

  @override
  String get searchAndConnectM2CardReader =>
      'Tìm kiếm và kết nối đầu đọc thẻ M2';

  @override
  String get cardReaderInfo => 'Thông tin đầu đọc thẻ';

  @override
  String get connectedCardReaderInfo =>
      'Xem thông tin đầu đọc thẻ được kết nối';

  @override
  String get disconnectCardReader => 'Ngắt kết nối đầu đọc thẻ';

  @override
  String get disconnectTheConnectedCardReader =>
      'Ngắt kết nối đầu đọc thẻ được kết nối';

  @override
  String get displaySettings => 'Cài đặt hiển thị';

  @override
  String get configureWhatToShowOnDashboard =>
      'Cấu hình những gì sẽ hiển thị trên bảng điều khiển';

  @override
  String get scanCheckInQRCode => 'Quét mã QR Check-in';

  @override
  String get scanCustomerQRCode => 'Quét mã QR của khách hàng để nhận phòng';

  @override
  String get testPayment => 'Thanh toán thử nghiệm';

  @override
  String get processingTestPayment => 'Đang xử lý khoản thanh toán thử nghiệm';

  @override
  String get refreshAllData => 'Làm mới tất cả dữ liệu';

  @override
  String get reloadWaitinglistAndServicesData =>
      'Tải lại danh sách chờ, dịch vụ và trạng thái';

  @override
  String get removeDeviceTerminal => 'Xóa thiết bị đầu cuối';

  @override
  String get clearAllDataAndReturnToHome =>
      'Xóa tất cả dữ liệu và trở về màn hình chính';

  @override
  String get addToWishlist => 'Thêm vào danh sách yêu thích';

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get saveChanges => 'Lưu thay đổi';

  @override
  String get displaySettingsSavedSuccessfully =>
      'Cài đặt hiển thị đã được lưu thành công';

  @override
  String get failedToSaveSettings => 'Không lưu được cài đặt:';

  @override
  String get showWaitingList => 'Hiển thị danh sách chờ';

  @override
  String get displayCustomerWaitingListDashboard =>
      'Hiển thị danh sách chờ của khách hàng trên bảng điều khiển';

  @override
  String get showServiceList => 'Hiển thị danh sách dịch vụ';

  @override
  String get displayAvailableService => 'Hiển thị các dịch vụ có sẵn';

  @override
  String get showServicePrices => 'Hiển thị giá dịch vụ';

  @override
  String get displayPriceInformation => 'Hiển thị thông tin giá cả';

  @override
  String get showServiceDuration => 'Hiển thị thời lượng dịch vụ';

  @override
  String get advancedSettings => 'Cài đặt nâng cao';

  @override
  String get groupServicesByCategory => 'Nhóm dịch vụ theo danh mục';

  @override
  String get organizeServiceIntoCategories =>
      'Tổ chức các dịch vụ thành các danh mục';

  @override
  String get showEstimatedWaitTime => 'Hiển thị thời gian chờ ước tính';

  @override
  String get displayExpectedWaitingTimeForCustomer =>
      'Hiển thị thời gian chờ dự kiến ​​của khách hàng';

  @override
  String get refreshInterval => 'Khoảng thời gian làm mới (giây)';

  @override
  String get howOftenToUpdateWaitingList => 'Tần suất cập nhật danh sách chờ';

  @override
  String get maxWaitingListItems => 'Mục danh sách chờ tối đa';

  @override
  String get maximumNumberOfCustomerToShow =>
      'Số lượng khách hàng tối đa để hiển thị';

  @override
  String get pointTheCameraAtTheCustomer =>
      'Hướng máy ảnh vào mã QR của khách hàng để kiểm tra';

  @override
  String get processingQrCode => 'Đang xử lý mã QR...';

  @override
  String get cameraPermissionRequiredToQRCodes =>
      'Cần có quyền truy cập máy ảnh để quét mã QR';

  @override
  String get cameraPermissionRequired => 'Cần có sự cho phép của máy ảnh';

  @override
  String get pleaseEnableCameraAccessInYourDevice =>
      'Vui lòng bật quyền truy cập camera trong cài đặt thiết bị của bạn để quét mã QR để làm thủ tục nhận phòng.';

  @override
  String get openSettings => 'Mở Cài đặt';

  @override
  String get invalidQrCodeFormat => 'Định dạng mã QR không hợp lệ';

  @override
  String get invalidQrCodeMissingInformation =>
      'Mã QR không hợp lệ: Thiếu thông tin bắt buộc';

  @override
  String get customerCheckedInSuccessfully =>
      'Khách hàng đã đăng ký thành công!';

  @override
  String get failedToCheckInCustomerPleaseTryAgain =>
      'Không thể làm thủ tục cho khách hàng. Vui lòng thử lại.';

  @override
  String get addATip => 'Thêm một mẹo?';

  @override
  String get serviceProviders => 'Nhà cung cấp dịch vụ';

  @override
  String get services => 'dịch vụ';

  @override
  String get noTip => 'Không có tiền boa';

  @override
  String get customTip => 'Mẹo tùy chỉnh';

  @override
  String get enterAmount => 'Nhập số tiền';

  @override
  String get enterCustomTipAmount => 'Nhập số tiền boa tùy chỉnh';

  @override
  String get tipAmount => 'Số tiền tip';

  @override
  String get kioskMode => 'Chế độ ki-ốt:';

  @override
  String get errorCheckingKioskMode => 'Lỗi khi kiểm tra chế độ kiosk:';

  @override
  String get startKioskMode => 'Đang bắt đầu chế độ kiosk...';

  @override
  String get kioskModeStartedSuccessfully =>
      'Chế độ kiosk đã bắt đầu thành công';

  @override
  String get failedToStartKioskMode => 'Không thể khởi động chế độ ki-ốt:';

  @override
  String get stoppingKioskMode => 'Đang dừng chế độ ki-ốt...';

  @override
  String get kioskModeStoppedSuccessfully => 'Chế độ kiosk đã dừng thành công';

  @override
  String get failedToStopKioskMode => 'Không dừng được chế độ ki-ốt:';

  @override
  String get deviceManagedKiosk => 'Kiosk được quản lý thiết bị:';

  @override
  String get errorCheckingManagedKiosk =>
      'Lỗi khi kiểm tra ki-ốt được quản lý:';

  @override
  String get noServicesAvailable => 'Không có dịch vụ nào';

  @override
  String get waitingList => 'Danh sách chờ';

  @override
  String get noCustomersWaiting => 'Không có khách hàng chờ đợi';

  @override
  String get appointmentsWillAppearHereWhenCustomersArrive =>
      'Các cuộc hẹn sẽ xuất hiện ở đây khi khách hàng đến';

  @override
  String get withs => 'Với:';

  @override
  String get timeLeft => 'Thời gian còn lại\n';

  @override
  String get noSpecificActionSuggested =>
      'Không có hành động cụ thể nào được đề xuất. Hãy liên hệ với bộ phận hỗ trợ nếu sự cố vẫn tiếp diễn.';

  @override
  String get unknows1 => 'Lỗi không xác định';

  @override
  String get unknownErrorPleaseTryAgain =>
      'Đã xảy ra lỗi không mong muốn. Vui lòng thử lại.';

  @override
  String get errorCode => 'MÃ LỖI';

  @override
  String get deviceStatus => 'Chi tiết lỗi';

  @override
  String get suggestAction => 'Hành động được đề xuất';

  @override
  String get dismiss => 'Miễn nhiệm';

  @override
  String get retry => 'Thử lại';

  @override
  String get errorDetails => 'Chi tiết lỗi';

  @override
  String get reader => 'đầu đọc';

  @override
  String get createPaymentIntent => 'Tạo ý định thanh toán...';

  @override
  String get processingPayment => 'Đang xử lý thanh toán...';

  @override
  String get paymentSuccessful => 'Thanh toán thành công!';

  @override
  String get pleasePresentCard => 'Vui lòng xuất trình thẻ...';

  @override
  String get cardReaderNotImplemented =>
      'Chưa triển khai chức năng đọc thẻ. Hãy sử dụng luồng thanh toán.';

  @override
  String get paymentFailed => 'Thanh toán thất bại';

  @override
  String get cardNotSupport =>
      'Thẻ không được hỗ trợ\n\nThẻ này không có ứng dụng thanh toán bằng chip. Vui lòng:\n• Hãy thử một thẻ khác có chip EMV\n• Sử dụng thẻ tín dụng hoặc thẻ ghi nợ hỗ trợ chip\n• Cắm thẻ vào thay vì chạm';

  @override
  String get cardReadingFailed =>
      'Đọc thẻ không thành công\n\nVui lòng thử:\n• Cắm thẻ hoàn toàn vào đầu đọc chip\n• Giữ chặt thẻ không tiếp xúc trong 2-3 giây\n• Vệ sinh thẻ và thử lại\n• Sử dụng thẻ khác';

  @override
  String get paymentDeclined =>
      'Thanh toán bị từ chối\n\nThẻ đã bị từ chối. Vui lòng:\n• Thử phương thức thanh toán khác\n• Liên hệ với ngân hàng của bạn\n• Kiểm tra số dư khả dụng';

  @override
  String get lowBatteryWarning1 =>
      'Cảnh báo pin yếu\n\nPin của đầu đọc thẻ đang ở mức cực thấp';

  @override
  String get lowBatteryWarning2 =>
      'Vui lòng:\n• Sạc thiết bị M2 đến 20%+\n• Kết nối cáp sạc\n• Đợi sạc trước khi xử lý thanh toán';

  @override
  String get readerDisconnected =>
      'Đầu đọc đã ngắt kết nối\n\nĐầu đọc thẻ M2 chưa được kết nối. Vui lòng:\n• Kiểm tra kết nối Bluetooth\n• Kết nối lại thiết bị M2\n• Đảm bảo đầu đọc đã được bật nguồn';

  @override
  String get pleaseTryAgainOrSupport =>
      'Vui lòng thử lại hoặc liên hệ với bộ phận hỗ trợ.';

  @override
  String get paymentError => 'Lỗi thanh toán';

  @override
  String get unexpectedError => 'Lỗi không mong muốn';

  @override
  String get pleaseTryAgain => 'Vui lòng thử lại.';

  @override
  String get useAChipEnabledCreditOrDebitCard =>
      'Sử dụng thẻ tín dụng hoặc thẻ ghi nợ có gắn chip';

  @override
  String get tryInsertingTheCardInsteadOfTapping =>
      'Hãy thử chèn thẻ thay vì chạm';

  @override
  String get ensureTheCardHasAnEMVChip =>
      'Đảm bảo thẻ có chip EMV (hình vuông nhỏ ở mặt trước)';

  @override
  String get contactYourBank =>
      'Liên hệ với ngân hàng của bạn nếu thẻ hoạt động';

  @override
  String get insertTheCardFullyAndLeaveItInTheReader =>
      'Cắm thẻ vào hoàn toàn và để nguyên trong đầu đọc';

  @override
  String get cleanTheCardChipAndMagneticStrip =>
      'Làm sạch chip và dải từ của thẻ';

  @override
  String get holdContactlessCardsSteadyFor2To3Seconds =>
      'Giữ chặt thẻ không tiếp xúc trong 2-3 giây';

  @override
  String get tryADifferentCardIfIssuesPersist =>
      'Hãy thử một thẻ khác nếu sự cố vẫn tiếp diễn';

  @override
  String get checkYourAccountBalance => 'Kiểm tra số dư tài khoản của bạn';

  @override
  String get contactYourBankToVerifyTheCardIsActive =>
      'Liên hệ với ngân hàng của bạn để xác minh thẻ đang hoạt động';

  @override
  String get tryADifferentPaymentMethod =>
      'Hãy thử một phương thức thanh toán khác';

  @override
  String get ensureTheCardHasNotExpired => 'Đảm bảo thẻ chưa hết hạn';

  @override
  String get chargeTheM2DeviceToAtLeast20Percent =>
      'Sạc thiết bị M2 đến mức ít nhất 20%';

  @override
  String get connectTheChargingCableAndWait => 'Kết nối cáp sạc và đợi';

  @override
  String get useADifferentPaymentMethodWhileCharging =>
      'Sử dụng phương thức thanh toán khác khi tính phí';

  @override
  String get checkTheChargingIndicatorLight => 'Kiểm tra đèn báo sạc';

  @override
  String get checkBluetoothConnectionOnThisDevice =>
      'Kiểm tra kết nối Bluetooth trên thiết bị này';

  @override
  String get powerCycleTheM2Reader => 'Tắt/bật lại đầu đọc M2';

  @override
  String get moveCloserToTheM2Reader => 'Tiến lại gần đầu đọc M2 hơn';

  @override
  String get restartTheAppIfConnectionIssuesPersist =>
      'Khởi động lại ứng dụng nếu sự cố kết nối vẫn tiếp diễn';

  @override
  String get tryThePaymentAgain => 'Hãy thử thanh toán lại';

  @override
  String get checkM2ReaderConnection => 'Kiểm tra kết nối đầu đọc M2';

  @override
  String get useADifferentCard => 'Sử dụng một thẻ khác';

  @override
  String get contactSupportIfIssuesContinue =>
      'Liên hệ bộ phận hỗ trợ nếu sự cố vẫn tiếp diễn';

  @override
  String get connectingToReader => 'Kết nối với đầu đọc';

  @override
  String get bluetoothIsDisabledPleaseEnable =>
      'Bluetooth đã tắt. Vui lòng bật Bluetooth.';

  @override
  String get failedToInitializeTerminal =>
      'Không thể khởi tạo thiết bị đầu cuối';

  @override
  String get searchingForDemoReaders => 'Đang tìm kiếm trình đọc demo...';

  @override
  String get noDemoReadersFound =>
      'Không tìm thấy trình đọc demo nào. Nhấn vào \"Sử dụng Trình đọc mô phỏng\" để tạo một trình đọc demo.';

  @override
  String get noReaderFoundMakeSureYourReaderIsOnAndNearby =>
      'Không tìm thấy đầu đọc. Hãy đảm bảo đầu đọc của bạn đang bật và ở gần.';

  @override
  String get demoDiscoveryFailed => 'Khám phá bản demo không thành công:';

  @override
  String get tryUsingSimulatedReader => 'Hãy thử sử dụng trình đọc mô phỏng';

  @override
  String get failedDuringDisconvery => 'Thất bại trong quá trình khám phá:';

  @override
  String get failedToStartDemoDiscovery =>
      'Không thể bắt đầu khám phá bản demo:';

  @override
  String get failedToStartDiscovery => 'Không thể bắt đầu khám phá:';

  @override
  String get connectingTo => 'Đang kết nối với';

  @override
  String get unknownReader => 'Người đọc không xác định';

  @override
  String get connectedSuccessfully => 'Đã kết nối thành công!';

  @override
  String get failedToConnectToReader => 'Không kết nối được với đầu đọc:';

  @override
  String get connectionError => 'Lỗi kết nối:';

  @override
  String get bluetoothManuallyEnabledStartingCardReaderDiscovery =>
      'Bluetooth được bật thủ công - bắt đầu phát hiện đầu đọc thẻ...';

  @override
  String get bluetoothNotSupportOnThisDevice =>
      'Bluetooth không được hỗ trợ trên thiết bị này';

  @override
  String get bluetoothInitializationFailed =>
      'Khởi tạo Bluetooth không thành công';

  @override
  String get bluetoothStatusUnknown => 'Trạng thái Bluetooth không xác định';

  @override
  String get bluetoothMonitoringFailed => 'Giám sát Bluetooth không thành công';

  @override
  String get bluetoothIsEnabled => 'Bluetooth đã được bật ✓';

  @override
  String get bluetoothIsDisabled => 'Bluetooth đã tắt. Vui lòng bật Bluetooth.';

  @override
  String get unableToCheckBluetoothStatus =>
      'Không thể kiểm tra trạng thái Bluetooth';

  @override
  String get granted => 'Giả dụ như vậy';

  @override
  String get denied => 'Từ chối';

  @override
  String get permanentlyDenied => 'Bị từ chối vĩnh viễn - Vào Cài đặt để bật';

  @override
  String get restricted => 'Hạn chế - Kiểm tra cài đặt';

  @override
  String get limited => 'Giới hạn';

  @override
  String get provisional => 'tạm thời';

  @override
  String get locationServicesDisabled =>
      'Đã tắt Dịch vụ định vị - Bật trong Cài đặt > Quyền riêng tư > Dịch vụ định vị';

  @override
  String get simulator => 'Trình mô phỏng - Chạm vào Cài đặt để kiểm tra';

  @override
  String get qrCodeJsonMissingPairingCode =>
      'Mã QR JSON thiếu trường pairingCode';

  @override
  String get invalidQRCodeFormate =>
      'Định dạng mã QR không hợp lệ. Cần mã ghép nối 6 chữ số hoặc JSON có trường pairingCode.';

  @override
  String get failedToPairDeviceWithBackend =>
      'Không ghép nối được thiết bị với phần phụ trợ';

  @override
  String get invalidInput => 'Đầu vào không hợp lệ';

  @override
  String get pleaseEnterAPairingCode => 'Vui lòng nhập mã ghép nối';

  @override
  String get invalidCode => 'Mã không hợp lệ';

  @override
  String get pairingCodeMustBe6Digits => 'Mã ghép nối phải là số 6 chữ số';

  @override
  String get disconnected => 'Đã ngắt kết nối';

  @override
  String get viewCardReaderDetails => 'Xem chi tiết đầu đọc thẻ';

  @override
  String get disconnectCurrentCardReader => 'Ngắt kết nối đầu đọc thẻ hiện tại';

  @override
  String get processATestPayment => 'Xử lý thanh toán thử nghiệm';

  @override
  String get testCardCollection => 'Kiểm Tra Thu Thập Thẻ';

  @override
  String get testCollectingCardForSaving => 'Kiểm tra thu thập thẻ để lưu';

  @override
  String get displayEstimatedServiceTime =>
      'Hiển thị thời gian dịch vụ ước tính';

  @override
  String get closeScanner => 'Đóng máy quét';

  @override
  String get kioskSettings => 'Cài đặt Kiosk';

  @override
  String get kioskModeStatus => 'Trạng thái Kiosk Mode';

  @override
  String get currentlyEnable => 'Hiện đã được bật';

  @override
  String get currentlyDisable => 'Hiện đang vô hiệu hóa';

  @override
  String get checkManaged => 'Kiểm tra được quản lý';

  @override
  String get disableKioskMode => 'Tắt chế độ Kiosk';

  @override
  String get enableKioskMode => 'Bật chế độ Kiosk';

  @override
  String get checkingKioskStatus => 'Đang kiểm tra trạng thái Kiosk...';

  @override
  String get kioskModeEnabled => 'Chế độ Kiosk đã được bật';

  @override
  String get kioskModeDisabled => 'Chế độ Kiosk đã bị tắt';

  @override
  String get tapForDetail => 'Chạm để biết thêm chi tiết';

  @override
  String get servicesWillAppearHereOnceTheyAreConfigured =>
      'Các dịch vụ sẽ xuất hiện ở đây khi chúng được cấu hình';

  @override
  String get addNewCustomer => 'Thêm Khách Hàng Mới';

  @override
  String get createNewCustomerProfile => 'Tạo hồ sơ khách hàng mới';

  @override
  String get customerType => 'Loại Khách Hàng';

  @override
  String get basicInformation => 'Thông Tin Cơ Bản';

  @override
  String get firstName => 'Tên';

  @override
  String get enterFirstName => 'Nhập tên';

  @override
  String get lastName => 'Họ';

  @override
  String get enterLastName => 'Nhập họ';

  @override
  String get phoneNumber => 'Số Điện Thoại';

  @override
  String get enterPhoneNumber => 'Nhập số điện thoại';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Nhập địa chỉ email';

  @override
  String get gender => 'Giới Tính';

  @override
  String get male => 'Nam';

  @override
  String get female => 'Nữ';

  @override
  String get other => 'Khác';

  @override
  String get preferNotToSay => 'Không muốn nói';

  @override
  String get dateOfBirth => 'Ngày Sinh';

  @override
  String get selectDateOfBirth => 'Chọn ngày sinh';

  @override
  String get notes => 'Ghi Chú';

  @override
  String get enterNotes => 'Nhập ghi chú bổ sung';

  @override
  String get consentRequired => 'Yêu Cầu Đồng Ý';

  @override
  String get customerConsentMessage =>
      'Bằng cách tạo tài khoản này, khách hàng đồng ý với các điều khoản và chính sách bảo mật của Ashtra.';

  @override
  String get agreeToTerms => 'Tôi đồng ý với';

  @override
  String get agreeToPrivacy => 'Tôi đồng ý với';

  @override
  String get termsOfService => 'Điều Khoản Dịch Vụ';

  @override
  String get privacyPolicy => 'Chính Sách Bảo Mật';

  @override
  String get createCustomer => 'Tạo Khách Hàng';

  @override
  String get regular => 'Thường';

  @override
  String get walkIn => 'Khách Vãng Lai';

  @override
  String get vip => 'VIP';

  @override
  String get paymentMethods => 'Phương Thức Thanh Toán';

  @override
  String get addPaymentMethod => 'Thêm Phương Thức Thanh Toán';

  @override
  String get savedPaymentMethods => 'Phương Thức Thanh Toán Đã Lưu';

  @override
  String get noPaymentMethods => 'Không có phương thức thanh toán nào được lưu';

  @override
  String get defaultPaymentMethod => 'Mặc Định';

  @override
  String get setAsDefault => 'Đặt Làm Mặc Định';

  @override
  String get deletePaymentMethod => 'Xóa Phương Thức Thanh Toán';

  @override
  String get confirmDeletePaymentMethod =>
      'Bạn có chắc chắn muốn xóa phương thức thanh toán này không?';

  @override
  String get paymentMethodDeleted => 'Đã xóa phương thức thanh toán thành công';

  @override
  String get paymentMethodSetAsDefault =>
      'Đã đặt phương thức thanh toán làm mặc định';

  @override
  String get failedToDeletePaymentMethod =>
      'Không thể xóa phương thức thanh toán';

  @override
  String get failedToSetDefaultPaymentMethod =>
      'Không thể đặt phương thức thanh toán mặc định';

  @override
  String get cardEndingIn => 'Thẻ kết thúc bằng';

  @override
  String get expiresOn => 'Hết hạn';

  @override
  String get expired => 'Đã hết hạn';

  @override
  String get presentCard => 'Đưa Thẻ';

  @override
  String get insertTapOrSwipeCard => 'Chèn, chạm hoặc quẹt thẻ để lưu';

  @override
  String get savingPaymentMethod => 'Đang lưu phương thức thanh toán...';

  @override
  String get paymentMethodSaved => 'Đã lưu phương thức thanh toán thành công';

  @override
  String get failedToSavePaymentMethod =>
      'Không thể lưu phương thức thanh toán';

  @override
  String get customerCreatedSuccessfully => 'Đã tạo khách hàng thành công';

  @override
  String get failedToCreateCustomer => 'Không thể tạo khách hàng';

  @override
  String get customerAlreadyExists => 'Đã có khách hàng với số điện thoại này';

  @override
  String get invalidPhoneNumber => 'Vui lòng nhập số điện thoại hợp lệ';

  @override
  String get invalidEmail => 'Vui lòng nhập địa chỉ email hợp lệ';

  @override
  String get nameMinLength => 'Tên phải có ít nhất 2 ký tự';

  @override
  String get pleaseAgreeToTerms => 'Vui lòng đồng ý với Điều Khoản Dịch Vụ';

  @override
  String get pleaseAgreeToPrivacy => 'Vui lòng đồng ý với Chính Sách Bảo Mật';

  @override
  String get addPaymentMethodQuestion =>
      'Bạn có muốn thêm phương thức thanh toán cho khách hàng này không?';

  @override
  String get addPaymentMethodNow => 'Thêm Phương Thức Thanh Toán';

  @override
  String get skipForNow => 'Bỏ Qua';

  @override
  String get collectingCardDetails => 'Đang thu thập thông tin thẻ...';

  @override
  String get presentCardToReader =>
      'Vui lòng đưa thẻ của khách hàng vào đầu đọc';

  @override
  String get cardCollectedSuccessfully => 'Đã thu thập và lưu thẻ thành công';

  @override
  String get failedToCollectCard => 'Không thể thu thập thông tin thẻ';

  @override
  String get cardCollectionRequest => 'Yêu Cầu Thu Thập Thẻ';

  @override
  String get collectCardFor => 'Thu thập thẻ cho';

  @override
  String get customerRequestedCardCollection =>
      'Một doanh nghiệp đã yêu cầu thu thập thông tin thẻ cho khách hàng này.';

  @override
  String get collectCard => 'Thu Thập Thẻ';

  @override
  String get cancelCollection => 'Hủy';

  @override
  String get collectingCard => 'Đang Thu Thập Thẻ';

  @override
  String get pleaseInsertTapOrSwipeCard =>
      'Vui lòng chèn, chạm hoặc quẹt thẻ của khách hàng';

  @override
  String get cardCollectionSuccess => 'Đã thu thập thẻ thành công';

  @override
  String get cardCollectionFailed => 'Thu thập thẻ thất bại';

  @override
  String get cardCollectionCancelled => 'Đã hủy thu thập thẻ';

  @override
  String get noCardCollectionRequest => 'Không có yêu cầu thu thập thẻ';

  @override
  String get waitingForCardCollectionRequest =>
      'Đang chờ yêu cầu thu thập thẻ từ doanh nghiệp...';

  @override
  String get cardCollectionDescription =>
      'Thẻ sẽ được lưu cho thanh toán trong tương lai';

  @override
  String get setAsDefaultCard => 'Đặt làm thẻ mặc định';

  @override
  String get cardNickname => 'Tên gọi thẻ';

  @override
  String get processingCardCollection => 'Đang xử lý thu thập thẻ...';

  @override
  String get submittingCardDetails => 'Đang gửi thông tin thẻ...';

  @override
  String get cardCollectionComplete => 'Hoàn tất thu thập thẻ';

  @override
  String get returnToDashboard => 'Quay Lại Bảng Điều Khiển';

  @override
  String get tryAgain => 'Thử Lại';

  @override
  String get cardDetailsCollected => 'Đã thu thập thông tin thẻ';

  @override
  String get cardBrand => 'Thương hiệu thẻ';

  @override
  String get lastFourDigits => '4 số cuối';

  @override
  String get expirationDate => 'Ngày hết hạn';
}
