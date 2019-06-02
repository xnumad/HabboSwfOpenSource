//com.sulake.habbo.communication.messages.parser.landingview.PromoArticlesMessageParser

package com.sulake.habbo.communication.messages.parser.landingview{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PromoArticlesMessageParser implements IMessageParser {

        private var _articles:Array;

        public function PromoArticlesMessageParser();

        public function get articles():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.landingview

