package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
    {
        private var _presetNumber:int;
        private var _effectTypeId:int;
        private var _colorRgbHex:String;
        private var _Str_20971:int;
        private var _Str_22039:Boolean;

        public function RoomDimmerSavePresetMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean)
        {
            this._presetNumber = k;
            this._effectTypeId = _arg_2;
            this._colorRgbHex = _arg_3;
            this._Str_20971 = _arg_4;
            this._Str_22039 = _arg_5;
        }

        public function getMessageArray():Array
        {
            return [this._presetNumber, this._effectTypeId, this._colorRgbHex, this._Str_20971, this._Str_22039];
        }

        public function dispose():void
        {
        }
    }
}
