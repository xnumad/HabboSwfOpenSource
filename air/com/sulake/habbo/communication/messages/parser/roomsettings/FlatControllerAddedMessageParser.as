//com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerAddedMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatControllerAddedMessageParser implements IMessageParser {

        private var _flatId:int;
        private var _data:FlatControllerData;

        public function FlatControllerAddedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;

        public function get data():FlatControllerData;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

