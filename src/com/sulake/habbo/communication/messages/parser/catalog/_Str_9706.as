package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9706 implements IMessageParser 
    {
        private var _available:Boolean;
        private var _Str_16515:String;
        private var _Str_22121:String;
        private var _Str_21897:int;


        public function flush():Boolean
        {
            this._available = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16515 = k.readString();
            if (this._Str_16515 != "")
            {
                this._available = true;
            }
            this._Str_22121 = k.readString();
            this._Str_21897 = k.readInteger();
            return true;
        }

        public function get available():Boolean
        {
            return this._available;
        }

        public function get _Str_26301():String
        {
            return this._Str_16515;
        }

        public function get _Str_26118():String
        {
            return this._Str_22121;
        }

        public function get _Str_26380():int
        {
            return this._Str_21897;
        }
    }
}
