//com.sulake.habbo.room.object.visualization.game.SnowballVisualization

package com.sulake.habbo.room.object.visualization.game{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.SnowballVisualizationData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class SnowballVisualization extends RoomObjectSpriteVisualization {

        private static const SNOWBALL_ASSET_NAME:String;
        private static const SNOWBALL_SHADOW_ASSET_NAME:String;
        private static const Z_SCALE:int;

        private var _data:SnowballVisualizationData;
        private var _shadowSprite:IRoomObjectSprite;

        public function SnowballVisualization();

        override public function dispose():void;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.game

