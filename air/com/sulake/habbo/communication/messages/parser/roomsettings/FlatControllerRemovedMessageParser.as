//com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerRemovedMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatControllerRemovedMessageParser implements IMessageParser {

        private var _flatId:int;
        private var _userId:int;

        public function FlatControllerRemovedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

