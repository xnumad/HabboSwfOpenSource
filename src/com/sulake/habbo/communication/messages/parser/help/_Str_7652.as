package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7652 implements IMessageParser 
    {
        private var _onDuty:Boolean;
        private var _Str_21395:int;
        private var _Str_20463:int;
        private var _Str_20900:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._onDuty = k.readBoolean();
            this._Str_21395 = k.readInteger();
            this._Str_20463 = k.readInteger();
            this._Str_20900 = k.readInteger();
            return true;
        }

        public function get onDuty():Boolean
        {
            return this._onDuty;
        }

        public function get _Str_25148():int
        {
            return this._Str_20463;
        }

        public function get _Str_24092():int
        {
            return this._Str_20900;
        }

        public function get _Str_24740():int
        {
            return this._Str_21395;
        }
    }
}
