package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_4114;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6355 implements IMessageParser 
    {
        private var _roomId:int;
        private var _Str_8850:Array;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_8850.push(new _Str_4114(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._Str_8850 = [];
            return true;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_8349():Array
        {
            return this._Str_8850;
        }
    }
}
