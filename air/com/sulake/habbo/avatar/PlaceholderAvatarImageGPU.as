//com.sulake.habbo.avatar.PlaceholderAvatarImageGPU

package com.sulake.habbo.avatar{
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;

    public class PlaceholderAvatarImageGPU extends AvatarImageGPU {

        public function PlaceholderAvatarImageGPU(k:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String);

        override public function dispose():void;

        override public function disposeInactiveActionCache():void;

        override public function appendAction(k:String, ... _args):Boolean;

        override public function isPlaceholder():Boolean;


    }
}//package com.sulake.habbo.avatar

