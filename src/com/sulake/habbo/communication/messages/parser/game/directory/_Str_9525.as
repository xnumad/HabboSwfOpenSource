package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9525 implements IMessageParser 
    {
        public static const _Str_21125:int = 0;
        public static const _Str_20011:int = 1;
        public static const _Str_20194:int = 2;
        public static const _Str_21170:int = 3;

        private var _status:int;
        private var _Str_21469:int;
        private var _Str_21518:int;
        private var _Str_7940:int;


        public function get status():int
        {
            return this._status;
        }

        public function get _Str_26321():int
        {
            return this._Str_21469;
        }

        public function get _Str_26070():int
        {
            return this._Str_21518;
        }

        public function get _Str_21510():int
        {
            return this._Str_7940;
        }

        public function get _Str_23843():Boolean
        {
            return this._Str_7940 == -1;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = k.readInteger();
            this._Str_21469 = k.readInteger();
            this._Str_21518 = k.readInteger();
            this._Str_7940 = k.readInteger();
            return true;
        }
    }
}
