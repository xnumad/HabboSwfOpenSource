//com.sulake.habbo.gamecenter.GameConfigurations

package com.sulake.habbo.gamecenter{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import flash.events.IEventDispatcher;

    public class GameConfigurations {

        private static const GAME_ICON_POSTFIX:String;
        private static const GAME_SMALL_ICON_POSTFIX:String;
        private static const GAME_LOGO_POSTFIX:String;
        private static const GAME_THEME_POSTFIX:String;
        private static const GAME_ASSET_FILE_TYPE:String;
        private static var _games:Vector.<GameConfiguration>;
        private static var _badges:Map;
        private static var _gameListInitialized:Boolean;
        private static var _gameAchievementsInitialized:Boolean;

        public function GameConfigurations();

        public static function resetGames():void;

        public static function resetBadges():void;

        public static function addGame(k:GameConfiguration):void;

        public static function addGameAchievementBadge(k:int, _arg_2:String):void;

        public static function getGame(k:int):GameConfiguration;

        public static function gameIds():Array;

        public static function getId(k:String):int;

        public static function getNameId(k:int):String;

        public static function isGameEnabled(k:int):Boolean;

        public static function getBgColor(k:int):uint;

        public static function getTextColor(k:int):uint;

        public static function getSupportUrl(k:int):String;

        public static function getAssetUrl(k:int, _arg_2:String):String;

        public static function isGameBadge(k:String):Boolean;

        public static function getBadgeImageUri(k:String):String;

        public static function setGameListInitialized(k:IEventDispatcher):void;

        public static function setGameAchievementsInitialized(k:IEventDispatcher):void;

        public static function get initialized():Boolean;

        public static function set initialized(k:Boolean):void;

        private static function checkInitialization(k:IEventDispatcher):void;


    }
}//package com.sulake.habbo.gamecenter

