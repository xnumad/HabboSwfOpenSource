package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackRewardPerk
    {
        private var _perkId:String;

        public function TalentTrackRewardPerk(k:IMessageDataWrapper)
        {
            this._perkId = k.readString();
        }

        public function get _Str_10964():String
        {
            return this._perkId;
        }
    }
}
