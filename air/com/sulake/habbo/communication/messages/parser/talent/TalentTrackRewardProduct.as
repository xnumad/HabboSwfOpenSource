//com.sulake.habbo.communication.messages.parser.talent.TalentTrackRewardProduct

package com.sulake.habbo.communication.messages.parser.talent{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackRewardProduct {

        private var _productCode:String;
        private var _vipDays:int;

        public function TalentTrackRewardProduct(k:IMessageDataWrapper);

        public function get productCode():String;

        public function get vipDays():int;


    }
}//package com.sulake.habbo.communication.messages.parser.talent

