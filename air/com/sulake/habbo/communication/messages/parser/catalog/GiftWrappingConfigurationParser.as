//com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GiftWrappingConfigurationParser implements IMessageParser {

        private var _wrappingEnabled:Boolean;
        private var _wrappingPrice:int;
        private var _stuffTypes:Array;
        private var _boxTypes:Array;
        private var _ribbonTypes:Array;
        private var _defaultStuffTypes:Array;

        public function GiftWrappingConfigurationParser();

        public function get isWrappingEnabled():Boolean;

        public function get wrappingPrice():int;

        public function get stuffTypes():Array;

        public function get boxTypes():Array;

        public function get ribbonTypes():Array;

        public function get defaultStuffTypes():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

