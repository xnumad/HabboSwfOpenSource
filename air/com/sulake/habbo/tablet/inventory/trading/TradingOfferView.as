//com.sulake.habbo.tablet.inventory.trading.TradingOfferView

package com.sulake.habbo.tablet.inventory.trading{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.tablet.inventory.HabboTabletInventory;
    import feathers.controls.ImageLoader;
    import feathers.controls.Label;
    import feathers.controls.List;
    import starling.events.Event;
    import feathers.data.ListCollection;
    import feathers.controls.renderers.IListItemRenderer;
    import starling.textures.Texture;

    public class TradingOfferView extends LayoutGroup {

        private var _inventory:HabboTabletInventory;
        private var _userName:String;
        private var _headBg:ImageLoader;
        private var _headImage:ImageLoader;
        private var _title:Label;
        private var _checkMark:ImageLoader;
        private var _list:List;
        private var _lock:ImageLoader;
        private var _accepted:Boolean;

        public function TradingOfferView(k:HabboTabletInventory, _arg_2:String=null);

        private function onTitleInit(k:Event):void;

        override public function dispose():void;

        private function onListChange(k:Event):void;

        public function set listDataProvider(k:ListCollection):void;

        private function createListRenderer():IListItemRenderer;

        public function set headTexture(k:Texture):void;

        public function get selectedIndex():int;

        public function set accepted(k:Boolean):void;

        private function update():void;

        private function getLocalization(k:String):String;

        public function set userName(k:String):void;


    }
}//package com.sulake.habbo.tablet.inventory.trading

