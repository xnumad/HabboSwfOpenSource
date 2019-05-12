package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data.LegacyStuffData;

    public class _Str_6765 
    {
        private var _id:int = 0;
        private var _state:int = 0;
        private var _data:IStuffData;

        public function _Str_6765(k:int, _arg_2:int, _arg_3:IStuffData)
        {
            this._data = new LegacyStuffData();
            super();
            this._id = k;
            this._state = _arg_2;
            this._data = _arg_3;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get data():IStuffData
        {
            return this._data;
        }
    }
}
