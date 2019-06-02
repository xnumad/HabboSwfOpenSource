//com.sulake.habbo.room.object.visualization.avatar.additions.GameClickTarget

package com.sulake.habbo.room.object.visualization.avatar.additions{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class GameClickTarget implements IAvatarAddition {

        private static const WIDTH:int;
        private static const HEIGHT:int;
        private static const OFFSET_X:int;
        private static const OFFSET_Y:int;

        private var _id:int;
        private var _bitmap:BitmapData;
        private var _disposed:Boolean;

        public function GameClickTarget(k:int);

        public function get id():int;

        public function get disposed():Boolean;

        public function dispose():void;

        public function animate(k:IRoomObjectSprite):Boolean;

        public function update(k:IRoomObjectSprite, _arg_2:Number):void;


    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

