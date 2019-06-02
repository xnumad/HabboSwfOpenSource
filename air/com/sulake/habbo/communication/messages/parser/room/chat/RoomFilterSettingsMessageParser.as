//com.sulake.habbo.communication.messages.parser.room.chat.RoomFilterSettingsMessageParser

package com.sulake.habbo.communication.messages.parser.room.chat{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomFilterSettingsMessageParser implements IMessageParser {

        private var _badWords:Array;

        public function RoomFilterSettingsMessageParser();

        public function get badWords():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.chat

