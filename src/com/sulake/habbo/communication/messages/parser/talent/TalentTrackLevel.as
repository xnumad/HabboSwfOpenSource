package com.sulake.habbo.communication.messages.parser.talent
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.utils._Str_988;
    import __AS3__.vec.*;

    public class TalentTrackLevel 
    {
        private var _level:int;
        private var _state:int;
        private var _tasks:Vector.<_Str_2821>;
        private var _rewardPerks:Vector.<_Str_3450>;
        private var _rewardProducts:Vector.<_Str_3457>;

        public function TalentTrackLevel()
        {
            this._tasks = new Vector.<_Str_2821>();
            this._rewardPerks = new Vector.<_Str_3450>();
            this._rewardProducts = new Vector.<_Str_3457>();
            super();
        }

        public function parse(k:IMessageDataWrapper):void
        {
            var _local_2:int;
            var _local_3:int;
            this._level = k.readInteger();
            this._state = k.readInteger();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._tasks.push(new _Str_2821(k));
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._rewardPerks.push(new _Str_3450(k));
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._rewardProducts.push(new _Str_3457(k));
                _local_2++;
            }
        }

        public function get level():int
        {
            return this._level;
        }

        public function set level(k:int):void
        {
            this._level = k;
        }

        public function get state():int
        {
            return this._state;
        }

        public function set state(k:int):void
        {
            this._state = k;
        }

        public function get _Str_20997():Vector.<_Str_2821>
        {
            return this._tasks;
        }

        public function get _Str_8893():Vector.<_Str_3450>
        {
            return this._rewardPerks;
        }

        public function get _Str_7068():Vector.<_Str_3457>
        {
            return this._rewardProducts;
        }

        public function get rewardCount():int
        {
            return this._rewardPerks.length + this._rewardProducts.length;
        }

        public function get levelProgress():Number
        {
            var _local_3:_Str_2821;
            var k:Number = (1 / this._tasks.length);
            var _local_2:Number = 0;
            for each (_local_3 in this._tasks)
            {
                if (_local_3.state == TalentTrack.STATE_ACHIEVED)
                {
                    _local_2 = (_local_2 + k);
                }
            }
            return _Str_988._Str_2040(_local_2);
        }

        public function _Str_17590(k:int):_Str_2821
        {
            var _local_2:_Str_2821;
            for each (_local_2 in this._tasks)
            {
                if (_local_2.achievementId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }
    }
}
