//com.sulake.habbo.communication.messages.parser.friendlist.InstantMessageErrorMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class InstantMessageErrorMessageParser implements IMessageParser {

        private var _errorCode:int;
        private var _userId:int;
        private var _message:String;

        public function InstantMessageErrorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get errorCode():int;

        public function get userId():int;

        public function get message():String;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

