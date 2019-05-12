package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_11396;

    public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_21403:int = 0;
        public static const _Str_18158:int = 1;
        public static const _Str_18496:int = 2;
        public static const _Str_20283:int = 3;
        public static const _Str_22132:int = 4;
        public static const _Str_19412:int = 5;
        public static const _Str_18786:int = 10;
        public static const _Str_19302:int = 11;
        public static const _Str_19311:int = 12;
        public static const _Str_19501:int = 13;
        public static const _Str_21595:int = 16;
        public static const _Str_21228:int = 17;
        public static const _Str_19828:int = 18;
        public static const _Str_21797:int = 19;
        public static const _Str_18184:int = 20;
        public static const _Str_20306:int = 22;
        public static const _Str_21693:int = 23;
        public static const _Str_19587:int = 24;
        public static const _Str_21120:int = 25;
        public static const _Str_19547:int = 26;
        public static const _Str_20311:int = 27;
        public static const _Str_19192:int = 28;
        public static const _Str_20909:int = 29;
        public static const _Str_20804:int = 100;
        public static const _Str_20126:int = 101;
        public static const _Str_20187:int = 102;
        public static const _Str_21583:int = 103;
        public static const _Str_20563:int = 104;
        public static const _Str_19887:int = 105;
        public static const _Str_19259:int = 106;
        public static const _Str_20585:int = 107;
        public static const _Str_20274:int = 108;
        public static const _Str_19141:int = 109;
        public static const _Str_21526:int = 110;
        public static const _Str_20218:int = 111;
        public static const _Str_20320:int = 112;
        public static const _Str_21005:int = 113;
        public static const _Str_19796:int = 114;
        public static const _Str_19187:int = 115;
        public static const _Str_22143:int = 116;
        public static const _Str_20684:int = 117;
        public static const _Str_20945:int = 118;
        public static const _Str_21886:int = 119;

        public function DisconnectReasonEvent(k:Function)
        {
            super(k, _Str_11396);
        }

        public function get reason():int
        {
            return (this._parser as _Str_11396).reason;
        }

        public function get reasonString():String
        {
            switch (this.reason)
            {
                case _Str_18158:
                case _Str_18786:
                    return "banned";
                case _Str_18496:
                    return "concurrentlogin";
                case _Str_18184:
                    return "incorrectpassword";
                default:
                    return "logout";
            }
        }
    }
}
