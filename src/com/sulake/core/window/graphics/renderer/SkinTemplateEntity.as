package com.sulake.core.window.graphics.renderer
{
    import flash.geom.Rectangle;

    public class SkinTemplateEntity implements ISkinTemplateEntity 
    {
        protected var _id:uint;
        protected var _name:String;
        protected var _type:String;
        protected var _rect:Rectangle;

        public function SkinTemplateEntity(name:String, type:String, id:uint, rect:Rectangle)
        {
            this._id = id;
            this._name = name;
            this._type = type;
            this._rect = rect;
        }

        public function get id():uint
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get region():Rectangle
        {
            return this._rect;
        }
    }
}
