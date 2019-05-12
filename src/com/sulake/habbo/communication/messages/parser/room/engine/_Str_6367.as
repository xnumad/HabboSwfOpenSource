package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6367 implements IMessageParser 
    {
        private var _id:int = 0;


        public function get id():int
        {
            return this._id;
        }

        public function flush():Boolean
        {
            this._id = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._id = int(k.readString());
            return true;
        }
    }
}
