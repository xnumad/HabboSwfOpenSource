//com.sulake.habbo.room.object.visualization.furniture.FurnitureExternalImageVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.display.BitmapData;

    public class FurnitureExternalImageVisualization extends ExternalIsometricImageFurniVisualization {

        private var _baseUrl:String;
        private var _url:String;

        public function FurnitureExternalImageVisualization():void;

        override public function set externalBaseUrl(k:String):void;

        override protected function getThumbnailURL():String;

        override public function getImage(k:int, _arg_2:int):BitmapData;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

