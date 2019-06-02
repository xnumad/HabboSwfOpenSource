package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7559 implements IMessageParser 
    {
        private var _furniId:int;
        private var _Str_9152:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._furniId = k.readInteger();
            this._Str_9152 = k.readInteger();
            return true;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get commandId():int
        {
            return this._Str_9152;
        }
    }
}
