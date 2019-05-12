package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8720 implements IMessageParser 
    {
        private var _isOpen:Boolean;
        private var _Str_16145:int;


        public function get isOpen():Boolean
        {
            return this._isOpen;
        }

        public function get _Str_26363():int
        {
            return this._Str_16145;
        }

        public function flush():Boolean
        {
            this._isOpen = false;
            this._Str_16145 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isOpen = (k.readInteger() > 0);
            this._Str_16145 = k.readInteger();
            return true;
        }
    }
}
