package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ActivityPointsMessageParser implements IMessageParser 
    {
        private var _points:Dictionary;


        public function flush():Boolean
        {
            this._points = new Dictionary();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                this._points[_local_4] = _local_5;
                _local_3++;
            }
            return true;
        }

        public function get points():Dictionary
        {
            return this._points;
        }
    }
}
