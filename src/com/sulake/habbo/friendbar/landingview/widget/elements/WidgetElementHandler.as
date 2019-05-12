package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;

    public class WidgetElementHandler 
    {
        public static const CAPTION:String = "caption";
        public static const TITLE:String = "title";
        public static const SUBCAPTION:String = "subcaption";
        public static const BODYTEXT:String = "bodytext";
        public static const SPACING:String = "spacing";
        public static const CATALOGBUTTON:String = "catalogbutton";
        public static const PROMOTEDROOMBUTTON:String = "promotedroombutton";
        public static const LINK:String = "link";
        public static const GOTOROOMBUTTON:String = "gotoroombutton";
        public static const REQUESTBADGEBUTTON:String = "requestbadgebutton";
        public static const REQUESTBADGEBUTTONSECOND:String = "requestbadgebuttonsecond";
        public static const REQUESTBADGEBUTTONTHIRD:String = "requestbadgebuttonthird";
        public static const REQUESTBADGEBUTTONFOURTH:String = "requestbadgebuttonfourth";
        public static const REQUESTBADGEBUTTONFIFTH:String = "requestbadgebuttonfifth";
        public static const CREDITHABBLETBUTTON:String = "credithabbletbutton";
        public static const COMMUNITYGOALTIMER:String = "communitygoaltimer";
        public static const CUSTOMTIMER:String = "customtimer";
        public static const GOTOHOMEROOMBUTTON:String = "gotohomeroombutton";
        public static const GOTOCOMPETITIONROOMBUTTON:String = "gotocompetitionroombutton";
        public static const REWARDBADGE:String = "rewardbadge";
        public static const IMAGE:String = "image";
        public static const SUBMITCOMPETITIONROOM:String = "submitcompetitionroom";
        public static const CONCURRENTUSERSMETER:String = "concurrentusersmeter";
        public static const CONCURRENTUSERSINFO:String = "concurrentusersinfo";
        public static const DAILYQUEST:String = "dailyquest";
        public static const BUYVIPBUTTON:String = "buyvipbutton";
        public static const COMMUNITYGOALSCORE:String = "communitygoalscore";
        public static const GAMECENTERBUTTON:String = "gamecenterbutton";
        public static const INTERNALLINKBUTTON:String = "internallinkbutton";

        public static function _Str_24129(k:String):IElementHandler
        {
            switch (k)
            {
                case WidgetElementHandler.CAPTION:
                case WidgetElementHandler.SUBCAPTION:
                case WidgetElementHandler.BODYTEXT:
                    return new TextElementHandler();
                case WidgetElementHandler.TITLE:
                    return new TitleElementHandler();
                case WidgetElementHandler.SPACING:
                    return new SpacingElementHandler();
                case WidgetElementHandler.CATALOGBUTTON:
                    return new CatalogButtonElementHandler();
                case WidgetElementHandler.PROMOTEDROOMBUTTON:
                    return new PromotedRoomButtonElementHandler();
                case WidgetElementHandler.LINK:
                    return new LinkElementHandler();
                case WidgetElementHandler.GOTOROOMBUTTON:
                    return new GoToRoomButtonElementHandler();
                case WidgetElementHandler.REQUESTBADGEBUTTON:
                case WidgetElementHandler.REQUESTBADGEBUTTONSECOND:
                case WidgetElementHandler.REQUESTBADGEBUTTONTHIRD:
                case WidgetElementHandler.REQUESTBADGEBUTTONFOURTH:
                case WidgetElementHandler.REQUESTBADGEBUTTONFIFTH:
                    return new RequestBadgeButtonElementHandler();
                case WidgetElementHandler.CREDITHABBLETBUTTON:
                    return new CreditHabbletButtonElementHandler();
                case WidgetElementHandler.COMMUNITYGOALTIMER:
                    return new CommunityGoalTimerElementHandler();
                case WidgetElementHandler.CUSTOMTIMER:
                    return new CustomTimerElementHandler();
                case WidgetElementHandler.GOTOHOMEROOMBUTTON:
                    return new GoToHomeRoomButtonElementHandler();
                case WidgetElementHandler.GOTOCOMPETITIONROOMBUTTON:
                    return new GoToCompetitionRoomButtonElementHandler();
                case WidgetElementHandler.REWARDBADGE:
                    return new RewardBadgeElementHandler();
                case WidgetElementHandler.IMAGE:
                    return new ImageElementHandler();
                case WidgetElementHandler.SUBMITCOMPETITIONROOM:
                    return new SubmitCompetitionRoomElementHandler();
                case WidgetElementHandler.CONCURRENTUSERSMETER:
                    return new ConcurrentUsersMeterElementHandler();
                case WidgetElementHandler.CONCURRENTUSERSINFO:
                    return new ConcurrentUsersInfoElementHandler();
                case WidgetElementHandler.DAILYQUEST:
                    return new DailyQuestElementHandler();
                case WidgetElementHandler.BUYVIPBUTTON:
                    return new BuyVipButtonElementHandler();
                case WidgetElementHandler.COMMUNITYGOALSCORE:
                    return new CommunityGoalScoreCounterElementHandler();
                case WidgetElementHandler.GAMECENTERBUTTON:
                    return new GameCenterButtonElementHandler();
                case WidgetElementHandler.INTERNALLINKBUTTON:
                    return new InternalLinkButtonElementHandler();
            }
            return null;
        }
    }
}
