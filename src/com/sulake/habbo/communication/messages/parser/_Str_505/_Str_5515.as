package com.sulake.habbo.communication.messages.parser._Str_505
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5515 implements IMessageParser 
    {
        private var _Str_2933:int;
        private var _Str_2909:int;
        private var _Str_9898:int;
        private var _Str_17293:Boolean;
        private var _Str_9090:Boolean;
        private var _Str_17826:Boolean;
        private var _Str_3790:int;
        private var _Str_6387:int;


        public function get _Str_3410():int
        {
            return this._Str_2933;
        }

        public function get _Str_3488():int
        {
            return this._Str_2909;
        }

        public function get _Str_16610():int
        {
            return this._Str_9898;
        }

        public function get _Str_25556():Boolean
        {
            return this._Str_17293;
        }

        public function get _Str_22473():Boolean
        {
            return this._Str_9090;
        }

        public function get _Str_23253():Boolean
        {
            return this._Str_17826;
        }

        public function get _Str_8444():int
        {
            return this._Str_3790;
        }

        public function get _Str_6984():int
        {
            return this._Str_6387;
        }

        public function flush():Boolean
        {
            this._Str_17293 = false;
            this._Str_17826 = false;
            this._Str_3790 = 0;
            this._Str_6387 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_9898 = k.readInteger();
            this._Str_2909 = k.readInteger();
            this._Str_2933 = k.readInteger();
            this._Str_17293 = k.readBoolean();
            this._Str_9090 = k.readBoolean();
            this._Str_17826 = k.readBoolean();
            this._Str_3790 = k.readInteger();
            this._Str_6387 = k.readInteger();
            return true;
        }
    }
}
