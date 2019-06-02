//com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class QuestMessageData {

        private var _campaignCode:String;
        private var _completedQuestsInCampaign:int;
        private var _questCountInCampaign:int;
        private var _activityPointType:int;
        private var _id:int;
        private var _accepted:Boolean;
        private var _type:String;
        private var _imageVersion:String;
        private var _rewardCurrencyAmount:int;
        private var _localizationCode:String;
        private var _completedSteps:int;
        private var _totalSteps:int;
        private var _waitPeriodSeconds:int;
        private var _sortOrder:int;
        private var _catalogPageName:String;
        private var _chainCode:String;
        private var _easy:Boolean;
        private var _receiveTime:Date;

        public function QuestMessageData(k:IMessageDataWrapper);

        public static function getCampaignLocalizationKeyForCode(k:String):String;


        public function get campaignCode():String;

        public function get localizationCode():String;

        public function get completedQuestsInCampaign():int;

        public function get questCountInCampaign():int;

        public function get activityPointType():int;

        public function get accepted():Boolean;

        public function get id():int;

        public function get type():String;

        public function get imageVersion():String;

        public function get rewardCurrencyAmount():int;

        public function get completedSteps():int;

        public function get totalSteps():int;

        public function get isCompleted():Boolean;

        public function get waitPeriodSeconds():int;

        public function getCampaignLocalizationKey():String;

        public function getQuestLocalizationKey():String;

        public function get completedCampaign():Boolean;

        public function set id(k:int):void;

        public function set accepted(k:Boolean):void;

        public function get lastQuestInCampaign():Boolean;

        public function get receiveTime():Date;

        public function set waitPeriodSeconds(k:int):void;

        public function get sortOrder():int;

        public function get catalogPageName():String;

        public function get chainCode():String;

        public function get easy():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

