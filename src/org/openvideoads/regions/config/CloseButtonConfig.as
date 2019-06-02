package org.openvideoads.regions.config
{
    import org.openvideoads.base.Debuggable;

    public class CloseButtonConfig extends Debuggable 
    {
        protected var _type:String = "crosshair";
        protected var _color:String = "#FFFFFF";
        protected var _Str_2699:Boolean = true;
        protected var _Str_8441:String = null;
        protected var _width:int = 15;
        protected var _height:int = 15;

        public function CloseButtonConfig(k:Object=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        protected function initialise(k:Object):void
        {
            if (k.type != undefined)
            {
                this._type = k.type;
            }
            if (k.color != undefined)
            {
                this._color = k.color;
            }
            if (k.enabled != undefined)
            {
                this._Str_2699 = k.enabled;
            }
            if (k.image != undefined)
            {
                this._Str_8441 = k.image;
            }
            if (k.width != undefined)
            {
                this._width = k.width;
            }
            if (k.height != undefined)
            {
                this._height = k.height;
            }
        }

        public function set type(k:String):void
        {
            this._type = k;
        }

        public function get type():String
        {
            if (this._type != null)
            {
                return this._type.toUpperCase();
            }
            return this._type;
        }

        public function set width(k:int):void
        {
            this._width = k;
        }

        public function get width():int
        {
            return this._width;
        }

        public function set height(k:int):void
        {
            this._height = k;
        }

        public function get height():int
        {
            return this._height;
        }

        public function set color(k:String):void
        {
            this._color = k;
        }

        public function get color():String
        {
            return this._color;
        }

        public function set enabled(k:Boolean):void
        {
            this._Str_2699 = k;
        }

        public function get enabled():Boolean
        {
            return this._Str_2699;
        }

        public function set imageURL(k:String):void
        {
            this._Str_8441 = k;
        }

        public function get imageURL():String
        {
            return this._Str_8441;
        }
    }
}
