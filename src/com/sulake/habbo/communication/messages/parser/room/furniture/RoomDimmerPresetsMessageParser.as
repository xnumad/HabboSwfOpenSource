package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_5478;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomDimmerPresetsMessageParser implements IMessageParser 
    {
        private var _selectedPresetId:int = 0;
        private var _presets:Array;

        public function RoomDimmerPresetsMessageParser()
        {
            this._presets = [];
            super();
        }

        public function get _Str_10888():int
        {
            return this._presets.length;
        }

        public function get _Str_6226():int
        {
            return this._selectedPresetId;
        }

        public function getPreset(k:int):_Str_5478
        {
            if (((k < 0) || (k >= this._Str_10888)))
            {
                return null;
            }
            return this._presets[k];
        }

        public function flush():Boolean
        {
            this._presets = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:int;
            var _local_8:int;
            var _local_9:_Str_5478;
            var _local_2:int = k.readInteger();
            this._selectedPresetId = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = k.readString();
                _local_7 = parseInt(_local_6.substr(1), 16);
                _local_8 = k.readInteger();
                _local_9 = new _Str_5478(_local_4);
                _local_9.type = _local_5;
                _local_9.color = _local_7;
                _local_9._Str_4272 = _local_8;
                _local_9._Str_4710();
                this._presets.push(_local_9);
                _local_3++;
            }
            return true;
        }
    }
}
