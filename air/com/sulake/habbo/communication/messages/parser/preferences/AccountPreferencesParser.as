//com.sulake.habbo.communication.messages.parser.preferences.AccountPreferencesParser

package com.sulake.habbo.communication.messages.parser.preferences{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AccountPreferencesParser implements IMessageParser {

        private var _traxVolume:int;
        private var _furniVolume:int;
        private var _uiVolume:int;
        private var _freeFlowChatDisabled:Boolean;

        public function AccountPreferencesParser();

        public function get traxVolume():int;

        public function get furniVolume():int;

        public function get uiVolume():int;

        public function get freeFlowChatDisabled():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.preferences

