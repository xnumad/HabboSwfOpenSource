package com.sulake.habbo.communication.messages.parser.inventory.bots
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9476 implements IMessageParser 
    {
        private var _Str_10056:Boolean;
        private var _item:_Str_3013;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_10056 = k.readBoolean();
            this._item = new _Str_3013(k);
            return true;
        }

        public function get _Str_20732():Boolean
        {
            return this._Str_10056;
        }

        public function get item():_Str_3013
        {
            return this._item;
        }
    }
}
