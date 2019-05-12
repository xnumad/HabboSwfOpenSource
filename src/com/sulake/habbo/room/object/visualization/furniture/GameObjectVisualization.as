package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.core.assets.IAssetLibrary;

    public class GameObjectVisualization implements IRoomObjectVisualizationData 
    {
        private var _assets:IAssetLibrary;


        public function dispose():void
        {
            this._assets = null;
        }

        public function initialize(k:XML):Boolean
        {
            return true;
        }

        public function set assets(k:IAssetLibrary):void
        {
            this._assets = k;
        }

        public function get assets():IAssetLibrary
        {
            return this._assets;
        }
    }
}
