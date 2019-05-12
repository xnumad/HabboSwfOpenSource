package com.sulake.habbo.communication.messages.parser.sound
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound.SongEntry;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6369 implements IMessageParser 
    {
        private var _Str_17090:int;
        private var _Str_2519:Array;


        public function get _Str_23052():int
        {
            return this._Str_17090;
        }

        public function get _Str_24122():Array
        {
            return this._Str_2519;
        }

        public function flush():Boolean
        {
            this._Str_17090 = -1;
            this._Str_2519 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            this._Str_17090 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = k.readString();
                _local_7 = k.readString();
                this._Str_2519.push(new SongEntry(_local_4, _local_5, _local_6, _local_7));
                _local_3++;
            }
            return true;
        }
    }
}
