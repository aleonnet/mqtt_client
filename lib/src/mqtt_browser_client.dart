/*
 * Package : mqtt_browser_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 21/01/2020
 * Copyright :  S.Hamblett
 */

part of mqtt_browser_client;

class MqttBrowserClient extends MqttClient {
  /// Initializes a new instance of the MqttServerClient class using the
  /// default Mqtt Port.
  /// The server hostname to connect to
  /// The client identifier to use to connect with
  MqttBrowserClient(String server, String clientIdentifier)
      : super(server, clientIdentifier);

  /// Initializes a new instance of the MqttServerClient class using
  /// the supplied Mqtt Port.
  /// The server hostname to connect to
  /// The client identifier to use to connect with
  /// The port to use
  MqttBrowserClient.withPort(String server, String clientIdentifier, int port)
      : super.withPort(server, clientIdentifier, port);

  /// Performs a connect to the message broker with an optional
  /// username and password for the purposes of authentication.
  /// If a username and password are supplied these will override
  /// any previously set in a supplied connection message so if you
  /// supply your own connection message and use the authenticateAs method to
  /// set these parameters do not set them again here.
  @override
  Future<MqttClientConnectionStatus> connect(
      [String username, String password]) async {
    instantiationCorrect = true;
    clientEventBus = events.EventBus();
    connectionHandler = SynchronousMqttBrowserConnectionHandler(clientEventBus);
    return await super.connect(username, password);
  }
}
