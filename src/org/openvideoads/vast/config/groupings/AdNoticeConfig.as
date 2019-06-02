package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class AdNoticeConfig extends Debuggable 
    {
        public static var _Str_16878:String = "normaltext";
        public static var _Str_20733:String = "smalltext";
        public static var _Str_19027:String = "<p class='_textclass_' align='right'>This advertisement runs for _seconds_ seconds</p>";
        public static var _Str_18131:String = "<p class='_textclass_' align='right'>This advertisement runs for _countdown_ seconds</p>";

        protected var _Str_20745:Boolean = true;
        protected var _Str_1518:String = null;
        protected var _Str_2442:String = "reserved-system-message";
        protected var _Str_15582:String;
        protected var _type:String = "STATIC";

        public function AdNoticeConfig(k:Object=null)
        {
            this._Str_15582 = _Str_16878;
            super();
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            if (k.hasOwnProperty("show"))
            {
                this.show = k.show;
            }
            if (k.hasOwnProperty("type"))
            {
                this.type = k.type;
            }
            if (k.hasOwnProperty("region"))
            {
                this.region = k.region;
            }
            if (k.hasOwnProperty("textStyle"))
            {
                this.textStyle = k.textStyle;
            }
            if (k.hasOwnProperty("message"))
            {
                this.message = k.message;
            }
        }

        public function set type(k:String):void
        {
            if (k != null)
            {
                if (k.toUpperCase() == "STATIC")
                {
                    this._type = "STATIC";
                }
                else
                {
                    this._type = "COUNTDOWN";
                }
            }
        }

        public function get type():String
        {
            return this._type;
        }

        public function _Str_23309():Boolean
        {
            return this._Str_1518.indexOf("_countdown_") > -1;
        }

        public function isStatic():Boolean
        {
            return !(this._Str_23309());
        }

        public function set show(k:Boolean):void
        {
            this._Str_20745 = k;
        }

        public function get show():Boolean
        {
            return this._Str_20745;
        }

        public function set message(k:String):void
        {
            this._Str_1518 = k;
        }

        public function get message():String
        {
            if (this._Str_1518 == null)
            {
                if (this._type == "STATIC")
                {
                    this._Str_1518 = _Str_19027;
                }
                else
                {
                    this._Str_1518 = _Str_18131;
                }
            }
            var k:RegExp = new RegExp("_textclass_", "g");
            return this._Str_1518.replace(k, this._Str_15582);
        }

        public function get textStyle():String
        {
            return this._Str_15582;
        }

        public function set textStyle(k:String):void
        {
            this._Str_15582 = k;
        }

        public function set region(k:String):void
        {
            this._Str_2442 = k;
        }

        public function get region():String
        {
            return this._Str_2442;
        }
    }
}
