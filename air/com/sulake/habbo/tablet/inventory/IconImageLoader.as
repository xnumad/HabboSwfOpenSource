//com.sulake.habbo.tablet.inventory.IconImageLoader

package com.sulake.habbo.tablet.inventory{
    import feathers.controls.ImageLoader;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IRoomContentLoaderUrl;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotData;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
    import com.sulake.core.utils.IFileProxy;
    import com.sulake.habbo.tablet.inventory.items.GroupItem;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.display.BitmapData;

    public class IconImageLoader extends ImageLoader implements IGetImageListener, IAvatarImageListener, IDisposable {

        private var _inventory:HabboTabletInventory;
        private var _cacheUrlData:IRoomContentLoaderUrl;
        private var _botData:BotData;
        private var _petData:PetData;
        private var _isDisposed:Boolean;

        public function IconImageLoader(k:HabboTabletInventory);

        private function get fileProxy():IFileProxy;

        private function getCacheFilePath(k:String, _arg_2:int, _arg_3:String):String;

        override public function dispose():void;

        public function set iconSource(k:GroupItem):void;

        public function set petSource(k:PetData):void;

        public function set botSource(k:BotData):void;

        override protected function rawDataLoader_completeHandler(k:Event):void;

        override protected function loader_completeHandler(k:Event):void;

        private function addToCache(k:ByteArray):void;

        private function getPetImage(k:PetData):BitmapData;

        private function getBotImage(k:BotData):BitmapData;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        public function avatarImageReady(k:String):void;

        public function setImage(k:BitmapData):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.tablet.inventory

