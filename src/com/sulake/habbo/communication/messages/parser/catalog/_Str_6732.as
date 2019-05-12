package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6732 implements IMessageParser 
    {
        private var _Str_16456:int;
        private var _Str_12494:int;
        private var _Str_19123:int;
        private var _Str_17298:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16456 = k.readInteger();
            this._Str_12494 = k.readInteger();
            this._Str_19123 = k.readInteger();
            if (k.bytesAvailable)
            {
                this._Str_17298 = k.readInteger();
            }
            else
            {
                this._Str_17298 = this._Str_16456;
            }
            return true;
        }

        public function get _Str_3709():int
        {
            return this._Str_16456;
        }

        public function get _Str_15864():int
        {
            return this._Str_12494;
        }

        public function get _Str_24094():int
        {
            return this._Str_19123;
        }

        public function get _Str_24379():int
        {
            return this._Str_17298;
        }
    }
}
