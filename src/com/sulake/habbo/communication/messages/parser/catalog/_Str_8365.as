package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8365 implements IMessageParser 
    {
        private var _Str_21494:Boolean;
        private var _Str_8546:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_21494 = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._Str_8546 = k.readString();
            }
            return true;
        }

        public function get _Str_17070():Boolean
        {
            return this._Str_21494;
        }

        public function get _Str_12669():String
        {
            return this._Str_8546;
        }
    }
}
