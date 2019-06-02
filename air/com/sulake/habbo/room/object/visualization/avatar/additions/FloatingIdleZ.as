//com.sulake.habbo.room.object.visualization.avatar.additions.FloatingIdleZ

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FloatingIdleZ implements IAvatarAddition {

        private static const DELAY_BEFORE_ANIMATION:int;
        private static const DELAY_PER_FRAME:int;
        private static const STATE_DELAY:int;
        private static const STATE_FRAME_A:int;
        private static const STATE_FRAME_B:int;
        private static var _assetNamesLeft:Array;
        private static var _assetNamesRight:Array;

        protected var _id:int;
        protected var _avatar:AvatarVisualization;
        private var _asset:BitmapDataAsset;
        private var _startTime:int;
        private var _offsetY:int;
        private var _scale:Number;
        private var _state:int;

        public function FloatingIdleZ(k:int, _arg_2:AvatarVisualization);

        public function get id():int;

        public function get disposed():Boolean;

        public function dispose():void;

        protected function getAssetNameForFrame(k:int):String;

        public function animate(k:IRoomObjectSprite):Boolean;

        public function update(k:IRoomObjectSprite, _arg_2:Number):void;


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

