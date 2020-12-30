package org.openvideoads.regions.config
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.StringUtils;
    import flash.display.Bitmap;
    import flash.display.Loader;

    public class BaseRegionConfig extends Debuggable 
    {
        protected var _Str_19957:String;
        protected var _style:String = null;
        protected var _id:String = null;
        protected var _border:String = null;
        protected var _Str_10333:int = -1;
        protected var _Str_17448:int = -1;
        protected var _Str_16588:String = null;
        protected var _background:String = null;
        protected var _Str_20337:String = null;
        protected var _Str_18917:* = null;
        protected var _backgroundImage:String = null;
        protected var _Str_17542:String = null;
        protected var _backgroundColor:String = null;
        protected var _Str_20596:String = null;
        protected var _closeButton:CloseButtonConfig;
        protected var _Str_11028:Number = -1;
        protected var _Str_20720:String = "5 5 5 5";
        protected var _Str_12703:Number = 1;
        protected var _Str_4544:String = null;
        protected var _image:* = null;
        protected var _Str_6712:* = null;

        public function BaseRegionConfig(k:Object=null)
        {
            this._closeButton = new CloseButtonConfig();
            super();
            this.setup(k);
        }

        public function setup(k:Object):void
        {
            if (k != null)
            {
                if (k.id != undefined)
                {
                    this.id = k.id;
                }
                if (k.stylesheet != undefined)
                {
                    this.stylesheet = k.stylesheet;
                }
                if (k.style != undefined)
                {
                    this.style = k.style;
                }
                if (k.border != undefined)
                {
                    this.border = k.border;
                }
                if (k.borderRadius != undefined)
                {
                    this.borderRadius = k.borderRadius;
                }
                if (k.borderColor != undefined)
                {
                    this.borderColor = k.borderColor;
                }
                if (k.borderWidth != undefined)
                {
                    this.borderWidth = k.borderWidth;
                }
                if (k.backgroundGradient != undefined)
                {
                    this.backgroundGradient = k.backgroundGradient;
                }
                if (k.background != undefined)
                {
                    this.background = k.background;
                }
                if (k.backgroundImage != undefined)
                {
                    this.backgroundImage = StringUtils._Str_20351(k.backgroundImage, "%27");
                }
                if (k.backgroundRepeat != undefined)
                {
                    this.backgroundRepeat = k.backgroundRepeat;
                }
                if (k.backgroundColor != undefined)
                {
                    this.backgroundColor = k.backgroundColor;
                }
                if (k.closeButton != undefined)
                {
                    if ((k.closeButton is CloseButtonConfig))
                    {
                        this._closeButton = k.closeButton;
                    }
                    else
                    {
                        this._closeButton = new CloseButtonConfig(k.closeButton);
                    }
                }
                if (k.padding != undefined)
                {
                    this.padding = k.padding;
                }
                if (k.opacity != undefined)
                {
                    this.opacity = k.opacity;
                }
                if (k.html != undefined)
                {
                    this.html = StringUtils._Str_20351(k.html, "'");
                }
                if (k.image != undefined)
                {
                    this.image = k.image;
                }
                if (k.swf != undefined)
                {
                    this.swf = k.swf;
                }
            }
        }

        public function set id(k:String):void
        {
            this._id = k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set style(k:String):void
        {
            this._style = k;
        }

        public function get style():String
        {
            return this._style;
        }

        public function set stylesheet(k:String):void
        {
            this._Str_19957 = k;
        }

        public function get stylesheet():String
        {
            return this._Str_19957;
        }

        public function set html(k:String):void
        {
            this._Str_4544 = k;
        }

        public function get html():String
        {
            return this._Str_4544;
        }

        public function set borderRadius(k:int):void
        {
            this._Str_10333 = k;
        }

        public function get borderRadius():int
        {
            return this._Str_10333;
        }

        public function _Str_18926():Boolean
        {
            return this._Str_10333 > -1;
        }

        public function set borderWidth(k:int):void
        {
            this._Str_17448 = k;
        }

        public function get borderWidth():int
        {
            return this._Str_17448;
        }

        public function _Str_15962():Boolean
        {
            return this._Str_17448 > -1;
        }

        public function set border(k:String):void
        {
            this._border = k;
        }

        public function get border():String
        {
            return this._border;
        }

        public function _Str_14610():Boolean
        {
            return !(this._border == null);
        }

        public function set borderColor(k:String):void
        {
            this._Str_16588 = k;
        }

        public function get borderColor():String
        {
            return this._Str_16588;
        }

        public function _Str_16762():Boolean
        {
            return !(this._Str_16588 == null);
        }

        public function set background(k:String):void
        {
            this._background = k;
            this._Str_20337 = k;
        }

        public function get background():String
        {
            return this._background;
        }

        public function _Str_18749():Boolean
        {
            return !(this._background == null);
        }

        public function set _Str_23263(k:Boolean):void
        {
            if (k)
            {
                this._Str_11493();
            }
            else
            {
                this._Str_12711();
            }
        }

        public function _Str_11493():void
        {
            this._background = "transparent";
            this._backgroundColor = "transparent";
        }

        public function _Str_12711():void
        {
            this._background = this._Str_20337;
            this._backgroundColor = this._Str_20596;
        }

        public function set backgroundRepeat(k:String):void
        {
            this._Str_17542 = k;
        }

        public function get backgroundRepeat():String
        {
            return this._Str_17542;
        }

        public function _Str_25893():Boolean
        {
            return !(this._Str_17542 == null);
        }

        public function set backgroundGradient(k:*):void
        {
            this._Str_18917 = k;
        }

        public function get backgroundGradient():*
        {
            return this._Str_18917;
        }

        public function _Str_16430():Boolean
        {
            return !(this._Str_18917 == null);
        }

        public function set backgroundImage(k:String):void
        {
            this._backgroundImage = k;
        }

        public function get backgroundImage():String
        {
            return this._backgroundImage;
        }

        public function _Str_26209():Boolean
        {
            return !(this._backgroundImage == null);
        }

        public function set backgroundColor(k:String):void
        {
            this._backgroundColor = k;
            this._Str_20596 = k;
        }

        public function get backgroundColor():String
        {
            return this._backgroundColor;
        }

        public function _Str_15500():Boolean
        {
            return !(this._backgroundColor == null);
        }

        public function set opacity(k:Number):void
        {
            this._Str_11028 = k;
        }

        public function get opacity():Number
        {
            return this._Str_11028;
        }

        public function _Str_16995():Boolean
        {
            return this._Str_11028 > -1;
        }

        public function set padding(k:String):void
        {
            this._Str_20720 = k;
        }

        public function get padding():String
        {
            return this._Str_20720;
        }

        public function set scaleRate(k:Number):void
        {
            this._Str_12703 = k;
        }

        public function get scaleRate():Number
        {
            return this._Str_12703;
        }

        public function set image(k:*):void
        {
            this._image = k;
        }

        public function get image():*
        {
            return this._image;
        }

        public function _Str_24560():Boolean
        {
            return !(this._image == null);
        }

        public function _Str_24467():Boolean
        {
            return this._image is Bitmap;
        }

        public function _Str_23156():Boolean
        {
            return this._image is Loader;
        }

        public function set swf(k:*):void
        {
            this._Str_6712 = k;
        }

        public function get swf():*
        {
            return this._Str_6712;
        }

        public function _Str_23612():Boolean
        {
            return !(this._Str_6712 == null);
        }

        public function get properties():Object
        {
            var k:Object = new Object();
            k.id = this.id;
            k.border = this.border;
            k.borderRadius = this.borderRadius;
            k.backgroundGradient = this.backgroundGradient;
            k.backgroundImage = this.backgroundImage;
            k.backgroundColor = this.backgroundColor;
            k.closeButton = this.closeButton;
            k.opacity = this.opacity;
            k.stylesheet = this.stylesheet;
            k.style = this.style;
            k.scaleRate = this.scaleRate;
            k.image = this.image;
            k.swf = this.swf;
            return k;
        }

        public function set closeButton(k:CloseButtonConfig):void
        {
            this._closeButton = k;
        }

        public function get closeButton():CloseButtonConfig
        {
            return this._closeButton;
        }

        public function _Str_16602():Boolean
        {
            return (this._closeButton != null) ? this._closeButton.enabled : true;
        }
    }
}
