//com.sulake.habbo.communication.messages.parser.room.furniture.RoomDimmerPresetsMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.RoomDimmerPresetsMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomDimmerPresetsMessageParser implements IMessageParser {

        private var _selectedPresetId:int;
        private var _presets:Array;

        public function RoomDimmerPresetsMessageParser();

        public function get presetCount():int;

        public function get selectedPresetId():int;

        public function getPreset(k:int):RoomDimmerPresetsMessageData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

