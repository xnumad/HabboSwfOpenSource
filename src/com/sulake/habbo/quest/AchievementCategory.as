package com.sulake.habbo.quest
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import __AS3__.vec.*;

    public class AchievementCategory 
    {
        private var _code:String;
        private var _achievements:Vector.<Achievement>;

        public function AchievementCategory(k:String)
        {
            this._achievements = new Vector.<Achievement>(0);
            super();
            this._code = k;
        }

        public function add(k:Achievement):void
        {
            this._achievements.push(k);
        }

        public function update(k:Achievement):void
        {
            var _local_3:Achievement;
            var _local_2:int;
            while (_local_2 < this._achievements.length)
            {
                _local_3 = this._achievements[_local_2];
                if (_local_3.achievementId == k.achievementId)
                {
                    this._achievements[_local_2] = k;
                }
                _local_2++;
            }
        }

        public function _Str_9594():int
        {
            var _local_2:Achievement;
            var k:int;
            for each (_local_2 in this._achievements)
            {
                k = (k + ((_local_2._Str_7518) ? _local_2.level : (_local_2.level - 1)));
            }
            return k;
        }

        public function _Str_10932():int
        {
            var _local_2:Achievement;
            var k:int;
            for each (_local_2 in this._achievements)
            {
                k = (k + _local_2._Str_20475);
            }
            return k;
        }

        public function get code():String
        {
            return this._code;
        }

        public function get achievements():Vector.<Achievement>
        {
            return this._achievements;
        }
    }
}
