package com.sulake.habbo.avatar.alias
{
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.AvatarRenderManager;
    import com.sulake.core.assets.IAsset;

    public class AssetAliasCollection 
    {
        private var _assets:AssetLibraryCollection;
        private var _aliases:Dictionary;
        private var _avatarRenderManager:AvatarRenderManager;
        private var _missingAssetNames:Array;

        public function AssetAliasCollection(k:AvatarRenderManager, _arg_2:AssetLibraryCollection)
        {
            this._avatarRenderManager = k;
            this._aliases = new Dictionary();
            this._assets = _arg_2;
            this._missingAssetNames = [];
        }

        public function dispose():void
        {
            this._assets = null;
            this._aliases = null;
        }

        public function reset():void
        {
            this.init();
        }

        public function init():void
        {
            var _local_2:XML;
            var _local_3:XML;
            var _local_4:String;
            var _local_5:AssetAlias;
            var k:Array = this._assets.getManifests();
            for each (_local_2 in k)
            {
                for each (_local_3 in _local_2..alias)
                {
                    _local_4 = String(_local_3.@name);
                    _local_5 = new AssetAlias(_local_3);
                    this._aliases[_local_4] = _local_5;
                }
            }
        }

        public function each(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void
        {
            var _local_5:XML = <alias name="" link="" fliph="0" flipv="0"/>
            ;
            _local_5.@name = k;
            _local_5.@link = _arg_2;
            var _local_6:AssetAlias = new AssetAlias(_local_5);
            this._aliases[k] = _local_6;
        }

        public function hasAlias(k:String):Boolean
        {
            var _local_2:AssetAlias = (this._aliases[k] as AssetAlias);
            return !(_local_2 == null);
        }

        public function getAliasByName(k:String):String
        {
            var _local_4:AssetAlias;
            var _local_2:String = k;
            var _local_3:int = 5;
            while (((this.hasAlias(_local_2)) && (_local_3 >= 0)))
            {
                _local_4 = (this._aliases[_local_2] as AssetAlias);
                _local_2 = _local_4.link;
                _local_3--;
            }
            return _local_2;
        }

        public function getAssetByName(k:String):IAsset
        {
            k = this.getAliasByName(k);
            var _local_2:IAsset = this._assets.getAssetByName(k);
            return _local_2;
        }
    }
}
