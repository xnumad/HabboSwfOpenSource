package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboGameManagerBootstrap;
    import com.sulake.iid.IIDHabboGameManager;
	import snowwar.assets.images.*;
    import snowwar.assets.binaryData.*;
    import binaryData.*;
    import images.*;

    public class HabboGamesCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboGamesCom_manifest;
        public static var game_center_view_generic_xml:Class = HabboGamesCom_game_center_view_generic_xml;
        public static var game_center_leaderboard_view_xml:Class = HabboGamesCom_game_center_leaderboard_view_xml;
        public static var game_center_teaser_view_xml:Class = HabboGamesCom_game_center_teaser_view_xml;
        public static var game_center_waiting_game_view_xml:Class = HabboGamesCom_game_center_waiting_game_view_xml;
        public static var game_achievement_entry_xml:Class = HabboGamesCom_game_achievement_entry_xml;
        public static var game_leaderboard_entry_xml:Class = HabboGamesCom_game_leaderboard_entry_xml;
        public static var game_leaderboard_entry_small_xml:Class = HabboGamesCom_game_leaderboard_entry_small_xml;
        public static const game_center_icon_selected:Class = HabboGamesCom_game_center_icon_selected;
        public static const game_center_speech_bubble:Class = HabboGamesCom_game_center_speech_bubble;
        public static const game_center_reward_star:Class = HabboGamesCom_game_center_reward_star;
        public static var game_center_lucky_loser_entry_xml:Class = HabboGamesCom_game_center_lucky_loser_entry_xml;
	
		
		/**
		 * Snowstorm
		 */
        public static const explosion0001:Class = HabboGamesCom_explosion0001;
        public static const explosion0002:Class = HabboGamesCom_explosion0002;
        public static const explosion0003:Class = HabboGamesCom_explosion0003;
        public static const explosion0004:Class = HabboGamesCom_explosion0004;
        public static const explosion0005:Class = HabboGamesCom_explosion0005;
        public static const explosion0006:Class = HabboGamesCom_explosion0006;
        public static const explosion0007:Class = HabboGamesCom_explosion0007;
        public static const explosion0008:Class = HabboGamesCom_explosion0008;
        public static const explosion0009:Class = HabboGamesCom_explosion0009;
        public static const explosion0010:Class = HabboGamesCom_explosion0010;
        public static const explosion0011:Class = HabboGamesCom_explosion0011;
        public static const explosion0012:Class = HabboGamesCom_explosion0012;
		
        public static const games_main:Class = HabboGamesCom_games_main;
        public static const instructions_list_item:Class = HabboGamesCom_instructions_list_item;
        public static const counter:Class = HabboGamesCom_counter;
        public static const figure:Class = HabboGamesCom_figure;
        public static const snowwar_ending:Class = HabboGamesCom_snowwar_ending;
        public static const snowwar_exit:Class = HabboGamesCom_snowwar_exit;
        public static const snowwar_lobby_player:Class = HabboGamesCom_snowwar_lobby_player;
        public static const snowwar_lobby_player_team_1:Class = HabboGamesCom_snowwar_lobby_player_team_1;
        public static const snowwar_lobby_player_team_2:Class = HabboGamesCom_snowwar_lobby_player_team_2;
        public static const snowwar_results_player_team_1:Class = HabboGamesCom_snowwar_results_player_team_1;
        public static const snowwar_results_player_team_2:Class = HabboGamesCom_snowwar_results_player_team_2;
        public static const snowwar_own_stats:Class = HabboGamesCom_snowwar_own_stats;
        public static const snowwar_snowballs:Class = HabboGamesCom_snowwar_snowballs;
        public static const snowwar_team_scores:Class = HabboGamesCom_snowwar_team_scores;
        public static const snowwar_timer:Class = HabboGamesCom_snowwar_timer;
        public static var snowwar_loading_background_xml:Class = HabboGamesCom_snowwar_loading_background;
        public static var snowwar_exit_confirmation:Class = HabboGamesCom_snowwar_exit_confirmation;
        public static var snowwar_leaderboard:Class = HabboGamesCom_snowwar_leaderboard;
        public static var snowwar_leaderboard_entry:Class = HabboGamesCom_snowwar_leaderboard_entry;
		
        private static var _logEnabled:Boolean = true;
        public static var requiredClasses:Array = new Array(HabboGameManagerBootstrap, IIDHabboGameManager);


        public static function set logEnabled(k:Boolean):void
        {
            _logEnabled = k;
        }

        public static function get logEnabled():Boolean
        {
            return true;
        }

        public static function log(... k):void
        {
			trace(k);
        }
    }
}
