package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading._Str_9219;

    public class _Str_6742 extends MessageEvent 
    {
        public function _Str_6742(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function get _Str_15162():int
        {
            return this.getParser()._Str_15162;
        }

        public function get _Str_18215():int
        {
            return this.getParser()._Str_18215;
        }

        public function get _Str_14946():int
        {
            return this.getParser()._Str_14946;
        }

        public function get _Str_13801():int
        {
            return this.getParser()._Str_13801;
        }

        public function get _Str_15709():int
        {
            return this.getParser()._Str_15709;
        }

        public function get _Str_9138():int
        {
            return this.getParser()._Str_9138;
        }

        public function get _Str_17841():Array
        {
            return this.getParser()._Str_17841;
        }

        public function get _Str_17465():Array
        {
            return this.getParser()._Str_17465;
        }

        public function getParser():_Str_9219
        {
            return _parser as _Str_9219;
        }
    }
}
