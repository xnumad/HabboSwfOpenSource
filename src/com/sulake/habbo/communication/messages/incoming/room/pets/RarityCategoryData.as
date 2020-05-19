package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RarityCategoryData 
    {
        private var _chance:int;
        private var _breeds:Array;

        public function RarityCategoryData(k:IMessageDataWrapper)
        {
            this._chance = k.readInteger();
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
            this._chance = -1;
            this._breeds = [];
        }

        public function get _Str_12554():int
        {
            return this._chance;
        }

        public function get breeds():Array
        {
            return this._breeds;
        }
    }
}
