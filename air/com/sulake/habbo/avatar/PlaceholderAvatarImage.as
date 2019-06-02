//com.sulake.habbo.avatar.PlaceholderAvatarImage

package com.sulake.habbo.avatar{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import flash.display.BitmapData;

    public class PlaceholderAvatarImage extends AvatarImage {

        static var _fullImageCache:Map;

        public function PlaceholderAvatarImage(k:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String);

        override public function dispose():void;

        override public function disposeInactiveActionCache():void;

        override protected function getFullImage(k:String):BitmapData;

        override protected function cacheFullImage(k:String, _arg_2:BitmapData):void;

        override public function appendAction(k:String, ... _args):Boolean;

        override public function isPlaceholder():Boolean;


    }
}//package com.sulake.habbo.avatar

