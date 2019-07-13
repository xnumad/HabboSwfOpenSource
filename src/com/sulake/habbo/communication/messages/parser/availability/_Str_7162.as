package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7162 implements IMessageParser 
    {
        private var _isOpen:Boolean;
        private var _Str_18253:Boolean;
        private var _Str_8842:Boolean;


        public function get isOpen():Boolean
        {
            return this._isOpen;
        }

        public function get _Str_22557():Boolean
        {
            return this._Str_18253;
        }

        public function get isRealNoob():Boolean
        {
            return this._Str_8842;
        }

        public function flush():Boolean
        {
            this._isOpen = false;
            this._Str_18253 = false;
            this._Str_8842 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isOpen = k.readBoolean();
            this._Str_18253 = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._Str_8842 = k.readBoolean();
            }
            return true;
        }
    }
}
