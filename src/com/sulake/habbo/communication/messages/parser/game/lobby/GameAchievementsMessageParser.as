package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class GameAchievementsMessageParser implements IMessageParser 
    {
        private var _achievements:Vector.<_Str_5597>;


        public function flush():Boolean
        {
            return true;
        }

        public function get achievements():Vector.<_Str_5597>
        {
            return this._achievements;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:int;
            this._achievements = new Vector.<_Str_5597>();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    _local_7 = k.readInteger();
                    _local_8 = k.readString();
                    _local_9 = k.readInteger();
                    this._achievements.push(new _Str_5597(_local_4, _local_7, _local_8, _local_9));
                    _local_6++;
                }
                _local_3++;
            }
            return true;
        }
    }
}
