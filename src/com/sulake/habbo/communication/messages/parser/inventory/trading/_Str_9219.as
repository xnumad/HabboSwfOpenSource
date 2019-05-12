package com.sulake.habbo.communication.messages.parser.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading._Str_6342;

    public class _Str_9219 implements IMessageParser 
    {
        private var _Str_16633:int;
        private var _Str_12613:Array;
        private var _Str_18495:int;
        private var _Str_18187:int;
        private var _Str_18907:int;
        private var _Str_12840:Array;
        private var _Str_16571:int;
        private var _Str_17852:int;


        public function get _Str_15162():int
        {
            return this._Str_16633;
        }

        public function get _Str_17841():Array
        {
            return this._Str_12613;
        }

        public function get _Str_14946():int
        {
            return this._Str_18495;
        }

        public function get _Str_15709():int
        {
            return this._Str_18187;
        }

        public function get _Str_18215():int
        {
            return this._Str_18907;
        }

        public function get _Str_17465():Array
        {
            return this._Str_12840;
        }

        public function get _Str_13801():int
        {
            return this._Str_16571;
        }

        public function get _Str_9138():int
        {
            return this._Str_17852;
        }

        public function flush():Boolean
        {
            this._Str_16633 = -1;
            this._Str_12613 = null;
            this._Str_18495 = 0;
            this._Str_18187 = 0;
            this._Str_18907 = -1;
            this._Str_12840 = null;
            this._Str_16571 = 0;
            this._Str_17852 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16633 = k.readInteger();
            this._Str_12613 = new Array();
            if (!this._Str_9484(k, this._Str_12613))
            {
                return false;
            }
            this._Str_18495 = k.readInteger();
            this._Str_18187 = k.readInteger();
            this._Str_18907 = k.readInteger();
            this._Str_12840 = new Array();
            if (!this._Str_9484(k, this._Str_12840))
            {
                return false;
            }
            this._Str_16571 = k.readInteger();
            this._Str_17852 = k.readInteger();
            return true;
        }

        private function _Str_9484(k:IMessageDataWrapper, _arg_2:Array):Boolean
        {
            var _local_3:int;
            _local_3 = k.readInteger();
            while (_local_3 > 0)
            {
                _arg_2.push(new _Str_6342(k));
                _local_3--;
            }
            return true;
        }
    }
}
