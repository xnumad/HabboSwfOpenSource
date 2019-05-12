package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7210 implements IMessageParser 
    {
        private var _Str_2673:TalentTrack;


        public function flush():Boolean
        {
            this._Str_2673 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2673 = new TalentTrack();
            this._Str_2673.parse(k);
            return true;
        }

        public function _Str_23534():TalentTrack
        {
            return this._Str_2673;
        }
    }
}
