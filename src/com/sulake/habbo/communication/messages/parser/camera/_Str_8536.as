package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8536 implements IMessageParser 
    {
        private var _Str_9271:int = 0;
        private var _Str_8408:int = 0;
        private var _Str_8279:int = 0;


        public function _Str_23524():int
        {
            return this._Str_9271;
        }

        public function _Str_22790():int
        {
            return this._Str_8408;
        }

        public function _Str_22604():int
        {
            return this._Str_8279;
        }

        public function flush():Boolean
        {
            this._Str_9271 = 0;
            this._Str_8408 = 0;
            this._Str_8279 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_9271 = k.readInteger();
            this._Str_8408 = k.readInteger();
            if (k.bytesAvailable > 0)
            {
                this._Str_8279 = k.readInteger();
            }
            return true;
        }
    }
}
