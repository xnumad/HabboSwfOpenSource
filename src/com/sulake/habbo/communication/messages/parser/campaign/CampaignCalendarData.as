package com.sulake.habbo.communication.messages.parser.campaign
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CampaignCalendarData 
    {
        private var _campaignName:String;
        private var _campaignImage:String;
        private var _currentDay:int;
        private var _campaignDays:int;
        private var _openedDays:Vector.<int>;
        private var _missedDays:Vector.<int>;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            this._campaignName = k.readString();
            this._campaignImage = k.readString();
            this._currentDay = k.readInteger();
            this._campaignDays = k.readInteger();
            this._openedDays = new Vector.<int>(0);
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._openedDays.push(k.readInteger());
                _local_2++;
            }
            this._missedDays = new Vector.<int>(0);
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._missedDays.push(k.readInteger());
                _local_2++;
            }
            return true;
        }

        public function clone():CampaignCalendarData
        {
            var k:CampaignCalendarData = new CampaignCalendarData();
            k._Str_8399 = this._campaignDays;
            k._Str_19589 = this._campaignImage;
            k._Str_11123 = this._campaignName;
            k._Str_5472 = this._currentDay;
            k._Str_14267 = this._missedDays;
            k._Str_10724 = this._openedDays;
            return k;
        }

        public function get _Str_11123():String
        {
            return this._campaignName;
        }

        public function get _Str_19589():String
        {
            return this._campaignImage;
        }

        public function get _Str_5472():int
        {
            return this._currentDay;
        }

        public function get _Str_8399():int
        {
            return this._campaignDays;
        }

        public function get _Str_10724():Vector.<int>
        {
            return this._openedDays;
        }

        public function get _Str_14267():Vector.<int>
        {
            return this._missedDays;
        }

        public function set _Str_11123(k:String):void
        {
            this._campaignName = k;
        }

        public function set _Str_19589(k:String):void
        {
            this._campaignImage = k;
        }

        public function set _Str_5472(k:int):void
        {
            this._currentDay = k;
        }

        public function set _Str_8399(k:int):void
        {
            this._campaignDays = k;
        }

        public function set _Str_10724(k:Vector.<int>):void
        {
            this._openedDays = k;
        }

        public function set _Str_14267(k:Vector.<int>):void
        {
            this._missedDays = k;
        }
    }
}
