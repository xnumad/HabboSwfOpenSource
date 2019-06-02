//com.sulake.habbo.communication.messages.parser.navigator.UserFlatCatsMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserFlatCatsMessageParser implements IMessageParser {

        private var _nodes:Array;

        public function UserFlatCatsMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get nodes():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

