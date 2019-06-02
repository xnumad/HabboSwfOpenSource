package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8379 implements IMessageParser 
    {
        private var _Str_4858:Boolean = false;
        private var _Str_17043:String = null;


        public function isOk():Boolean
        {
            return this._Str_4858;
        }

        public function _Str_19783():String
        {
            return this._Str_17043;
        }

        public function flush():Boolean
        {
            this._Str_4858 = false;
            this._Str_17043 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_4858 = k.readBoolean();
            this._Str_17043 = k.readString();
            return true;
        }
    }
}
