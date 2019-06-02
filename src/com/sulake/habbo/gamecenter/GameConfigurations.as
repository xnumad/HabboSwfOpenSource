package com.sulake.habbo.gamecenter
{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.game.GameAssetEnum;
    import flash.events.IEventDispatcher;
    import __AS3__.vec.*;

    public class GameConfigurations 
    {
        private static const _ICON:String = "_icon";
        private static const _SMALL_ICON:String = "_small_icon";
        private static const _LOGO:String = "_logo";
        private static const _THEME:String = "_theme";
        private static const _PNG:String = ".png";
        private static var _games:Vector.<GameConfiguration> = new Vector.<GameConfiguration>();
        private static var _badges:Map = new Map();
        private static var _gameListInitialized:Boolean;
        private static var _gameAchievementsInitialized:Boolean;


        public static function resetGames():void
        {
            _games = new Vector.<GameConfiguration>();
        }

        public static function resetBadges():void
        {
            _badges = new Map();
        }

        public static function addGame(k:GameConfiguration):void
        {
            _games.push(k);
        }

        public static function addGameAchievementBadge(k:int, _arg_2:String):void
        {
            _badges.add(_arg_2, k);
        }

        public static function getGame(k:int):GameConfiguration
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public static function gameIds():Array
        {
            var _local_2:GameConfiguration;
            var k:Array = new Array();
            for each (_local_2 in _games)
            {
                k.push(_local_2.gameId);
            }
            return k;
        }

        public static function getId(k:String):int
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameNameId == k)
                {
                    return _local_2.gameId;
                }
            }
            return -1;
        }

        public static function getNameId(k:int):String
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameId == k)
                {
                    return _local_2.gameNameId;
                }
            }
            return null;
        }

        public static function isGameEnabled(k:int):Boolean
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameId == k)
                {
                    return true;
                }
            }
            return false;
        }

        public static function getBgColor(k:int):uint
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameId == k)
                {
                    return _local_2.bgColor;
                }
            }
            return 4287878387;
        }

        public static function getTextColor(k:int):uint
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameId == k)
                {
                    return _local_2.textColor;
                }
            }
            return 0;
        }

        public static function getSupportUrl(k:int):String
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _games)
            {
                if (_local_2.gameId == k)
                {
                    return _local_2.supportUrl;
                }
            }
            return null;
        }

        public static function getAssetUrl(k:int, _arg_2:String):String
        {
            var _local_3:GameConfiguration = getGame(k);
            if (!_local_3)
            {
                return "";
            }
            var _local_4:String = _local_3.assetUrl;
            _local_4 = (_local_4 + _local_3.gameNameId);
            switch (_arg_2)
            {
                case GameAssetEnum.ICON:
                    _local_4 = (_local_4 + _ICON);
                    break;
                case GameAssetEnum.SMALL_ICON:
                    _local_4 = (_local_4 + _SMALL_ICON);
                    break;
                case GameAssetEnum.LOGO:
                    _local_4 = (_local_4 + _LOGO);
                    break;
                case GameAssetEnum.THEME:
                    _local_4 = (_local_4 + _THEME);
                    break;
            }
            _local_4 = (_local_4 + _PNG);
            return _local_4;
        }

        public static function isGameBadge(k:String):Boolean
        {
            return !(_badges.getKeys().indexOf(k) == -1);
        }

        public static function getBadgeImageUri(k:String):String
        {
            var _local_2:int = _badges.getValue(k);
            var _local_3:GameConfiguration = getGame(_local_2);
            if (!_local_3)
            {
                return ("${image.library.url}album1584/" + k) + ".gif";
            }
            return ((_local_3.assetUrl + k) + _PNG).toLowerCase();
        }

        public static function setGameListInitialized(k:IEventDispatcher):void
        {
            _gameListInitialized = true;
            checkInitialization(k);
        }

        public static function setGameAchievementsInitialized(k:IEventDispatcher):void
        {
            _gameAchievementsInitialized = true;
            checkInitialization(k);
        }

        public static function get _Str_3961():Boolean
        {
            return (_gameListInitialized) && (_gameAchievementsInitialized);
        }

        public static function set _Str_3961(k:Boolean):void
        {
            _gameListInitialized = k;
            _gameAchievementsInitialized = k;
        }

        private static function checkInitialization(k:IEventDispatcher):void
        {
            if (_Str_3961)
            {
                k.dispatchEvent(new GameCenterEvent(GameCenterEvent.GAME_CONFIGURATIONS_INITIALIZED));
            }
        }
    }
}
