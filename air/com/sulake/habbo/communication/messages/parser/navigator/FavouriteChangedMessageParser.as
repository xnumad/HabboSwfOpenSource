//com.sulake.habbo.communication.messages.parser.navigator.FavouriteChangedMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FavouriteChangedMessageParser implements IMessageParser {

        private var _flatId:int;
        private var _added:Boolean;

        public function FavouriteChangedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;

        public function get added():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

