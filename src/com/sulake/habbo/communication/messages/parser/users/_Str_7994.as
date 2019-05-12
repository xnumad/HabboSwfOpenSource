package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_2848;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7994 implements IMessageParser 
    {
        public static const _Str_16214:int = 16;

        private var _respect:int;
        private var _Str_19471:int;
        private var _Str_2522:_Str_2848;


        public function flush():Boolean
        {
            this._Str_2522 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._respect = k.readInteger();
            this._Str_19471 = k.readInteger();
            this._Str_2522 = new _Str_2848(k);
            return true;
        }

        public function get _Str_26179():int
        {
            return this._Str_19471;
        }

        public function get respect():int
        {
            return this._respect;
        }

        public function get _Str_6175():_Str_2848
        {
            return this._Str_2522;
        }

        public function _Str_24197():Boolean
        {
            return this._Str_2522.typeId == _Str_16214;
        }
    }
}
