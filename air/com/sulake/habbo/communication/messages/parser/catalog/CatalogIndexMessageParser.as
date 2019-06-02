//com.sulake.habbo.communication.messages.parser.catalog.CatalogIndexMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CatalogIndexMessageParser implements IMessageParser {

        private var _root:NodeData;
        private var _newAdditionsAvailable:Boolean;
        private var _catalogType:String;

        public function CatalogIndexMessageParser();

        public function get root():NodeData;

        public function get newAdditionsAvailable():Boolean;

        public function get catalogType():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

