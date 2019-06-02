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

        protected var _data:Object = null;

        public function TemplateEvent(k:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            if (_arg_2 != null)
            {
                this._data = _arg_2;
            }
        }

        public function _Str_13568():Boolean
        {
            return !(this._data == null);
        }

        public function set data(k:Object):void
        {
            this._data = k;
        }

        public function get data():Object
        {
            return this._data;
        }

        public function _Str_18017():Boolean
        {
            return (!(this._data == null)) && (this.data is AdServerTemplate);
        }

        public function get template():AdServerTemplate
        {
            return this._data as AdServerTemplate;
        }

        override public function clone():Event
        {
            return new TemplateEvent(type, this._data, bubbles, cancelable);
        }

        override public function toString():String
        {
            if (this._data != null)
            {
                return this._data.toString();
            }
            return "No error message provided";
        }
    }
}
