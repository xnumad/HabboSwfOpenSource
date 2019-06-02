//com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser

package com.sulake.habbo.communication.messages.parser.avatar{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChangeUserNameResultMessageParser implements IMessageParser {

        private var _resultCode:int;
        private var _name:String;
        private var _nameSuggestions:Array;

        public function ChangeUserNameResultMessageParser();

        public function get resultCode():int;

        public function get name():String;

        public function get nameSuggestions():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.avatar

