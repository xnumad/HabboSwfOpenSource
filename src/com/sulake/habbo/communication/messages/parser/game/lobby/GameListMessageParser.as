package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class GameListMessageParser implements IMessageParser 
    {
        private var _games:Vector.<_Str_5486>;


        public function flush():Boolean
        {
            return true;
        }

        public function get games():Vector.<_Str_5486>
        {
            return this._games;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:uint;
            var _local_8:String;
            var _local_9:uint;
            var _local_10:String;
            var _local_11:String;
            this._games = new Vector.<_Str_5486>();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readString();
                _local_6 = k.readString();
                _local_7 = parseInt(_local_6, 16);
                _local_7 = (_local_7 | 0xFF000000);
                _local_8 = k.readString();
                _local_9 = parseInt(_local_8, 16);
                _local_9 = (_local_9 | 0xFF000000);
                _local_10 = k.readString();
                _local_11 = k.readString();
                this._games.push(new _Str_5486(_local_4, _local_5, _local_7, _local_9, _local_10, _local_11));
                _local_3++;
            }
            return true;
        }
    }
}
