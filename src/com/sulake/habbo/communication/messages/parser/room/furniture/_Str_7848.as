package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7848 implements IMessageParser 
    {
        private var _furniId:int;
        private var _height:Number;


        public function flush():Boolean
        {
            this._furniId = -1;
            this._height = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._furniId = k.readInteger();
            var _local_2:int = k.readInteger();
            this._height = (_local_2 / 100);
            return true;
        }

        public function get height():Number
        {
            return this._height;
        }

        public function get furniId():int
        {
            return this._furniId;
        }
    }
}
