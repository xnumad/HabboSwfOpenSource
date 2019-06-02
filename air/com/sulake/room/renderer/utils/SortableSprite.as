//com.sulake.room.renderer.utils.SortableSprite

package com.sulake.room.renderer.utils{
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class SortableSprite {

        public static const Z_INFINITY:Number;

        public var x:int;
        public var y:int;
        public var z:Number = 0;
        public var name:String;
        public var sprite:IRoomObjectSprite;

        public function SortableSprite();

        public function dispose():void;


    }
}//package com.sulake.room.renderer.utils

