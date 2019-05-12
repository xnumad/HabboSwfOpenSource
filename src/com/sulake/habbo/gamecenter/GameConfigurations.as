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
        private static var _Str_3765:Vector.<GameConfiguration> = new Vector.<GameConfiguration>();
        private static var _Str_2516:Map = new Map();
        private static var _Str_11787:Boolean;
        private static var _Str_10256:Boolean;


        public static function _Str_22766():void
        {
            _Str_3765 = new Vector.<GameConfiguration>();
        }

        public static function _Str_23671():void
        {
            _Str_2516 = new Map();
        }

        public static function _Str_24586(k:GameConfiguration):void
        {
            _Str_3765.push(k);
        }

        public static function _Str_25778(k:int, _arg_2:String):void
        {
            _Str_2516.add(_arg_2, k);
        }

        public static function _Str_10694(k:int):GameConfiguration
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_5333 == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public static function _Str_16739():Array
        {
            var _local_2:GameConfiguration;
            var k:Array = new Array();
            for each (_local_2 in _Str_3765)
            {
                k.push(_local_2._Str_5333);
            }
            return k;
        }

        public static function getId(k:String):int
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_9827 == k)
                {
                    return _local_2._Str_5333;
                }
            }
            return -1;
        }

        public static function _Str_3077(k:int):String
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_5333 == k)
                {
                    return _local_2._Str_9827;
                }
            }
            return null;
        }

        public static function _Str_24432(k:int):Boolean
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_5333 == k)
                {
                    return true;
                }
            }
            return false;
        }

        public static function getBgColor(k:int):uint
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_5333 == k)
                {
                    return _local_2.bgColor;
                }
            }
            return 4287878387;
        }

        public static function _Str_24098(k:int):uint
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_5333 == k)
                {
                    return _local_2.textColor;
                }
            }
            return 0;
        }

        public static function _Str_22612(k:int):String
        {
            var _local_2:GameConfiguration;
            for each (_local_2 in _Str_3765)
            {
                if (_local_2._Str_5333 == k)
                {
                    return _local_2._Str_14248;
                }
            }
            return null;
        }

        public static function _Str_9843(k:int, _arg_2:String):String
        {
            var _local_3:GameConfiguration = _Str_10694(k);
            if (!_local_3)
            {
                return "";
            }
            var _local_4:String = _local_3._Str_15765;
            _local_4 = (_local_4 + _local_3._Str_9827);
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

        public static function _Str_21861(k:String):Boolean
        {
            return !(_Str_2516.getKeys().indexOf(k) == -1);
        }

        public static function _Str_21365(k:String):String
        {
            var _local_2:int = _Str_2516.getValue(k);
            var _local_3:GameConfiguration = _Str_10694(_local_2);
            if (!_local_3)
            {
                return ("${image.library.url}album1584/" + k) + ".gif";
            }
            return ((_local_3._Str_15765 + k) + _PNG).toLowerCase();
        }

        public static function _Str_25326(k:IEventDispatcher):void
        {
            _Str_11787 = true;
            _Str_13446(k);
        }

        public static function _Str_24939(k:IEventDispatcher):void
        {
            _Str_10256 = true;
            _Str_13446(k);
        }

        public static function get _Str_3961():Boolean
        {
            return (_Str_11787) && (_Str_10256);
        }

        public static function set _Str_3961(k:Boolean):void
        {
            _Str_11787 = k;
            _Str_10256 = k;
        }

        private static function _Str_13446(k:IEventDispatcher):void
        {
            if (_Str_3961)
            {
                k.dispatchEvent(new GameCenterEvent(GameCenterEvent.GAME_CONFIGURATIONS_INITIALIZED));
            }
        }
    }
}
