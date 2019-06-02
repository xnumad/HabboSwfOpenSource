//com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDimmerPresetsEvent extends RoomSessionEvent {

        public static const ROOM_DIMMER_PRESETS:String;

        private var _selectedPresetId:int;
        private var _presets:Array;

        public function RoomSessionDimmerPresetsEvent(k:String, _arg_2:IRoomSession, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get selectedPresetId():int;

        public function get presetCount():int;

        public function set selectedPresetId(k:int):void;

        public function storePreset(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void;

        public function getPreset(k:int):RoomSessionDimmerPresetsEventPresetItem;


    }
}//package com.sulake.habbo.session.events

