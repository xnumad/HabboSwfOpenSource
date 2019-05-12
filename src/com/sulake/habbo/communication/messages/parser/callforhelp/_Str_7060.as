package com.sulake.habbo.communication.messages.parser.callforhelp
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_6380;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7060 implements IMessageParser 
    {
        private var _Str_6036:int = -1;
        private var _accountId:int = -1;
        private var _Str_18848:_Str_6380;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6036 = k.readInteger();
            this._accountId = k.readInteger();
            this._Str_18848 = new _Str_6380(k);
            return true;
        }

        public function get _Str_2869():int
        {
            return this._Str_6036;
        }

        public function get accountId():int
        {
            return this._accountId;
        }

        public function get _Str_21198():_Str_6380
        {
            return this._Str_18848;
        }

        public function flush():Boolean
        {
            this._Str_6036 = -1;
            this._accountId = -1;
            this._Str_18848 = null;
            return true;
        }
    }
}
