//com.sulake.habbo.room.object.visualization.game.SnowSplashVisualization

package com.sulake.habbo.room.object.visualization.game{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.SnowballVisualizationData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class SnowSplashVisualization extends RoomObjectSpriteVisualization {

        private static const FRAME_ASSET_NAMES:Array;

        private var _frameNumber:int;
        private var _data:SnowballVisualizationData;

        public function SnowSplashVisualization();

        public function get isDone():Boolean;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.game

