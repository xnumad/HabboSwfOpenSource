package org.openvideoads.vast.server.events
{
    import flash.events.Event;
    import org.openvideoads.vast.server.response.AdServerTemplate;

    public class TemplateEvent extends Event 
    {
        public static const LOADED:String = "loaded";
        public static const _Str_14592:String = "load-failed";
        public static const _Str_6699:String = "load-timeout";
        public static const _Str_6462:String = "load-deferred";

        protected var _Str_594:Object = null;

        public function TemplateEvent(k:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            if (_arg_2 != null)
            {
                this._Str_594 = _arg_2;
            }
        }

        public function _Str_13568():Boolean
        {
            return !(this._Str_594 == null);
        }

        public function set data(k:Object):void
        {
            this._Str_594 = k;
        }

        public function get data():Object
        {
            return this._Str_594;
        }

        public function _Str_18017():Boolean
        {
            return (!(this._Str_594 == null)) && (this.data is AdServerTemplate);
        }

        public function get template():AdServerTemplate
        {
            return this._Str_594 as AdServerTemplate;
        }

        override public function clone():Event
        {
            return new TemplateEvent(type, this._Str_594, bubbles, cancelable);
        }

        override public function toString():String
        {
            if (this._Str_594 != null)
            {
                return this._Str_594.toString();
            }
            return "No error message provided";
        }
    }
}
