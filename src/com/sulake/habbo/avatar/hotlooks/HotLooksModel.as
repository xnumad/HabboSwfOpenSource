package com.sulake.habbo.avatar.hotlooks
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.wardrobe.Outfit;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.assets.XmlAsset;
    import flash.events.Event;
    import com.sulake.habbo.avatar.common.CategoryData;
    import com.sulake.habbo.avatar.figuredata.*;

    public class HotLooksModel extends CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        public static const HOT_LOOKS:String = "hot_looks";
        public static const MY_LOOKS:String = "my_looks";
        private static const _Str_18333:int = 20;

        private var _hotLooks:Dictionary;

        public function HotLooksModel(k:HabboAvatarEditor)
        {
            super(k);
            this._hotLooks = new Dictionary();
            this._hotLooks[FigureData.M] = new Array();
            this._hotLooks[FigureData.F] = new Array();
            this._hotLooks[(FigureData.M + ".index")] = 0;
            this._hotLooks[(FigureData.F + ".index")] = 0;
            this._Str_24688();
        }

        override public function dispose():void
        {
            super.dispose();
            this._hotLooks = null;
        }

        override protected function init():void
        {
            if (!_Str_2271)
            {
                _Str_2271 = new HotLooksView(this);
            }
            _Str_2271.init();
            _Str_2367 = true;
        }

        public function _Str_24318(k:int):void
        {
            var _local_2:Array = this._hotLooks[_Str_2278.gender];
            var _local_3:Outfit = _local_2[k];
            if (_local_3 != null)
            {
                if (_local_3.figure == "")
                {
                    return;
                }
                _Str_2278.loadAvatarInEditor(_local_3.figure, _local_3.gender, _Str_2278.clubMemberLevel);
            }
        }

        public function get _Str_24788():Array
        {
            return this._hotLooks[_Str_2278.gender];
        }

        private function _Str_24688():void
        {
            var k:String = _Str_2278.manager.getProperty("avatareditor.promohabbos");
            var _local_2:URLRequest = new URLRequest(k);
            var _local_3:AssetLoaderStruct = _Str_2278.manager.assets.loadAssetFromFile("hotLooksConfiguration", _local_2, "text/xml");
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_23272);
        }

        private function _Str_23272(event:Event=null):void
        {
            var habbos:XML;
            var processedHotLooks:int;
            var habbo:XML;
            var hotLook:Outfit;
            var loaderStruct:AssetLoaderStruct = (event.target as AssetLoaderStruct);
            if (loaderStruct == null)
            {
                return;
            }
            var xmlAsset:XmlAsset = (_Str_2278.manager.assets.getAssetByName("hotLooksConfiguration") as XmlAsset);
            if (xmlAsset != null)
            {
                try
                {
                    habbos = (xmlAsset.content as XML);
                    processedHotLooks = 0;
                    for each (habbo in habbos.habbo)
                    {
                        if (processedHotLooks > _Str_18333)
                        {
                            break;
                        }
                        hotLook = new Outfit(_Str_2278, habbo.@figure, habbo.@gender);
                        (this._hotLooks[hotLook.gender] as Array).push(hotLook);
                        processedHotLooks = (processedHotLooks + 1);
                    }
                }
                catch(e:Error)
                {
                }
            }
        }

        override public function switchCategory(k:String=""):void
        {
        }

        override public function getCategoryData(k:String):CategoryData
        {
            return null;
        }

        override public function selectPart(k:String, _arg_2:int):void
        {
        }
    }
}
