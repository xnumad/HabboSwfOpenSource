package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5317 implements IMessageParser 
    {
        private var _id:int;
        private var _isExpired:Boolean;
        private var _pickerId:int;
        private var _delay:int;


        public function get id():int
        {
            return this._id;
        }

        public function get isExpired():Boolean
        {
            return this._isExpired;
        }

        public function get pickerId():int
        {
            return this._pickerId;
        }

        public function get delay():int
        {
            return this._delay;
        }

        public function flush():Boolean
        {
            this._id = 0;
            this._delay = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._id = int(k.readString());
            this._isExpired = k.readBoolean();
            this._pickerId = k.readInteger();
            this._delay = k.readInteger();
            return true;
        }
    }
}
