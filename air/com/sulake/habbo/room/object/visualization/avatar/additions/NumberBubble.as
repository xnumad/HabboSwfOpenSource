//com.sulake.habbo.room.object.visualization.avatar.additions.NumberBubble

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class NumberBubble implements IAvatarAddition {

        private var _id:int;
        private var _avatar:AvatarVisualization;
        private var _asset:BitmapDataAsset;
        private var _scale:Number;
        private var _number:int;
        private var _numberValueFadeDirection:int;
        private var _numberValueMoving:Boolean;
        private var _numberValueMoveCounter:int;

        public function NumberBubble(k:int, _arg_2:int, _arg_3:AvatarVisualization);

        public function get id():int;

        public function get disposed():Boolean;

        public function dispose():void;

        public function update(k:IRoomObjectSprite, _arg_2:Number):void;

        public function animate(k:IRoomObjectSprite):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

