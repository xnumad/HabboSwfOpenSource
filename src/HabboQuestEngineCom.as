package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboQuestEngineBootstrap;
    import com.sulake.iid.IIDHabboQuestEngine;
    import images.*;
    import binaryData.*;

    public class HabboQuestEngineCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboQuestEngineCom_manifest;
        public static var requiredClasses:Array = new Array(HabboQuestEngineBootstrap, IIDHabboQuestEngine);
        public static const icon_quest_hidden:Class = HabboQuestEngineCom_icon_quest_hidden;
        public static const Campaign:Class = HabboQuestEngineCom_Campaign;
        public static const CampaignCompleted:Class = HabboQuestEngineCom_CampaignCompleted;
        public static const EntryArrows:Class = HabboQuestEngineCom_EntryArrows;
        public static const QuestEntry:Class = HabboQuestEngineCom_QuestEntry;
        public static const Quest:Class = HabboQuestEngineCom_Quest;
        public static const QuestDetails:Class = HabboQuestEngineCom_QuestDetails;
        public static const Quests:Class = HabboQuestEngineCom_Quests;
        public static const QuestTracker:Class = HabboQuestEngineCom_QuestTracker;
        public static const QuestCompletedDialog:Class = HabboQuestEngineCom_QuestCompletedDialog;
        public static const QuestHelp:Class = HabboQuestEngineCom_QuestHelp;
        public static const AchievementCategory:Class = HabboQuestEngineCom_AchievementCategory;
        public static const Achievements:Class = HabboQuestEngineCom_Achievements;
        public static const AchievementsResolutions:Class = HabboQuestEngineCom_AchievementsResolutions;
        public static const AchievementResolutionProgress:Class = HabboQuestEngineCom_AchievementResolutionProgress;
        public static const AchievementResolutionCompleted:Class = HabboQuestEngineCom_AchievementResolutionCompleted;
        public static const Achievement:Class = HabboQuestEngineCom_Achievement;
        public static const AchievementSimple:Class = HabboQuestEngineCom_AchievementSimple;
        public static const ProgressBar:Class = HabboQuestEngineCom_ProgressBar;
        public static const NextQuestTimer:Class = HabboQuestEngineCom_NextQuestTimer;
        public static const SeasonalCalendar:Class = HabboQuestEngineCom_SeasonalCalendar;
        public static const RoomCompetition:Class = HabboQuestEngineCom_RoomCompetition;
        public static const calendar_quest_complete:Class = HabboQuestEngineCom_calendar_quest_complete;
        public static const arrow_back_active:Class = HabboQuestEngineCom_arrow_back_active;
        public static const arrow_back_inactive:Class = HabboQuestEngineCom_arrow_back_inactive;
        public static const arrow_back_hilite:Class = HabboQuestEngineCom_arrow_back_hilite;
        public static const arrow_next_active:Class = HabboQuestEngineCom_arrow_next_active;
        public static const arrow_next_inactive:Class = HabboQuestEngineCom_arrow_next_inactive;
        public static const arrow_next_hilite:Class = HabboQuestEngineCom_arrow_next_hilite;
        public static const stripe_mask_L:Class = HabboQuestEngineCom_stripe_mask_L;
        public static const stripe_mask_R:Class = HabboQuestEngineCom_stripe_mask_R;
    }
}
