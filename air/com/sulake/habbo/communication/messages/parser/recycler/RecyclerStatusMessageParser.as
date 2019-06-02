//com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser

package com.sulake.habbo.communication.messages.parser.recycler{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RecyclerStatusMessageParser implements IMessageParser {

        private var _recyclerStatus:int;
        private var _recyclerTimeoutSeconds:int;

        public function RecyclerStatusMessageParser();

        public function get recyclerStatus():int;

        public function get recyclerTimeoutSeconds():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.recycler

