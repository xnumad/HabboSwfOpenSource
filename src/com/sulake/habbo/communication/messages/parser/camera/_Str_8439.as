package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8439 implements IMessageParser 
    {
        private var _Str_4858:Boolean = true;
        private var _Str_16594:Boolean = false;


        public function isOk():Boolean
        {
            return this._Str_4858;
        }

        public function _Str_25428():Boolean
        {
            return this._Str_16594;
        }

        public function flush():Boolean
        {
            this._Str_4858 = true;
            this._Str_16594 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k.bytesAvailable)
            {
                this._Str_4858 = k.readBoolean();
                this._Str_16594 = k.readBoolean();
            }
            return true;
        }
    }
}
