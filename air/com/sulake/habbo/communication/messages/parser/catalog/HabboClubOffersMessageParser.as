//com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HabboClubOffersMessageParser implements IMessageParser {

        private var _offers:Array;
        private var _source:int;

        public function HabboClubOffersMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get offers():Array;

        public function get source():int;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

