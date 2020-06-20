package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;

    public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent 
    {
        public static const LOGOUT:int = 0;
        public static const JUST_BANNED:int = 1;
        public static const CONCURRENT_LOGIN:int = 2;
        public static const CONNECTION_LOST_TO_PEER:int = 3;
        public static const AVATAR_IDENTITY_CHANGE:int = 4;
        public static const REMOVE_FURNITURE_TOOL:int = 5;
        public static const STILL_BANNED:int = 10;
        public static const DUAL_LOGIN_BY_USERID:int = 11;
        public static const HOTEL_CLOSED:int = 12;
        public static const DUAL_LOGIN_BY_IP:int = 13;
        public static const PEER_CONNECTION_MISSING:int = 16;
        public static const NO_LOGIN_PERMISSION:int = 17;
        public static const DUPLICATE_CONNECTION:int = 18;
        public static const HOTEL_CLOSING:int = 19;
        public static const INCORRECT_PASSWORD:int = 20;
        public static const INVALID_LOGIN_TICKET:int = 22;
        public static const VERSION_CHECK_URL:int = 23;
        public static const VERSION_CHECK_PROPERTY:int = 24;
        public static const VERSION_CHECK_MACHINE_ID:int = 25;
        public static const NO_MESSENGER_SESSION:int = 26;
        public static const USER_NOT_FOUND:int = 27;
        public static const CRYPTO_NOT_INITIALIZED:int = 28;
        public static const DEV_CRYPTO_NOT_ALLOWED:int = 29;
        public static const DUPLICATE_UUID_DETECTED:int = 100;
        public static const OLD_SESSION_IN_PROXY:int = 101;
        public static const PUBLIC_KEY_NOT_NUMERIC:int = 102;
        public static const PUBLIC_KEY_TOO_SHORT:int = 103;
        public static const SOCKET_READ_GENERIC:int = 104;
        public static const SOCKET_READ_FIRST_BYTE:int = 105;
        public static const SOCKET_READ_LENGTH:int = 106;
        public static const SOCKET_READ_BODY:int = 107;
        public static const SOCKET_READ_POLICY:int = 108;
        public static const SOCKET_IO_EXCEPTION:int = 109;
        public static const SOCKET_WRONG_CRYPTO:int = 110;
        public static const PROXY_RUNTIME_EXCEPTION:int = 111;
        public static const IDLE_CONNECTION:int = 112;
        public static const PONG_TIMEOUT:int = 113;
        public static const IDLE_CONNECTION_NOT_AUTH:int = 114;
        public static const IDLE_CONNECTION_NO_USER_ID:int = 115;
        public static const WRITE_CLOSED_CHANNEL:int = 116;
        public static const SOCKET_WRITE_EXCEPTION_1:int = 117;
        public static const SOCKET_WRITE_EXCEPTION_2:int = 118;
        public static const SOCKET_WRITE_EXCEPTION_3:int = 119;

        public function DisconnectReasonEvent(k:Function)
        {
            super(k, DisconnectReasonParser);
        }

        public function get reason():int
        {
            return (this._parser as DisconnectReasonParser).reason;
        }

        public function get reasonString():String
        {
            switch (this.reason)
            {
                case JUST_BANNED:
                case STILL_BANNED:
                    return "banned";
                case CONCURRENT_LOGIN:
                    return "concurrentlogin";
                case INCORRECT_PASSWORD:
                    return "incorrectpassword";
                default:
                    return "logout";
            }
        }
    }
}
