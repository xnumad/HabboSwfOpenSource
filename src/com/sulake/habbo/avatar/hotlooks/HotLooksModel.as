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
        private static const MAXIMUM_HOT_LOOKS:int = 20;

        private var _hotLooks:Dictionary;

        public function HotLooksModel(k:HabboAvatarEditor)
        {
            super(k);
            this._hotLooks = new Dictionary();
            this._hotLooks[FigureData.M] = new Array();
            this._hotLooks[FigureData.F] = new Array();
            this._hotLooks[(FigureData.M + ".index")] = 0;
            this._hotLooks[(FigureData.F + ".index")] = 0;
            this.requestHotLooks();
        }

        override public function dispose():void
        {
            super.dispose();
            this._hotLooks = null;
        }

        override protected function init():void
        {
            if (!_view)
            {
                _view = new HotLooksView(this);
            }
            _view.init();
            _isInitialized = true;
        }

        public function selectHotLook(k:int):void
        {
            var _local_2:Array = this._hotLooks[_controller.gender];
            var _local_3:Outfit = _local_2[k];
            if (_local_3 != null)
            {
                if (_local_3.figure == "")
                {
                    return;
                }
                _controller.loadAvatarInEditor(_local_3.figure, _local_3.gender, _controller.clubMemberLevel);
            }
        }

        public function get hotLooks():Array
        {
            return this._hotLooks[_controller.gender];
        }

        private function requestHotLooks():void
        {
            var k:String = _controller.manager.getProperty("avatareditor.promohabbos");
            var _local_2:URLRequest = new URLRequest(k);
            var _local_3:AssetLoaderStruct = _controller.manager.assets.loadAssetFromFile("hotLooksConfiguration", _local_2, "text/xml");
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onHotLooksConfiguration);
        }

        private function onHotLooksConfiguration(event:Event=null):void
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
            var xmlAsset:XmlAsset = (_controller.manager.assets.getAssetByName("hotLooksConfiguration") as XmlAsset);
            if (xmlAsset != null)
            {
                try
                {
                    habbos = (xmlAsset.content as XML);
                    processedHotLooks = 0;
                    for each (habbo in habbos.habbo)
                    {
                        if (processedHotLooks > MAXIMUM_HOT_LOOKS)
                        {
                            break;
                        }
                        hotLook = new Outfit(_controller, habbo.@figure, habbo.@gender);
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
