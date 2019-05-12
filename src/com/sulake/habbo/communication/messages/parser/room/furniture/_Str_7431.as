package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7431 implements IMessageParser 
    {
        private var _id:int;
        private var _status:int;


        public function get id():int
        {
            return this._id;
        }

        public function get status():int
        {
            return this._status;
        }

        public function flush():Boolean
        {
            this._id = -1;
            this._status = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._id = k.readInteger();
            this._status = k.readInteger();
            return true;
        }
    }
}
