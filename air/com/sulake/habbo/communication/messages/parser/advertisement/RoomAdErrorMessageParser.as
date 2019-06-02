//com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser

package com.sulake.habbo.communication.messages.parser.advertisement{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomAdErrorMessageParser implements IMessageParser {

        private var _errorCode:int;
        private var _filteredText:String;

        public function RoomAdErrorMessageParser();

        public function get errorCode():int;

        public function get filteredText():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.advertisement

