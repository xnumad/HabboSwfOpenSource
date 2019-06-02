//com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CantConnectMessageParser implements IMessageParser {

        public static const REASON_FULL:int;
        public static const REASON_CLOSED:int;
        public static const REASON_QUEUE_ERROR:int;
        public static const REASON_BANNED:int;

        private var _reason:int;
        private var _parameter:String;

        public function CantConnectMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;

        public function get parameter():String;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

