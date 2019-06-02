//com.sulake.habbo.communication.messages.parser.catalog.RoomAdPurchaseInfoEventParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomAdPurchaseInfoEventParser implements IMessageParser {

        private var _isVip:Boolean;
        private var _rooms:Array;

        public function RoomAdPurchaseInfoEventParser();

        public function flush():Boolean;

        public function get rooms():Array;

        public function get isVip():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

