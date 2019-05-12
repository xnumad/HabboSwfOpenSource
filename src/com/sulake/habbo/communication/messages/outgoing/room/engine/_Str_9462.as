package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;

    public class _Str_9462 implements IMessageComposer 
    {
        private var _Str_2319:int;
        private var _Str_3014:int;

        public function _Str_9462(k:int, _arg_2:int)
        {
            this._Str_2319 = k;
            this._Str_3014 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:int;
            switch (this._Str_3014)
            {
                case RoomObjectCategoryEnum.CONST_10:
                    k = 2;
                    break;
                case RoomObjectCategoryEnum.CONST_20:
                    k = 1;
                    break;
                default:
                    return [];
            }
            return [k, this._Str_2319];
        }
    }
}
