package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7315 implements IMessageParser 
    {
        private var _Str_20855:Boolean;
        private var _Str_20082:int;
        private var _duration:int = 15;


        public function get isInMaintenance():Boolean
        {
            return this._Str_20855;
        }

        public function get _Str_23709():int
        {
            return this._Str_20082;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_20855 = k.readBoolean();
            this._Str_20082 = k.readInteger();
            if (k.bytesAvailable)
            {
                this._duration = k.readInteger();
            }
            return true;
        }
    }
}
