package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackRewardPerk
    {
        private var _Str_21367:String;

        public function TalentTrackRewardPerk(k:IMessageDataWrapper)
        {
            this._Str_21367 = k.readString();
        }

        public function get _Str_10964():String
        {
            return this._Str_21367;
        }
    }
}
