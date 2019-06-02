//com.sulake.habbo.communication.messages.parser.catalog.CatalogPageWithEarliestExpiryMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CatalogPageWithEarliestExpiryMessageParser implements IMessageParser {

        private var _pageName:String;
        private var _secondsToExpiry:int;
        private var _image:String;

        public function CatalogPageWithEarliestExpiryMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get pageName():String;

        public function get secondsToExpiry():int;

        public function get image():String;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

