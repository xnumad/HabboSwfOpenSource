//com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerSavePresetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RoomDimmerSavePresetMessageComposer implements IMessageComposer {

        private var _presetNumber:int;
        private var _effectTypeId:int;
        private var _colorRgbHex:String;
        private var _colorBrightness:int;
        private var _setAsSelectedPreset:Boolean;

        public function RoomDimmerSavePresetMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

