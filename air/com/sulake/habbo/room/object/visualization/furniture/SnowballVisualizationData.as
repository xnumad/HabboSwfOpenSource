//com.sulake.habbo.room.object.visualization.furniture.SnowballVisualizationData

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.core.assets.IAssetLibrary;

    public class SnowballVisualizationData implements IRoomObjectVisualizationData {

        private var _assets:IAssetLibrary;

        public function SnowballVisualizationData();

        public function dispose():void;

        public function initialize(k:XML):Boolean;

        public function set assets(k:IAssetLibrary):void;

        public function get assets():IAssetLibrary;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

