package com.sulake.habbo.room.object.visualization.game
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.GameObjectVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class GameSnowballVisualization extends RoomObjectSpriteVisualization 
    {
        private static const SNOWBALL_SMALL_PNG:String = "snowball_small_png";
        private static const SNOWBALL_SMALL_SHADOW_PNG:String = "snowball_small_shadow_png";
        private static const _Str_18767:int = 16;

        private var _data:GameObjectVisualization;
        private var _Str_6286:IRoomObjectSprite;


        override public function dispose():void
        {
            this._Str_6286 = null;
            super.dispose();
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            var _local_2:BitmapDataAsset;
            this._data = (k as GameObjectVisualization);
            createSprites(2);
            _local_2 = (this._data.assets.getAssetByName(SNOWBALL_SMALL_PNG) as BitmapDataAsset);
            getSprite(0).asset = (_local_2.content as BitmapData);
            _local_2 = (this._data.assets.getAssetByName(SNOWBALL_SMALL_SHADOW_PNG) as BitmapDataAsset);
            this._Str_6286 = getSprite(1);
            this._Str_6286.asset = (_local_2.content as BitmapData);
            this._Str_6286.alpha = 100;
            this._Str_6286.relativeDepth = 1;
            return true;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            this._Str_6286.offsetY = (object.getLocation().z * _Str_18767);
            this._Str_6286.alpha = Math.max(0, (100 - (this._Str_6286.offsetY / 10)));
        }
    }
}
