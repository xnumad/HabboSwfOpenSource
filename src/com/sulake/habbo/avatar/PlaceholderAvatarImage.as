package com.sulake.habbo.avatar
{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.enum.AvatarAction;

    public class PlaceholderAvatarImage extends AvatarImage 
    {
        internal static var CACHE:Map = new Map();

        public function PlaceholderAvatarImage(k:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String, _arg_5:EffectAssetDownloadManager)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, null);
        }

        override public function dispose():void
        {
            if (!_Str_580)
            {
                if (_Str_586)
                {
                    _Str_586.dispose();
                    _Str_586 = null;
                }
                _Str_581 = null;
                _assets = null;
                _Str_1708 = null;
                _figure = null;
                _Str_2121 = null;
                _Str_614 = null;
                if (((!(_Str_1586)) && (_Str_671)))
                {
                    _Str_671.dispose();
                }
                _Str_671 = null;
                _Str_903 = null;
                _Str_580 = true;
            }
        }

        override protected function getFullImage(k:String):BitmapData
        {
            return CACHE[k];
        }

        override protected function cacheFullImage(k:String, _arg_2:BitmapData):void
        {
            if (CACHE.getValue(k))
            {
                (CACHE.getValue(k) as BitmapData).dispose();
                CACHE.remove(k);
            }
            CACHE[k] = _arg_2;
        }

        override public function appendAction(k:String, ... _args):Boolean
        {
            var _local_3:String;
            if (((!(_args == null)) && (_args.length > 0)))
            {
                _local_3 = _args[0];
            }
            switch (k)
            {
                case AvatarAction.POSTURE:
                    switch (_local_3)
                    {
                        case AvatarAction.POSTURE_LAY:
                        case AvatarAction.POSTURE_WALK:
                        case AvatarAction.POSTURE_STAND:
                        case AvatarAction.POSTURE_SWIM:
                        case AvatarAction.POSTURE_FLOAT:
                        case AvatarAction.POSTURE_SIT:
                            super.appendAction.apply(null, [k].concat(_args));
                            break;
                    }
                    break;
                case AvatarAction.EFFECT:
                case AvatarAction.DANCE:
                case AvatarAction.EXPRESSION_WAVE:
                case AvatarAction.SIGN:
                case AvatarAction.CARRY_OBJECT:
                case AvatarAction.USE_OBJECT:
                case AvatarAction.EXPRESSION_BLOW_A_KISS:
                    super.addActionData.apply(null, [k].concat(_args));
                    break;
            }
            return true;
        }

        override public function isPlaceholder():Boolean
        {
            return true;
        }
    }
}
