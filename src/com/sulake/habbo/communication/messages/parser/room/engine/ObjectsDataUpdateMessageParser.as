package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_6765;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ObjectsDataUpdateMessageParser implements IMessageParser 
    {
        private var _objects:Array;

        public function ObjectsDataUpdateMessageParser()
        {
            this._objects = [];
            super();
        }

        public function get objectCount():int
        {
            return this._objects.length;
        }

        public function _Str_24113(k:int):_Str_6765
        {
            if (((k < 0) || (k >= this.objectCount)))
            {
                return null;
            }
            return this._objects[k];
        }

        public function flush():Boolean
        {
            this._objects = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:IStuffData;
            var _local_6:int;
            var _local_7:Number;
            if (k == null)
            {
                return false;
            }
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = _Str_4638._Str_6271(k);
                _local_6 = 0;
                _local_7 = parseFloat(_local_5.getLegacyString());
                if (!isNaN(_local_7))
                {
                    _local_6 = int(_local_5.getLegacyString());
                }
                this._objects.push(new _Str_6765(_local_4, _local_6, _local_5));
                _local_3++;
            }
            return true;
        }
    }
}
