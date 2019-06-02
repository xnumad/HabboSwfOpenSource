//com.sulake.habbo.communication.messages.parser.catalog.LimitedEditionSoldOutParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class LimitedEditionSoldOutParser implements IMessageParser {

        public function LimitedEditionSoldOutParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

