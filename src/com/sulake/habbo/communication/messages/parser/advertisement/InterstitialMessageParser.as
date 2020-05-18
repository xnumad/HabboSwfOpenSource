package com.sulake.habbo.communication.messages.parser.advertisement
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class InterstitialMessageParser implements IMessageParser 
    {
        private var _canShowInterstitial:Boolean;


        public function get canShowInterstitial():Boolean
        {
            return this._canShowInterstitial;
        }

        public function flush():Boolean
        {
            this._canShowInterstitial = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._canShowInterstitial = k.readBoolean();
            return true;
        }
    }
}
