//com.sulake.habbo.room.object.visualization.furniture.ExternalIsometricImageFurniVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.events.IOErrorEvent;
    import flash.events.Event;

    public class ExternalIsometricImageFurniVisualization extends IsometricImageFurniVisualization {

        private var _thumbnailUrl:String;

        public function ExternalIsometricImageFurniVisualization();

        private static function onThumbnailError(k:IOErrorEvent):void;


        override protected function updateModel(k:Number):Boolean;

        protected function getThumbnailURL():String;

        private function onThumbnailLoaded(k:Event):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

