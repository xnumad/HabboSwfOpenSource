package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading._Str_9589;

    public class _Str_7375 extends MessageEvent 
    {
        public function _Str_7375(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function get _Str_4963():int
        {
            return this.getParser()._Str_4963;
        }

        public function get _Str_16764():Boolean
        {
            return this.getParser()._Str_16764;
        }

        public function get _Str_17613():int
        {
            return this.getParser()._Str_17613;
        }

        public function get _Str_13374():Boolean
        {
            return this.getParser()._Str_13374;
        }

        public function getParser():_Str_9589
        {
            return _parser as _Str_9589;
        }
    }
}
