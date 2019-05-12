package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementResolution;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class AchievementResolutionsMessageParser implements IMessageParser 
    {
        private var _stuffId:int;
        private var _achievements:Vector.<AchievementResolution>;
        private var _endTime:int;


        public function flush():Boolean
        {
            var k:AchievementResolution;
            this._stuffId = -1;
            for each (k in this._achievements)
            {
                k.dispose();
            }
            this._achievements = new Vector.<AchievementResolution>(0);
            this._endTime = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._stuffId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._achievements.push(new AchievementResolution(k));
                _local_3++;
            }
            this._endTime = k.readInteger();
            return true;
        }

        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get achievements():Vector.<AchievementResolution>
        {
            return this._achievements;
        }

        public function get _Str_17028():int
        {
            return this._endTime;
        }
    }
}
