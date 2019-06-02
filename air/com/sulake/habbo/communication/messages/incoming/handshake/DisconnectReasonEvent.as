//com.sulake.habbo.communication.messages.incoming.handshake.DisconnectReasonEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;

    [SecureSWF(rename="true")]
    public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent {

        public static const UNKNOWN_REASON:int;
        public static const MAINTENANCE_BREAK:int;
        public static const LOGOUT:int;
        public static const JUST_BANNED:int;
        public static const CONCURRENT_LOGIN:int;
        public static const CONNECTION_LOST_TO_PEER:int;
        public static const AVATAR_IDENTITY_CHANGE:int;
        public static const REMOVE_FURNITURE_TOOL:int;
        public static const STILL_BANNED:int;
        public static const DUAL_LOGIN_BY_USERID:int;
        public static const HOTEL_CLOSED:int;
        public static const DUAL_LOGIN_BY_IP:int;
        public static const PEER_CONNECTION_MISSING:int;
        public static const NO_LOGIN_PERMISSION:int;
        public static const DUPLICATE_CONNECTION:int;
        public static const HOTEL_CLOSING:int;
        public static const INCORRECT_PASSWORD:int;
        public static const INVALID_LOGIN_TICKET:int;
        public static const VERSION_CHECK_URL:int;
        public static const VERSION_CHECK_PROPERTY:int;
        public static const VERSION_CHECK_MACHINE_ID:int;
        public static const NO_MESSENGER_SESSION:int;
        public static const USER_NOT_FOUND:int;
        public static const CRYPTO_NOT_INITIALIZED:int;
        public static const DEV_CRYPTO_NOT_ALLOWED:int;
        public static const DUPLICATE_UUID_DETECTED:int;
        public static const OLD_SESSION_IN_PROXY:int;
        public static const PUBLIC_KEY_NOT_NUMERIC:int;
        public static const PUBLIC_KEY_TOO_SHORT:int;
        public static const SOCKET_READ_GENERIC:int;
        public static const SOCKET_READ_FIRST_BYTE:int;
        public static const SOCKET_READ_LENGTH:int;
        public static const SOCKET_READ_BODY:int;
        public static const SOCKET_READ_POLICY:int;
        public static const SOCKET_IO_EXCEPTION:int;
        public static const SOCKET_WRONG_CRYPTO:int;
        public static const PROXY_RUNTIME_EXCEPTION:int;
        public static const IDLE_CONNECTION:int;
        public static const PONG_TIMEOUT:int;
        public static const IDLE_CONNECTION_NOT_AUTH:int;
        public static const IDLE_CONNECTION_NO_USER_ID:int;
        public static const WRITE_CLOSED_CHANNEL:int;
        public static const SOCKET_WRITE_EXCEPTION_1:int;
        public static const SOCKET_WRITE_EXCEPTION_2:int;
        public static const SOCKET_WRITE_EXCEPTION_3:int;
        public static const TOO_MANY_BYTES_PENDING_WRITE:int;
        public static const IDLE_CONNECTION_POLICY_REQUEST:int;
        public static const INCOMPATIBLE_CLIENT_VERSION:int;
        public static const CREDENTIALS_REMOVED:int;
        public static const INSUFFICIENT_SECURITY_LEVEL:int;
        public static const TOO_MANY_UNDEFINED_CLIENT_MESSAGES:int;
        public static const INVALID_PARAMETER_RANGE:int;
        private static var _reasonNames:Dictionary;

        public function DisconnectReasonEvent(k:Function);

        public static function resolveDisconnectedReasonLocalizationKey(k:int):String;


        public function get reason():int;

        public function get reasonString():String;

        public function getReasonName():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

