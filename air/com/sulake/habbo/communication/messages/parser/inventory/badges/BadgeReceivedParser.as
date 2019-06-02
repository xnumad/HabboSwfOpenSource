//com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeReceivedParser

package com.sulake.habbo.communication.messages.parser.inventory.badges{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BadgeReceivedParser implements IMessageParser {

        private var _badgeId:int;
        private var _badgeCode:String;

        public function BadgeReceivedParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get badgeId():int;

        public function get badgeCode():String;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.badges

