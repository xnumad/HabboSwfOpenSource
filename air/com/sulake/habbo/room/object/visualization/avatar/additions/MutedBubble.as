//com.sulake.habbo.room.object.visualization.avatar.additions.MutedBubble

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class MutedBubble implements IAvatarAddition {

        private var _id:int;
        private var _asset:BitmapDataAsset;
        private var _avatar:AvatarVisualization;
        private var _relativeDepth:Number = 0;

        public function MutedBubble(k:int, _arg_2:AvatarVisualization);

        public function set relativeDepth(k:Number):void;

        public function get id():int;

        public function get disposed():Boolean;

        public function dispose():void;

        public function animate(k:IRoomObjectSprite):Boolean;

        public function update(k:IRoomObjectSprite, _arg_2:Number):void;


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

