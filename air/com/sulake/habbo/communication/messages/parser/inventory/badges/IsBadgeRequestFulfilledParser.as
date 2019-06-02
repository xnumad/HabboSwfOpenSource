//com.sulake.habbo.communication.messages.parser.inventory.badges.IsBadgeRequestFulfilledParser

package com.sulake.habbo.communication.messages.parser.inventory.badges{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IsBadgeRequestFulfilledParser implements IMessageParser {

        private var _requestCode:String;
        private var _fulfilled:Boolean;

        public function IsBadgeRequestFulfilledParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get requestCode():String;

        public function get fulfilled():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.badges

