//com.sulake.habbo.communication.messages.parser.catalog.SellablePetPalettesParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SellablePetPalettesParser implements IMessageParser {

        private var _productCode:String;
        private var _sellablePalettes:Array;

        public function SellablePetPalettesParser();

        public function get productCode():String;

        public function get sellablePalettes():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

