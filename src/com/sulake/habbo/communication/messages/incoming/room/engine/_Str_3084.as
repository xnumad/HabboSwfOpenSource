package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_5772;

    public class _Str_3084 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3084(k:Function)
        {
            super(k, _Str_5772);
        }

        public function get id():int
        {
            return (_parser as _Str_5772).id;
        }

        public function get figure():String
        {
            return (_parser as _Str_5772).figure;
        }

        public function get _Str_3344():String
        {
            return (_parser as _Str_5772)._Str_3344;
        }

        public function get customInfo():String
        {
            return (_parser as _Str_5772).customInfo;
        }

        public function get activityPoints():int
        {
            return (_parser as _Str_5772).activityPoints;
        }
    }
}
