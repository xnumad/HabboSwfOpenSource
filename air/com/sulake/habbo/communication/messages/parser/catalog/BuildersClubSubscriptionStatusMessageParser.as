//com.sulake.habbo.communication.messages.parser.catalog.BuildersClubSubscriptionStatusMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BuildersClubSubscriptionStatusMessageParser implements IMessageParser {

        private var _secondsLeft:int;
        private var _furniLimit:int;
        private var _maxFurniLimit:int;

        public function BuildersClubSubscriptionStatusMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get secondsLeft():int;

        public function get furniLimit():int;

        public function get maxFurniLimit():int;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

