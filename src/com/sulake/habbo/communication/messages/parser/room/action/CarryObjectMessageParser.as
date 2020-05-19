package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CarryObjectMessageParser implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _itemType:int;


        public function get userId():int
        {
            return this._userId;
        }

        public function get itemType():int
        {
            return this._itemType;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._itemType = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._itemType = k.readInteger();
            return true;
        }
    }
}
