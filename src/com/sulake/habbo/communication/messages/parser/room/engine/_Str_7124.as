package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7124 implements IMessageParser 
    {
        private var _itemId:int = 0;
        private var _pickerId:int = -1;


        public function get itemId():int
        {
            return this._itemId;
        }

        public function get pickerId():int
        {
            return this._pickerId;
        }

        public function flush():Boolean
        {
            this._itemId = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._itemId = int(k.readString());
            this._pickerId = k.readInteger();
            return true;
        }
    }
}
