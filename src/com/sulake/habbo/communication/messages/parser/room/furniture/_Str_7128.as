package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7128 implements IMessageParser 
    {
        private var _itemId:int;
        private var _location:String;


        public function get itemId():int
        {
            return this._itemId;
        }

        public function get location():String
        {
            return this._location;
        }

        public function flush():Boolean
        {
            this._itemId = -1;
            this._location = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._itemId = k.readInteger();
            this._location = k.readString();
            return true;
        }
    }
}
