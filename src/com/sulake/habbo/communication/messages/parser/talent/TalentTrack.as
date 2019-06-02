package com.sulake.habbo.communication.messages.parser.talent
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.utils._Str_988;
    import __AS3__.vec.*;

    public class TalentTrack 
    {
        public static const STATE_LOCKED:int = 0;
        public static const STATE_ONGOING:int = 1;
        public static const STATE_ACHIEVED:int = 2;

        private var _name:String;
        private var _currentLevelIndex:int;
        private var _levels:Vector.<TalentTrackLevel>;


        public function parse(k:IMessageDataWrapper):void
        {
            var _local_4:TalentTrackLevel;
            this._name = k.readString();
            this._levels = new Vector.<TalentTrackLevel>();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new TalentTrackLevel();
                _local_4.parse(k);
                if (_local_4.state == STATE_ONGOING)
                {
                    this._currentLevelIndex = _local_3;
                }
                this._levels.push(_local_4);
                _local_3++;
            }
        }

        public function _Str_17590(k:int):_Str_2821
        {
            var _local_3:TalentTrackLevel;
            var _local_4:_Str_2821;
            var _local_2:_Str_2821;
            for each (_local_3 in this._levels)
            {
                if (_local_3.state != TalentTrack.STATE_LOCKED)
                {
                    _local_4 = _local_3._Str_17590(k);
                    if (_local_4 != null)
                    {
                        _local_2 = _local_4;
                    }
                }
            }
            return _local_2;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get levels():Vector.<TalentTrackLevel>
        {
            return this._levels;
        }

        public function get progressPerLevel():Number
        {
            if (this._levels.length > 0)
            {
                return 1 / this._levels.length;
            }
            return 0;
        }

        public function get _Str_18600():Number
        {
            var k:Number;
            if (this._levels.length > 0)
            {
                k = this._levels[this._currentLevelIndex].levelProgress;
                return _Str_988._Str_2040(((this._currentLevelIndex * this.progressPerLevel) + (k * this.progressPerLevel)));
            }
            return 0;
        }

        public function get progressForCurrentLevel():Number
        {
            if (this._levels.length > 0)
            {
                return this._currentLevelIndex * this.progressPerLevel;
            }
            return 0;
        }

        public function removeFirstLevel():void
        {
            this._levels.shift();
            this._currentLevelIndex = Math.max(0, (this._currentLevelIndex - 1));
        }
    }
}
