//com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser

package com.sulake.habbo.communication.messages.parser.recycler{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RecyclerPrizesMessageParser implements IMessageParser {

        private var _prizeLevels:Array;

        public function RecyclerPrizesMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get prizeLevels():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.recycler

