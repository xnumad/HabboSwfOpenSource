//com.sulake.habbo.room.object.visualization.avatar.additions.ExpressionAddition

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class ExpressionAddition implements IExpressionAddition {

        protected var _id:int;
        protected var _avatar:AvatarVisualization;
        private var _type:int;

        public function ExpressionAddition(k:int, _arg_2:int, _arg_3:AvatarVisualization);

        public function get type():int;

        public function get id():int;

        public function get disposed():Boolean;

        public function dispose():void;

        public function update(k:IRoomObjectSprite, _arg_2:Number):void;

        public function animate(k:IRoomObjectSprite):Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

