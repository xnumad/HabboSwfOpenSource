//com.sulake.habbo.avatar.alias.AssetAliasCollection

package com.sulake.habbo.avatar.alias{
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarRenderManager;
    import com.sulake.core.assets.IAsset;

    public class AssetAliasCollection {

        private var _assets:AssetLibraryCollection;
        private var _aliases:Dictionary;
        private var _avatarRenderManager:AvatarRenderManager;
        private var _missingAssetNames:Array;
        private var _handledLibNames:Array;

        public function AssetAliasCollection(k:AvatarRenderManager, _arg_2:AssetLibraryCollection);

        public function dispose():void;

        public function reset():void;

        public function updateAliases():void;

        public function addAlias(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void;

        public function hasAlias(k:String):Boolean;

        public function getAliasByName(k:String):AssetAlias;

        public function getAssetByName(k:String):IAsset;


    }
}//package com.sulake.habbo.avatar.alias

