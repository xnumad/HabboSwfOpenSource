//com.sulake.habbo.communication.messages.parser.catalog.CatalogPageExpirationParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CatalogPageExpirationParser implements IMessageParser {

        private var _pageName:String;
        private var _pageId:int;
        private var _secondsToExpiry:int;
        private var _image:String;

        public function CatalogPageExpirationParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get pageName():String;

        public function get pageId():int;

        public function get secondsToExpiry():int;

        public function get image():String;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

