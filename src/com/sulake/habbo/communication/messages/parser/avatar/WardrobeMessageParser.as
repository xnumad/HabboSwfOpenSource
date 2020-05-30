package com.sulake.habbo.communication.messages.parser.avatar
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.avatar.OutfitData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class WardrobeMessageParser implements IMessageParser
    {
        private var _state:int;
        private var _outfits:Array;


        public function flush():Boolean
        {
            this._state = 0;
            this._outfits = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:OutfitData;
            this._state = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new OutfitData(k);
                this._outfits.push(_local_4);
                _local_3++;
            }
            return true;
        }

        public function get outfits():Array
        {
            return this._outfits;
        }

        public function get state():int
        {
            return this._state;
        }
    }
}
