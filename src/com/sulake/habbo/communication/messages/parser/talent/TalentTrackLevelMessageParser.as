package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackLevelMessageParser implements IMessageParser
    {
        private var _talentTrackName:String;
        private var _level:int;
        private var _maxLevel:int;


        public function flush():Boolean
        {
            this._talentTrackName = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._talentTrackName = k.readString();
            this._level = k.readInteger();
            this._maxLevel = k.readInteger();
            return true;
        }

        public function get talentTrackName():String
        {
            return this._talentTrackName;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get _Str_16859():int
        {
            return this._maxLevel;
        }
    }
}
