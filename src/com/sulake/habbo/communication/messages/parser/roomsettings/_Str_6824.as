package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_4114;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6824 implements IMessageParser 
    {
        private var _flatId:int;
        private var _data:_Str_4114;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._flatId = k.readInteger();
            this._data = new _Str_4114(k);
            return true;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get data():_Str_4114
        {
            return this._data;
        }
    }
}
