package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BadgesParser implements IMessageParser
    {
        private var _allBadgeCodes:Array;
        private var _activeBadgeCodes:Array;
        private var _badgeIds:Map;


        public function flush():Boolean
        {
            this._allBadgeCodes = [];
            this._activeBadgeCodes = [];
            if (this._badgeIds)
            {
                this._badgeIds.dispose();
                this._badgeIds = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:String;
            var _local_8:int;
            this._allBadgeCodes = new Array();
            this._badgeIds = new Map();
            var _local_4:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._badgeIds.add(_local_3, _local_2);
                this._allBadgeCodes.push(_local_3);
                _local_5++;
            }
            this._activeBadgeCodes = new Array();
            var _local_6:int = k.readInteger();
            var _local_7:int;
            while (_local_7 < _local_6)
            {
                _local_8 = k.readInteger();
                _local_3 = k.readString();
                this._activeBadgeCodes.push(_local_3);
                _local_7++;
            }
            return true;
        }

        public function getBadgeId(k:String):int
        {
            return this._badgeIds.getValue(k);
        }

        public function getAllBadgeCodes():Array
        {
            return this._allBadgeCodes;
        }

        public function getActiveBadgeCodes():Array
        {
            return this._activeBadgeCodes;
        }
    }
}
