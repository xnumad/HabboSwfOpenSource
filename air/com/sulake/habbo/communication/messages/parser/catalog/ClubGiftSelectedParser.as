//com.sulake.habbo.communication.messages.parser.catalog.ClubGiftSelectedParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ClubGiftSelectedParser implements IMessageParser {

        private var _productCode:String;
        private var _products:Array;

        public function ClubGiftSelectedParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get productCode():String;

        public function get products():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

