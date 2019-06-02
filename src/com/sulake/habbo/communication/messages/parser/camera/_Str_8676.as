package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8676 implements IMessageParser 
    {
        private var _Str_4858:Boolean = false;
        private var _Str_16901:int = 0;
        private var _Str_9712:String;


        public function isOk():Boolean
        {
            return this._Str_4858;
        }

        public function _Str_25098():int
        {
            return this._Str_16901;
        }

        public function _Str_24023():String
        {
            return this._Str_9712;
        }

        public function flush():Boolean
        {
            this._Str_4858 = false;
            this._Str_16901 = 0;
            this._Str_9712 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_4858 = k.readBoolean();
            this._Str_16901 = k.readInteger();
            if (((this._Str_4858) && (k.bytesAvailable)))
            {
                this._Str_9712 = k.readString();
            }
            return true;
        }
    }
}
