package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9126 implements IMessageParser 
    {
        private var _Str_3032:String;
        private var _Str_4261:int;
        private var _Str_5859:int;
        private var _Str_7388:int;


        public function flush():Boolean
        {
            this._Str_5859 = -1;
            this._Str_7388 = -1;
            this._Str_3032 = "";
            this._Str_4261 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3032 = k.readString();
            this._Str_4261 = k.readInteger();
            this._Str_5859 = k.readInteger();
            this._Str_7388 = k.readInteger();
            return true;
        }

        public function get _Str_25710():int
        {
            return this._Str_5859;
        }

        public function get _Str_25484():int
        {
            return this._Str_7388;
        }

        public function get productType():String
        {
            return this._Str_3032;
        }

        public function get productClassId():int
        {
            return this._Str_4261;
        }
    }
}
