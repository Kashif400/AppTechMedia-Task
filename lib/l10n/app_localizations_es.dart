// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get loginIn => 'Acceso';

  @override
  String get frontDeskMode => 'Modo de recepción';

  @override
  String get connectAReader => 'Conectar una lectora';

  @override
  String get skip => 'Saltar';

  @override
  String get selectACardReaderToConnect =>
      'Seleccione un lector de tarjetas para conectar este dispositivo';

  @override
  String get searchingForReaders => 'Buscando lectoras ...';

  @override
  String get makeSureYourReaderIsPowered =>
      'Asegúrese de que su lector esté encendido y en modo de emparejamiento.';

  @override
  String get cardReaderDisconnected => 'Lector de tarjetas desconectado';

  @override
  String get cardReaderDisconnectedDescription =>
      'El lector de tarjetas se ha desconectado correctamente del terminal.';

  @override
  String get done => 'Hecho';

  @override
  String get cardReaderInformation => 'Información del lector de tarjetas';

  @override
  String get batteryLevel => 'Nivel de batería:';

  @override
  String get status => 'Estado';

  @override
  String get connected => 'Conectada';

  @override
  String get deviceType => 'Tipo de dispositivo';

  @override
  String get serialNumber => 'Número de serie:';

  @override
  String get ok => 'DE ACUERDO';

  @override
  String get discoveringCardReaders => 'Descubriendo lectoras de tarjetas';

  @override
  String get searchingForAvailableM2CardReaders =>
      'Buscando lectores de tarjetas M2 disponibles...\n\nAsegúrese de que su lector de tarjetas esté:\n• Encendido\n• En modo de emparejamiento\n• Dentro del alcance de Bluetooth';

  @override
  String get deviceInformation => 'Información del dispositivo';

  @override
  String get online => 'En línea';

  @override
  String get offline => 'Desconectada';

  @override
  String get connection => 'Conexión';

  @override
  String get location => 'Ubicación:';

  @override
  String get terminalId => 'Identificación del terminal:';

  @override
  String get discoveringDevices => 'Descubriendo dispositivos';

  @override
  String get discoveringDevicesDescription =>
      'Por favor espere mientras buscamos dispositivos disponibles...';

  @override
  String get searching => 'Búsqueda...';

  @override
  String get error => 'Error';

  @override
  String get unknownError => 'Se produjo un error desconocido.';

  @override
  String get generalError => 'Error general';

  @override
  String get critical => 'crítica';

  @override
  String get fatal => 'fatal';

  @override
  String get warning => 'advertencia';

  @override
  String get network => 'red';

  @override
  String get payment => 'pago';

  @override
  String get device => 'dispositivo';

  @override
  String get ashtraTerminal => 'Terminal Ashtra';

  @override
  String get connectTo => 'Conéctate a';

  @override
  String get noReaderConnect => 'No hay lectora conectada';

  @override
  String get connectReader => 'Conectar lector';

  @override
  String get disconnectReader => 'Desconectar la lectora';

  @override
  String get quickAmounts => 'Montos rápidos';

  @override
  String get readCard => 'Leer tarjeta';

  @override
  String get completePayment => 'Pago completo';

  @override
  String get serviceAmount => 'Monto del servicio';

  @override
  String get tipCanBeAddedNext => '(Se puede agregar propina a continuación)';

  @override
  String get processing => 'Procesando...';

  @override
  String get howToFix => 'Cómo solucionar esto:';

  @override
  String get toEnsureReliablePayments =>
      'Para garantizar pagos confiables, cargue su dispositivo M2 al menos al 20% de batería.';

  @override
  String get permissions => 'Permisos';

  @override
  String get settings => 'Configuraciones';

  @override
  String get continues => 'Continuar';

  @override
  String get refreshStatus => 'Actualizar estado';

  @override
  String get locationAccess => 'Acceso a la ubicación';

  @override
  String get phoneAccess => 'Acceso telefónico';

  @override
  String get bluetoothAccess => 'Acceso Bluetooth';

  @override
  String get cameraAccess => 'Acceso a la cámara';

  @override
  String get bluetoothScan => 'Escaneo Bluetooth';

  @override
  String get bluetoothConnect => 'Conexión Bluetooth';

  @override
  String get locationAccessDescription =>
      'Necesario para descubrir lectores de tarjetas cercanos';

  @override
  String get phoneAccessDescription =>
      'Necesario para la identificación del dispositivo y para realizar llamadas si es necesario.';

  @override
  String get cameraAccessDescription =>
      'Necesario para escanear códigos QR y configurar el lector';

  @override
  String get bluetoothAccessDescription =>
      'Necesario para conectarse a lectores de tarjetas Bluetooth';

  @override
  String get bluetoothScanDescription =>
      'Necesario para buscar dispositivos Bluetooth';

  @override
  String get blueetoothConnectAccessDescription =>
      'Necesario para conectar dispositivos Bluetooth';

  @override
  String get requiredForAppFunctionality =>
      'Necesario para la funcionalidad de la aplicación';

  @override
  String get enterThe6DigitCode =>
      'Introduzca el código de 6 dígitos en su dispositivo terminal';

  @override
  String get enterThe6DigitPairingCode =>
      'Introduzca el código de emparejamiento de 6 dígitos';

  @override
  String get pair => 'Par';

  @override
  String get codeAndQRCodeUpdateEvery2Minute =>
      'Código y código QR actualizados cada 2 minutos';

  @override
  String get pairTerminal => 'Terminal de par';

  @override
  String get selectQRCodeToPairTerminal =>
      'Seleccione el código QR para emparejar el terminal';

  @override
  String get scanTheQRCodeDisplayedOnTheAdminPanel =>
      'Escanee el código QR que se muestra en el panel de administración para emparejar el dispositivo con la terminal de su salón.';

  @override
  String get searchingForReader => 'Buscando lectoras ...';

  @override
  String get turnOnYourDeviceOrPleaseTryAgain =>
      'Encienda su dispositivo o inténtelo nuevamente.';

  @override
  String get refresh => 'Refrescar';

  @override
  String get bluetoothDisabled => 'Bluetooth está deshabilitado';

  @override
  String get pleaseEnableBluetooth =>
      'Habilite Bluetooth para buscar lectores de tarjetas.';

  @override
  String get establishingConnection => 'Estableciendo conexión...';

  @override
  String get readerId => 'Identificación del lector:';

  @override
  String get deviceUpdateInProgress => 'Actualización del dispositivo en curso';

  @override
  String get updateDevice => 'Actualizando dispositivo...';

  @override
  String get progress => 'Progreso';

  @override
  String get updateToVersion => 'Actualizando a la versión';

  @override
  String get pleaseWaitDoNotDisconnectTheDevice =>
      'Por favor espere, no desconecte el dispositivo';

  @override
  String get signatureRequired => 'Firma requerida';

  @override
  String get paymentSummary => 'Resumen de pago';

  @override
  String get subtotal => 'Total parcial:';

  @override
  String get tip => 'Consejo:';

  @override
  String get total => 'Total:';

  @override
  String get pleaseSignBelow =>
      'Por favor firme a continuación para autorizar el pago.';

  @override
  String get clearSignature => 'Borrar firma';

  @override
  String get terminalSetupRequired => 'Se requiere configuración de terminal';

  @override
  String get thisTerminalNeedsToBePaired =>
      'Esta terminal debe estar vinculada a su cuenta comercial para comenzar.';

  @override
  String get welcomeTo => 'Bienvenido a';

  @override
  String get terminalSetting => 'Configuración de terminales';

  @override
  String get connectCardReader => 'Conectar lector de tarjetas';

  @override
  String get searchAndConnectM2CardReader =>
      'Busque y conecte el lector de tarjetas M2';

  @override
  String get cardReaderInfo => 'Información del lector de tarjetas';

  @override
  String get connectedCardReaderInfo =>
      'Ver información del lector de tarjetas conectado';

  @override
  String get disconnectCardReader => 'Desconectar el lector de tarjetas';

  @override
  String get disconnectTheConnectedCardReader =>
      'Desconecte el lector de tarjetas conectado';

  @override
  String get displaySettings => 'Configuración de pantalla';

  @override
  String get configureWhatToShowOnDashboard =>
      'Configurar qué mostrar en el panel';

  @override
  String get scanCheckInQRCode => 'Escanear el código QR de check-in';

  @override
  String get scanCustomerQRCode =>
      'Escanee el código QR del cliente para realizar el check-in';

  @override
  String get testPayment => 'Pago de prueba';

  @override
  String get processingTestPayment => 'Procesando un pago de prueba';

  @override
  String get refreshAllData => 'Actualizar todos los datos';

  @override
  String get reloadWaitinglistAndServicesData =>
      'Recargar lista de espera, servicios y estado';

  @override
  String get removeDeviceTerminal => 'Quitar terminal del dispositivo';

  @override
  String get clearAllDataAndReturnToHome =>
      'Borrar todos los datos y volver a la pantalla de inicio';

  @override
  String get addToWishlist => 'Añadir a la lista de deseos';

  @override
  String get cancel => 'Cancelar';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get displaySettingsSavedSuccessfully =>
      'La configuración de pantalla se guardó correctamente';

  @override
  String get failedToSaveSettings =>
      'No se pudieron guardar las configuraciones:';

  @override
  String get showWaitingList => 'Mostrar lista de espera';

  @override
  String get displayCustomerWaitingListDashboard =>
      'Mostrar la lista de espera de clientes en el panel de control';

  @override
  String get showServiceList => 'Mostrar lista de servicios';

  @override
  String get displayAvailableService => 'Mostrar servicios disponibles';

  @override
  String get showServicePrices => 'Mostrar precios de servicios';

  @override
  String get displayPriceInformation => 'Mostrar información de precios';

  @override
  String get showServiceDuration => 'Mostrar duración del servicio';

  @override
  String get advancedSettings => 'Configuración avanzada';

  @override
  String get groupServicesByCategory => 'Servicios grupales por categoría';

  @override
  String get organizeServiceIntoCategories =>
      'Organizar los servicios en categorías';

  @override
  String get showEstimatedWaitTime => 'Mostrar tiempo de espera estimado';

  @override
  String get displayExpectedWaitingTimeForCustomer =>
      'Mostrar el tiempo de espera esperado para las clientes';

  @override
  String get refreshInterval => 'Intervalo de actualización (segundos)';

  @override
  String get howOftenToUpdateWaitingList =>
      '¿Con qué frecuencia actualizar la lista de espera?';

  @override
  String get maxWaitingListItems => 'Máximo de elementos de la lista de espera';

  @override
  String get maximumNumberOfCustomerToShow =>
      'Número máximo de clientes a mostrar';

  @override
  String get pointTheCameraAtTheCustomer =>
      'Apunte la cámara al código QR del cliente para registrarlo';

  @override
  String get processingQrCode => 'Procesando código QR...';

  @override
  String get cameraPermissionRequiredToQRCodes =>
      'Se requiere permiso de la cámara para escanear códigos QR';

  @override
  String get cameraPermissionRequired => 'Se requiere permiso de cámara';

  @override
  String get pleaseEnableCameraAccessInYourDevice =>
      'Habilite el acceso a la cámara en la configuración de su dispositivo para escanear códigos QR para el check-in.';

  @override
  String get openSettings => 'Abrir configuración';

  @override
  String get invalidQrCodeFormat => 'Formato de código QR no válido';

  @override
  String get invalidQrCodeMissingInformation =>
      'Código QR no válido: falta la información requerida';

  @override
  String get customerCheckedInSuccessfully =>
      '¡El cliente se registró exitosamente!';

  @override
  String get failedToCheckInCustomerPleaseTryAgain =>
      'No se pudo registrar al cliente. Inténtelo de nuevo.';

  @override
  String get addATip => '¿Agregar una sugerencia?';

  @override
  String get serviceProviders => 'Proveedores de servicios';

  @override
  String get services => 'servicios';

  @override
  String get noTip => 'Sin propina';

  @override
  String get customTip => 'Consejo personalizado';

  @override
  String get enterAmount => 'Ingrese la cantidad';

  @override
  String get enterCustomTipAmount =>
      'Ingrese un monto de propina personalizado';

  @override
  String get tipAmount => 'Cantidad de propina';

  @override
  String get kioskMode => 'Modo quiosco:';

  @override
  String get errorCheckingKioskMode => 'Error al comprobar el modo quiosco:';

  @override
  String get startKioskMode => 'Iniciando el modo quiosco...';

  @override
  String get kioskModeStartedSuccessfully =>
      'El modo quiosco se inició correctamente';

  @override
  String get failedToStartKioskMode => 'No se pudo iniciar el modo quiosco:';

  @override
  String get stoppingKioskMode => 'Deteniendo el modo quiosco...';

  @override
  String get kioskModeStoppedSuccessfully =>
      'El modo quiosco se detuvo correctamente';

  @override
  String get failedToStopKioskMode => 'No se pudo detener el modo quiosco:';

  @override
  String get deviceManagedKiosk => 'Quiosco administrado por dispositivos:';

  @override
  String get errorCheckingManagedKiosk =>
      'Error al comprobar el quiosco administrado:';

  @override
  String get noServicesAvailable => 'No hay servicios disponibles';

  @override
  String get waitingList => 'Lista de espera';

  @override
  String get noCustomersWaiting => 'No hay clientes esperando';

  @override
  String get appointmentsWillAppearHereWhenCustomersArrive =>
      'Las citas aparecerán aquí cuando lleguen los clientes.';

  @override
  String get withs => 'Con:';

  @override
  String get timeLeft => 'Tiempo restante\n';

  @override
  String get noSpecificActionSuggested =>
      'No se sugiere ninguna acción específica. Contacta con el servicio de asistencia si el problema persiste.';

  @override
  String get unknows1 => 'Error desconocido';

  @override
  String get unknownErrorPleaseTryAgain =>
      'Se produjo un error inesperado. Inténtalo de nuevo.';

  @override
  String get errorCode => 'CÓDIGO DE ERROR';

  @override
  String get deviceStatus => 'Detalles del error';

  @override
  String get suggestAction => 'Acción sugerida';

  @override
  String get dismiss => 'Despedir';

  @override
  String get retry => 'Rever';

  @override
  String get errorDetails => 'Chi tiết lỗi';

  @override
  String get reader => 'Lectora';

  @override
  String get createPaymentIntent => 'Creando intención de pago...';

  @override
  String get processingPayment => 'Procesando pago...';

  @override
  String get paymentSuccessful => 'Pago exitosa!';

  @override
  String get pleasePresentCard => 'Por favor presentar tarjeta...';

  @override
  String get cardReaderNotImplemented =>
      'La lectura de tarjetas aún no está implementada. Utilice el flujo de pago.';

  @override
  String get paymentFailed => 'Pago fallido';

  @override
  String get cardNotSupport =>
      'Tarjeta no compatible\n\nEsta tarjeta no tiene aplicaciones de pago con chip. Por favor:\n• Pruebe con otra tarjeta con chip EMV\n• Use una tarjeta de crédito o débito con chip\n• Inserte la tarjeta en lugar de tocarla';

  @override
  String get cardReadingFailed =>
      'Error en la lectura de la tarjeta\n\nPor favor, intente:\n• Inserte la tarjeta completamente en el lector de chip\n• Mantenga las tarjetas sin contacto firmes durante 2-3 segundos\n• Limpie la tarjeta e inténtelo de nuevo\n• Use una tarjeta diferente';

  @override
  String get paymentDeclined =>
      'Pago rechazado\n\nLa tarjeta fue rechazada. Por favor:\n• Pruebe con otro método de pago\n• Contacte a su banco\n• Consulte el saldo disponible';

  @override
  String get lowBatteryWarning1 =>
      'Advertencia de batería baja\n\nLa batería del lector de tarjetas está extremadamente baja';

  @override
  String get lowBatteryWarning2 =>
      'Por favor:\n• Cargue el dispositivo M2 al 20 % o más\n• Conecte el cable de carga\n• Espere a que se cargue antes de procesar los pagos';

  @override
  String get readerDisconnected =>
      'Lector desconectado\n\nEl lector de tarjetas M2 no está conectado. Por favor:\n• Verifique la conexión Bluetooth\n• Vuelva a conectar el dispositivo M2\n• Asegúrese de que el lector esté encendido';

  @override
  String get pleaseTryAgainOrSupport =>
      'Inténtelo de nuevo o póngase en contacto con el soporte técnico.';

  @override
  String get paymentError => 'Error de pago';

  @override
  String get unexpectedError => 'Error inesperado';

  @override
  String get pleaseTryAgain => 'Por favor inténtalo de nuevo.';

  @override
  String get useAChipEnabledCreditOrDebitCard =>
      'Utilice una tarjeta de crédito o débito con chip';

  @override
  String get tryInsertingTheCardInsteadOfTapping =>
      'Intente insertar la tarjeta en lugar de tocarla';

  @override
  String get ensureTheCardHasAnEMVChip =>
      'Asegúrese de que la tarjeta tenga un chip EMV (pequeño cuadrado en el frente)';

  @override
  String get contactYourBank =>
      'Comuníquese con su banco si la tarjeta debería funcionar';

  @override
  String get insertTheCardFullyAndLeaveItInTheReader =>
      'Inserte la tarjeta completamente y déjela en el lector.';

  @override
  String get cleanTheCardChipAndMagneticStrip =>
      'Limpiar el chip y la banda magnética de la tarjeta';

  @override
  String get holdContactlessCardsSteadyFor2To3Seconds =>
      'Mantenga las tarjetas sin contacto firmemente durante 2 o 3 segundos';

  @override
  String get tryADifferentCardIfIssuesPersist =>
      'Pruebe con una tarjeta diferente si los problemas persisten';

  @override
  String get checkYourAccountBalance => 'Consulta el saldo de tu cuenta';

  @override
  String get contactYourBankToVerifyTheCardIsActive =>
      'Comuníquese con su banco para verificar que la tarjeta esté activa.';

  @override
  String get tryADifferentPaymentMethod => 'Pruebe un método de pago diferente';

  @override
  String get ensureTheCardHasNotExpired =>
      'Asegúrese de que la tarjeta no haya caducado';

  @override
  String get chargeTheM2DeviceToAtLeast20Percent =>
      'Cargue el dispositivo M2 al menos al 20%';

  @override
  String get connectTheChargingCableAndWait =>
      'Conecte el cable de carga y espere.';

  @override
  String get useADifferentPaymentMethodWhileCharging =>
      'Utilice un método de pago diferente al cargar';

  @override
  String get checkTheChargingIndicatorLight =>
      'Compruebe la luz indicadora de carga';

  @override
  String get checkBluetoothConnectionOnThisDevice =>
      'Compruebe la conexión Bluetooth en este dispositivo';

  @override
  String get powerCycleTheM2Reader =>
      'Apague y encienda el lector M2 (apagar y encender)';

  @override
  String get moveCloserToTheM2Reader => 'Acércate a la lectora M2';

  @override
  String get restartTheAppIfConnectionIssuesPersist =>
      'Reinicie la aplicación si los problemas de conexión persisten';

  @override
  String get tryThePaymentAgain => 'Intenta el pago nuevamente';

  @override
  String get checkM2ReaderConnection => 'Comprobar la conexión del lector M2';

  @override
  String get useADifferentCard => 'Usa una tarjeta diferente';

  @override
  String get contactSupportIfIssuesContinue =>
      'Comuníquese con el soporte técnico si los problemas persisten';

  @override
  String get connectingToReader => 'Conexión al lector';

  @override
  String get bluetoothIsDisabledPleaseEnable =>
      'El Bluetooth está desactivado. Activa el Bluetooth.';

  @override
  String get failedToInitializeTerminal => 'No se pudo inicializar la terminal';

  @override
  String get searchingForDemoReaders => 'Buscando lectores de demostración...';

  @override
  String get noDemoReadersFound =>
      'No se encontraron lectores de demostración. Pulse \"Usar lector simulado\" para crear uno.';

  @override
  String get noReaderFoundMakeSureYourReaderIsOnAndNearby =>
      'No se encontró ningún lector. Asegúrate de que tu lector esté encendido y cerca.';

  @override
  String get demoDiscoveryFailed =>
      'Error en el descubrimiento de demostración:';

  @override
  String get tryUsingSimulatedReader => 'Intenta usar lectora simulada';

  @override
  String get failedDuringDisconvery => 'Error durante el descubrimiento:';

  @override
  String get failedToStartDemoDiscovery =>
      'No se pudo iniciar el descubrimiento de demostración:';

  @override
  String get failedToStartDiscovery => 'No se pudo iniciar el descubrimiento:';

  @override
  String get connectingTo => 'Conectándose a';

  @override
  String get unknownReader => 'Lector desconocida';

  @override
  String get connectedSuccessfully => '¡Conectado exitosamente!';

  @override
  String get failedToConnectToReader => 'No se pudo conectar a la lectora:';

  @override
  String get connectionError => 'Error de conexión:';

  @override
  String get bluetoothManuallyEnabledStartingCardReaderDiscovery =>
      'Bluetooth habilitado manualmente: iniciando el descubrimiento del lector de tarjetas...';

  @override
  String get bluetoothNotSupportOnThisDevice =>
      'Bluetooth no es compatible con este dispositivo';

  @override
  String get bluetoothInitializationFailed =>
      'La inicialización de Bluetooth falló';

  @override
  String get bluetoothStatusUnknown => 'Estado de Bluetooth desconocido';

  @override
  String get bluetoothMonitoringFailed => 'La supervisión de Bluetooth falló';

  @override
  String get bluetoothIsEnabled => 'Bluetooth está habilitado ✓';

  @override
  String get bluetoothIsDisabled =>
      'El Bluetooth está desactivado. Activa el Bluetooth.';

  @override
  String get unableToCheckBluetoothStatus =>
      'No se puede comprobar el estado del Bluetooth';

  @override
  String get granted => 'Concedida';

  @override
  String get denied => 'Denegada';

  @override
  String get permanentlyDenied =>
      'Denegado permanentemente: vaya a Configuración para habilitar';

  @override
  String get restricted => 'Restringido - Verificar configuración';

  @override
  String get limited => 'Limitada';

  @override
  String get provisional => 'Provisional';

  @override
  String get locationServicesDisabled =>
      'Servicios de ubicación deshabilitados: habilítelos en Configuración > Privacidad > Servicios de ubicación';

  @override
  String get simulator => 'Simulador: Toque Configuración para probar';

  @override
  String get qrCodeJsonMissingPairingCode =>
      'Falta el campo pairingCode en el código QR JSON';

  @override
  String get invalidQRCodeFormate =>
      'Formato de código QR no válido. Se esperaba un código de emparejamiento de 6 dígitos o JSON con el campo pairing Code.';

  @override
  String get failedToPairDeviceWithBackend =>
      'No se pudo emparejar el dispositivo con el backend';

  @override
  String get invalidInput => 'Entrada no válida';

  @override
  String get pleaseEnterAPairingCode =>
      'Por favor, introduzca un código de emparejamiento';

  @override
  String get invalidCode => 'Código no válido';

  @override
  String get pairingCodeMustBe6Digits =>
      'El código de emparejamiento debe ser un número de 6 dígitos';

  @override
  String get disconnected => 'Desconectada';

  @override
  String get viewCardReaderDetails => 'Ver detalles del lector de tarjetas';

  @override
  String get disconnectCurrentCardReader =>
      'Desconecte el lector de tarjetas actual';

  @override
  String get processATestPayment => 'Procesar un pago de prueba';

  @override
  String get testCardCollection => 'Prueba de Recolección de Tarjeta';

  @override
  String get testCollectingCardForSaving =>
      'Probar la recolección de tarjeta para guardar';

  @override
  String get displayEstimatedServiceTime =>
      'Mostrar tiempo estimado de servicio';

  @override
  String get closeScanner => 'Cerrar escáner';

  @override
  String get kioskSettings => 'Configuración del Kiosco';

  @override
  String get kioskModeStatus => 'Estado del Modo Kiosco';

  @override
  String get currentlyEnable => 'Actualmente habilitado';

  @override
  String get currentlyDisable => 'Actualmente deshabilitado';

  @override
  String get checkManaged => 'Cheque Gestionado';

  @override
  String get disableKioskMode => 'Deshabilitar Modo Kiosco';

  @override
  String get enableKioskMode => 'Habilitar Modo Kiosco';

  @override
  String get checkingKioskStatus => 'Comprobando estado del kiosco...';

  @override
  String get kioskModeEnabled => 'El modo kiosco está habilitado';

  @override
  String get kioskModeDisabled => 'El modo kiosco está deshabilitado';

  @override
  String get tapForDetail => 'Tocar para más detalles';

  @override
  String get servicesWillAppearHereOnceTheyAreConfigured =>
      'Los servicios aparecerán aquí una vez que estén configurados';

  @override
  String get addNewCustomer => 'Agregar Nuevo Cliente';

  @override
  String get createNewCustomerProfile => 'Crear un nuevo perfil de cliente';

  @override
  String get customerType => 'Tipo de Cliente';

  @override
  String get basicInformation => 'Información Básica';

  @override
  String get firstName => 'Nombre';

  @override
  String get enterFirstName => 'Ingrese el nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get enterLastName => 'Ingrese el apellido';

  @override
  String get phoneNumber => 'Número de Teléfono';

  @override
  String get enterPhoneNumber => 'Ingrese el número de teléfono';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get enterEmail => 'Ingrese el correo electrónico';

  @override
  String get gender => 'Género';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get other => 'Otro';

  @override
  String get preferNotToSay => 'Prefiero no decir';

  @override
  String get dateOfBirth => 'Fecha de Nacimiento';

  @override
  String get selectDateOfBirth => 'Seleccione la fecha de nacimiento';

  @override
  String get notes => 'Notas';

  @override
  String get enterNotes => 'Ingrese notas adicionales';

  @override
  String get consentRequired => 'Consentimiento Requerido';

  @override
  String get customerConsentMessage =>
      'Al crear esta cuenta, el cliente acepta los términos y la política de privacidad de Ashtra.';

  @override
  String get agreeToTerms => 'Acepto los';

  @override
  String get agreeToPrivacy => 'Acepto la';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get createCustomer => 'Crear Cliente';

  @override
  String get regular => 'Regular';

  @override
  String get walkIn => 'Sin Cita';

  @override
  String get vip => 'VIP';

  @override
  String get paymentMethods => 'Métodos de Pago';

  @override
  String get addPaymentMethod => 'Agregar Método de Pago';

  @override
  String get savedPaymentMethods => 'Métodos de Pago Guardados';

  @override
  String get noPaymentMethods => 'No hay métodos de pago guardados';

  @override
  String get defaultPaymentMethod => 'Predeterminado';

  @override
  String get setAsDefault => 'Establecer como Predeterminado';

  @override
  String get deletePaymentMethod => 'Eliminar Método de Pago';

  @override
  String get confirmDeletePaymentMethod =>
      '¿Está seguro de que desea eliminar este método de pago?';

  @override
  String get paymentMethodDeleted => 'Método de pago eliminado exitosamente';

  @override
  String get paymentMethodSetAsDefault =>
      'Método de pago establecido como predeterminado';

  @override
  String get failedToDeletePaymentMethod =>
      'Error al eliminar el método de pago';

  @override
  String get failedToSetDefaultPaymentMethod =>
      'Error al establecer el método de pago predeterminado';

  @override
  String get cardEndingIn => 'Tarjeta terminada en';

  @override
  String get expiresOn => 'Expira';

  @override
  String get expired => 'Expirado';

  @override
  String get presentCard => 'Presente la Tarjeta';

  @override
  String get insertTapOrSwipeCard =>
      'Inserte, toque o deslice la tarjeta para guardar';

  @override
  String get savingPaymentMethod => 'Guardando método de pago...';

  @override
  String get paymentMethodSaved => 'Método de pago guardado exitosamente';

  @override
  String get failedToSavePaymentMethod => 'Error al guardar el método de pago';

  @override
  String get customerCreatedSuccessfully => 'Cliente creado exitosamente';

  @override
  String get failedToCreateCustomer => 'Error al crear el cliente';

  @override
  String get customerAlreadyExists =>
      'Ya existe un cliente con este número de teléfono';

  @override
  String get invalidPhoneNumber =>
      'Por favor ingrese un número de teléfono válido';

  @override
  String get invalidEmail => 'Por favor ingrese un correo electrónico válido';

  @override
  String get nameMinLength => 'El nombre debe tener al menos 2 caracteres';

  @override
  String get pleaseAgreeToTerms => 'Por favor acepte los Términos de Servicio';

  @override
  String get pleaseAgreeToPrivacy =>
      'Por favor acepte la Política de Privacidad';

  @override
  String get addPaymentMethodQuestion =>
      '¿Desea agregar un método de pago para este cliente?';

  @override
  String get addPaymentMethodNow => 'Agregar Método de Pago';

  @override
  String get skipForNow => 'Omitir';

  @override
  String get collectingCardDetails => 'Recopilando detalles de la tarjeta...';

  @override
  String get presentCardToReader =>
      'Por favor presente la tarjeta del cliente al lector';

  @override
  String get cardCollectedSuccessfully =>
      'Tarjeta recopilada y guardada exitosamente';

  @override
  String get failedToCollectCard =>
      'Error al recopilar los detalles de la tarjeta';

  @override
  String get cardCollectionRequest => 'Solicitud de Recolección de Tarjeta';

  @override
  String get collectCardFor => 'Recolectar tarjeta para';

  @override
  String get customerRequestedCardCollection =>
      'Una empresa ha solicitado recopilar los detalles de la tarjeta para este cliente.';

  @override
  String get collectCard => 'Recolectar Tarjeta';

  @override
  String get cancelCollection => 'Cancelar';

  @override
  String get collectingCard => 'Recolectando Tarjeta';

  @override
  String get pleaseInsertTapOrSwipeCard =>
      'Por favor inserte, toque o deslice la tarjeta del cliente';

  @override
  String get cardCollectionSuccess => 'Tarjeta recolectada exitosamente';

  @override
  String get cardCollectionFailed => 'Error al recolectar la tarjeta';

  @override
  String get cardCollectionCancelled => 'Recolección de tarjeta cancelada';

  @override
  String get noCardCollectionRequest =>
      'Sin solicitud de recolección de tarjeta';

  @override
  String get waitingForCardCollectionRequest =>
      'Esperando solicitud de recolección de tarjeta de la empresa...';

  @override
  String get cardCollectionDescription =>
      'Tarjeta a guardar para pagos futuros';

  @override
  String get setAsDefaultCard => 'Establecer como tarjeta predeterminada';

  @override
  String get cardNickname => 'Nombre de la tarjeta';

  @override
  String get processingCardCollection => 'Procesando recolección de tarjeta...';

  @override
  String get submittingCardDetails => 'Enviando detalles de la tarjeta...';

  @override
  String get cardCollectionComplete => 'Recolección de tarjeta completa';

  @override
  String get returnToDashboard => 'Volver al Panel';

  @override
  String get tryAgain => 'Intentar de Nuevo';

  @override
  String get cardDetailsCollected => 'Detalles de tarjeta recopilados';

  @override
  String get cardBrand => 'Marca de la tarjeta';

  @override
  String get lastFourDigits => 'Últimos 4 dígitos';

  @override
  String get expirationDate => 'Fecha de vencimiento';
}
