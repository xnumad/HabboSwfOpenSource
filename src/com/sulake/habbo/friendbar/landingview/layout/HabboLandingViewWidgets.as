package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CommunityGoalHallOfFameWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CommunityGoalPrizesWidget;
    import com.sulake.habbo.friendbar.landingview.widget.AvatarImageWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CommunityGoalWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CommunityGoalVsModeWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CommunityGoalVsModeVoteWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CatalogPromoWidget;
    import com.sulake.habbo.friendbar.landingview.widget.CatalogPromoSmallWidget;
    import com.sulake.habbo.friendbar.landingview.widget.DailyQuestWidget;
    import com.sulake.habbo.friendbar.landingview.widget.ExpiringCatalogPageWidget;
    import com.sulake.habbo.friendbar.landingview.widget.ExpiringCatalogPageSmallWidget;
    import com.sulake.habbo.friendbar.landingview.widget.NextLimitedRareCountdownWidget;
    import com.sulake.habbo.friendbar.landingview.widget.HabboModerationPromoWidget;
    import com.sulake.habbo.friendbar.landingview.widget.HabboTalentsPromoWidget;
    import com.sulake.habbo.friendbar.landingview.widget.HabboWayPromoWidget;
    import com.sulake.habbo.friendbar.landingview.widget.FastFoodGamePromoWidget;
    import com.sulake.habbo.friendbar.landingview.widget.RoomHopperNetworkWidget;
    import com.sulake.habbo.friendbar.landingview.widget.SafetyQuizPromoWidget;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.friendbar.landingview.widget.WidgetContainerWidget;
    import com.sulake.habbo.friendbar.landingview.widget.PromoArticleWidget;
    import com.sulake.habbo.friendbar.landingview.widget.BonusRareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class HabboLandingViewWidgets 
    {
        public static const AVATAR_IMAGE:String = "avatarimage";
        public static const EXPIRING_CATALOG_PAGE:String = "expiringcatalogpage";
        public static const EXPIRING_CATALOG_PAGE_SMALL:String = "expiringcatalogpagesmall";
        public static const COMMUNITY_GOAL:String = "communitygoal";
        public static const COMMUNITY_GOAL_VS_MODE:String = "communitygoalvsmode";
        public static const COMMUNITY_GOAL_VS_MODE_VOTE:String = "communitygoalvsmodevote";
        public static const CATALOG_PROMO:String = "catalogpromo";
        public static const CATALOG_PROMO_SMALL:String = "catalogpromosmall";
        public static const ACHIEVEMENT_COMPETITION_HALL_OF_FAME:String = "achievementcompetition_hall_of_fame";
        public static const ACHIEVEMENT_COMPETITION_PRIZES:String = "achievementcompetition_prizes";
        public static const DAILYQUEST:String = "dailyquest";
        public static const NEXT_LIMITED_RARE_COUNTDOWN:String = "nextlimitedrarecountdown";
        public static const HABBO_MODERATION_PROMO:String = "habbomoderationpromo";
        public static const HABBO_TALENTS_PROMO:String = "habbotalentspromo";
        public static const HABBO_WAY_PROMO:String = "habbowaypromo";
        public static const FASTFOOD_GAME_PROMO:String = "fastfoodgamepromo";
        public static const ROOMHOPPER_NETWORK:String = "roomhoppernetwork";
        public static const SAFETY_QUIZ_PROMO:String = "safetyquizpromo";
        public static const GENERIC:String = "generic";
        public static const WIDGET_CONTAINER:String = "widgetcontainer";
        public static const PROMO_ARTICLE:String = "promoarticle";
        public static const BONUS_RARE:String = "bonusrare";


        public static function createWidget(widgetCode:String, landingView:HabboLandingView):ILandingViewWidget
        {
            var widget:ILandingViewWidget;
            switch (widgetCode)
            {
                case HabboLandingViewWidgets.ACHIEVEMENT_COMPETITION_HALL_OF_FAME:
                    widget = new CommunityGoalHallOfFameWidget(landingView);
                    break;
                case HabboLandingViewWidgets.ACHIEVEMENT_COMPETITION_PRIZES:
                    widget = new CommunityGoalPrizesWidget(landingView);
                    break;
                case HabboLandingViewWidgets.AVATAR_IMAGE:
                    widget = new AvatarImageWidget(landingView);
                    break;
                case HabboLandingViewWidgets.COMMUNITY_GOAL:
                    widget = new CommunityGoalWidget(landingView);
                    break;
                case HabboLandingViewWidgets.COMMUNITY_GOAL_VS_MODE:
                    widget = new CommunityGoalVsModeWidget(landingView);
                    break;
                case HabboLandingViewWidgets.COMMUNITY_GOAL_VS_MODE_VOTE:
                    widget = new CommunityGoalVsModeVoteWidget(landingView);
                    break;
                case HabboLandingViewWidgets.CATALOG_PROMO:
                    widget = new CatalogPromoWidget(landingView);
                    break;
                case HabboLandingViewWidgets.CATALOG_PROMO_SMALL:
                    widget = new CatalogPromoSmallWidget(landingView);
                    break;
                case HabboLandingViewWidgets.DAILYQUEST:
                    widget = new DailyQuestWidget(landingView);
                    break;
                case HabboLandingViewWidgets.EXPIRING_CATALOG_PAGE:
                    widget = new ExpiringCatalogPageWidget(landingView);
                    break;
                case HabboLandingViewWidgets.EXPIRING_CATALOG_PAGE_SMALL:
                    widget = new ExpiringCatalogPageSmallWidget(landingView);
                    break;
                case HabboLandingViewWidgets.NEXT_LIMITED_RARE_COUNTDOWN:
                    widget = new NextLimitedRareCountdownWidget(landingView);
                    break;
                case HabboLandingViewWidgets.HABBO_MODERATION_PROMO:
                    widget = new HabboModerationPromoWidget(landingView);
                    break;
                case HabboLandingViewWidgets.HABBO_TALENTS_PROMO:
                    widget = new HabboTalentsPromoWidget(landingView);
                    break;
                case HabboLandingViewWidgets.HABBO_WAY_PROMO:
                    widget = new HabboWayPromoWidget(landingView);
                    break;
                case HabboLandingViewWidgets.FASTFOOD_GAME_PROMO:
                    widget = new FastFoodGamePromoWidget(landingView);
                    break;
                case HabboLandingViewWidgets.ROOMHOPPER_NETWORK:
                    widget = new RoomHopperNetworkWidget(landingView);
                    break;
                case HabboLandingViewWidgets.SAFETY_QUIZ_PROMO:
                    widget = new SafetyQuizPromoWidget(landingView);
                    break;
                case HabboLandingViewWidgets.GENERIC:
                    widget = new GenericWidget(landingView);
                    break;
                case HabboLandingViewWidgets.WIDGET_CONTAINER:
                    widget = new WidgetContainerWidget(landingView);
                    break;
                case HabboLandingViewWidgets.PROMO_ARTICLE:
                    widget = new PromoArticleWidget(landingView);
                    break;
                case HabboLandingViewWidgets.BONUS_RARE:
                    widget = new BonusRareWidget(landingView);
                    break;
            }
            return widget;
        }
    }
}
