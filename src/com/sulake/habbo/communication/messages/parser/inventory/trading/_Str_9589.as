package com.sulake.habbo.communication.messages.parser.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9589 implements IMessageParser 
    {
        private var _Str_8107:int;
        private var _Str_16372:Boolean;
        private var _Str_17246:int;
        private var _Str_8945:Boolean;


        public function get _Str_4963():int
        {
            return this._Str_8107;
        }

        public function get _Str_16764():Boolean
        {
            return this._Str_16372;
        }

        public function get _Str_17613():int
        {
            return this._Str_17246;
        }

        public function get _Str_13374():Boolean
        {
            return this._Str_8945;
        }

        public function flush():Boolean
        {
            this._Str_8107 = -1;
            this._Str_16372 = false;
            this._Str_17246 = -1;
            this._Str_8945 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8107 = k.readInteger();
            this._Str_16372 = (k.readInteger() == 1);
            this._Str_17246 = k.readInteger();
            this._Str_8945 = (k.readInteger() == 1);
            return true;
        }
    }
}
