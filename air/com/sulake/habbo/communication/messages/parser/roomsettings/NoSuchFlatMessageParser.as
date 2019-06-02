//com.sulake.habbo.communication.messages.parser.roomsettings.NoSuchFlatMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NoSuchFlatMessageParser implements IMessageParser {

        private var _flatId:int;

        public function NoSuchFlatMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

