package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7918 implements IMessageParser 
    {
        private var _id:int = 0;
        private var _state:int = 0;
        private var _data:IStuffData;


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

        public function flush():Boolean
        {
            this._state = 0;
            this._data = (new LegacyStuffData() as IStuffData);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:String = k.readString();
            this._id = int(_local_2);
            this._data = _Str_4638._Str_6271(k);
            var _local_3:Number = parseFloat(this._data.getLegacyString());
            if (!isNaN(_local_3))
            {
                this._state = int(this._data.getLegacyString());
            }
            return true;
        }
    }
}
