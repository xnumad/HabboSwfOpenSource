//com.sulake.habbo.messenger.ConversationMessage

package com.sulake.habbo.messenger{
    public class ConversationMessage {

        public static const TYPE_ME:int;
        public static const TYPE_PEER:int;
        public static const TYPE_NOTIFICATION:int;
        public static const TYPE_INFO:int;

        private var _type:int;
        private var _senderId:int;
        private var _message:String;
        private var _secondsSinceSent:int;
        private var _clientReceiveTime:int;
        private var _isTimeStampMessage:Boolean;

        public function ConversationMessage(k:int, _arg_2:int, _arg_3:String, _arg_4:int);

        public function get label():String;

        public function get type():int;

        public function get senderId():int;

        public function get message():String;

        public function get secondsSinceSent():int;

        public function set isTimeStampMessage(k:Boolean):void;

        public function prefixMessageWith(k:String):void;


    }
}//package com.sulake.habbo.messenger

