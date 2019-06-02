//com.sulake.habbo.room.object.visualization.avatar.additions.FloatingHeart

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FloatingHeart extends ExpressionAddition {

        private static const DELAY_BEFORE_ANIMATION:int;
        private static const STATE_DELAY:int;
        private static const STATE_FADE_IN:int;
        private static const STATE_FLOAT:int;
        private static const STATE_COMPLETE:int;

        private var _asset:BitmapDataAsset;
        private var _startTime:int;
        private var _delta:Number = 0;
        private var _offsetY:int;
        private var _scale:Number;
        private var _state:int;

        public function FloatingHeart(k:int, _arg_2:int, _arg_3:AvatarVisualization);

        override public function animate(k:IRoomObjectSprite):Boolean;

        override public function update(k:IRoomObjectSprite, _arg_2:Number):void;


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

