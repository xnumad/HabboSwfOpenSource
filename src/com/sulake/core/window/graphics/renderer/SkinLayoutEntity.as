package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils.IChildEntity;
    import flash.geom.Rectangle;

    public class SkinLayoutEntity implements IChildEntity 
    {
        public static const SCALE_TYPE_FIXED:uint = (0 << 0);
        public static const SCALE_TYPE_MOVE:uint = (1 << 0);
        public static const SCALE_TYPE_STRECH:uint = (1 << 1);
        public static const SCALE_TYPE_TILED:uint = (1 << 2);
        public static const SCALE_TYPE_CENTER:uint = (1 << 3);

        private var _id:uint;
        private var _name:String;
        public var color:uint;
        public var blend:uint;
        public var scaleH:uint;
        public var scaleV:uint;
        public var region:Rectangle;
        public var colorize:Boolean;

        public function SkinLayoutEntity(id:uint, name:String)
        {
            this._id = id;
            this._name = name;
        }

        public function get id():uint
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get tags():Array
        {
            return null;
        }

        public function dispose():void
        {
            this.region = null;
        }
    }
}
