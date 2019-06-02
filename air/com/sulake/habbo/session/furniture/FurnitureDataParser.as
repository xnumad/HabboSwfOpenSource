//com.sulake.habbo.session.furniture.FurnitureDataParser

package com.sulake.habbo.session.furniture{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.habbo.session.SessionDataManager;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class FurnitureDataParser extends EventDispatcherWrapper {

        public static const READY:String;

        private var _floorItems:Map;
        private var _wallItems:Map;
        private var _itemIds:Map;
        private var _assetLib:AssetLibrary;
        private var _context:SessionDataManager;

        public function FurnitureDataParser(k:SessionDataManager, _arg_2:Map, _arg_3:Map, _arg_4:Map);

        override public function dispose():void;

        public function loadData(k:String):void;

        private function parseFurnitureData(k:AssetLoaderEvent):void;

        private function parseXmlFormat(k:String):void;

        private function parseFloorItem(k:XML):FurnitureData;

        private function parseWallItem(k:XML):FurnitureData;

        private function parseLingoFormat(k:String):void;

        private function storeItem(k:FurnitureData):void;

        private function furnitureDataError(k:AssetLoaderEvent):void;

        private function registerFurnitureLocalization(k:FurnitureData):void;

        private function removePatternFrom(k:Array, _arg_2:Object):void;


    }
}//package com.sulake.habbo.session.furniture

