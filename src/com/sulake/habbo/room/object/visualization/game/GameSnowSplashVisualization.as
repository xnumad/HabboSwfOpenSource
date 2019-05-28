package com.sulake.habbo.room.object.visualization.game
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.GameObjectVisualization;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class GameSnowSplashVisualization extends RoomObjectSpriteVisualization 
    {
        private static const FRAME_ASSET_NAMES:Array = ["snowball_splash_1", "snowball_splash_2", "snowball_splash_3"];

        private var _frameNumber:int = 0;
        private var _data:GameObjectVisualization;


        public function get _Str_22837():Boolean
        {
            return !(this._frameNumber < FRAME_ASSET_NAMES.length);
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            var _local_2:BitmapDataAsset;
            this._data = (k as GameObjectVisualization);
            createSprites(1);
            _local_2 = (this._data.assets.getAssetByName(FRAME_ASSET_NAMES[this._frameNumber]) as BitmapDataAsset);
            getSprite(0).asset = (_local_2.content as BitmapData);
            return true;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            this._frameNumber++;
            getSprite(0).asset = ((this._Str_22837) ? null : (this._data.assets.getAssetByName(FRAME_ASSET_NAMES[this._frameNumber]).content as BitmapData));
        }
    }
}
