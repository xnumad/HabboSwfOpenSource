package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3292;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.data.StuffDataFactory;
    import com.sulake.habbo.room.IStuffData;

    public class _Str_4638 
    {


        public static function _Str_16439(k:IMessageDataWrapper):_Str_3292
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:int = k.readInteger();
            var _local_3:_Str_3292 = new _Str_3292(_local_2);
            var _local_4:int = k.readInteger();
            _local_3.type = _local_4;
            _local_3.x = k.readInteger();
            _local_3.y = k.readInteger();
            _local_3.dir = ((k.readInteger() % 8) * 45);
            _local_3.z = Number(k.readString());
            _local_3.sizeZ = Number(k.readString());
            _local_3._Str_2794 = k.readInteger();
            _local_3.data = _Str_6271(k);
            var _local_5:Number = parseFloat(_local_3.data.getLegacyString());
            if (!isNaN(_local_5))
            {
                _local_3.state = int(_local_3.data.getLegacyString());
            }
            _local_3.expiryTime = k.readInteger();
            _local_3.usagePolicy = k.readInteger();
            _local_3.ownerId = k.readInteger();
            if (_local_4 < 0)
            {
                _local_3._Str_13150 = k.readString();
            }
            return _local_3;
        }

        public static function _Str_6271(k:IMessageDataWrapper):IStuffData
        {
            var _local_2:int = k.readInteger();
            var _local_3:IStuffData = StuffDataFactory._Str_6438(_local_2);
            _local_3.initializeFromIncomingMessage(k);
            return _local_3;
        }
    }
}
