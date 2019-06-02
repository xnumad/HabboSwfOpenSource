//com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllersMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatControllersMessageParser implements IMessageParser {

        private var _roomId:int;
        private var _controllers:Array;

        public function FlatControllersMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get roomId():int;

        public function get controllers():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

