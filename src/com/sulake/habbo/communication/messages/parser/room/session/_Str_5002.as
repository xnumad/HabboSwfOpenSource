package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.utils.Map;

    public class _Str_5002 
    {
        private var _name:String;
        private var _target:int;
        private var _Str_5811:Map;

        public function _Str_5002(k:String, _arg_2:int)
        {
            this._name = k;
            this._target = _arg_2;
            this._Str_5811 = new Map();
        }

        public function get name():String
        {
            return this._name;
        }

        public function get target():int
        {
            return this._target;
        }

        public function get queueTypes():Array
        {
            return this._Str_5811.getKeys();
        }

        public function getQueueSize(k:String):int
        {
            return this._Str_5811.getValue(k);
        }

        public function addQueue(k:String, _arg_2:int):void
        {
            this._Str_5811.add(k, _arg_2);
        }
    }
}
