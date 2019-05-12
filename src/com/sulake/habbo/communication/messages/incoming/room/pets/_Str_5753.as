package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5753 
    {
        private var _Str_16211:int;
        private var _breeds:Array;

        public function _Str_5753(k:IMessageDataWrapper)
        {
            this._Str_16211 = k.readInteger();
            this._breeds = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._breeds.push(k.readInteger());
                _local_3++;
            }
        }

        public function dispose():void
        {
            this._Str_16211 = -1;
            this._breeds = [];
        }

        public function get _Str_12554():int
        {
            return this._Str_16211;
        }

        public function get breeds():Array
        {
            return this._breeds;
        }
    }
}
