package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackMessageParser implements IMessageParser
    {
        private var _talentTrack:TalentTrack;


        public function flush():Boolean
        {
            this._talentTrack = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._talentTrack = new TalentTrack();
            this._talentTrack.parse(k);
            return true;
        }

        public function _Str_23534():TalentTrack
        {
            return this._talentTrack;
        }
    }
}
