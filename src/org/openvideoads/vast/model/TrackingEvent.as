package org.openvideoads.vast.model
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.util.ArrayUtils;

    public class TrackingEvent extends Debuggable 
    {
        public static const START:String = "start";
        public static const STOP:String = "stop";
        public static const RESUME:String = "resume";
        public static const MIDPOINT:String = "midpoint";
        public static const EVENT_1STQUARTILE:String = "firstQuartile";
        public static const EVENT_3RDQUARTILE:String = "thirdQuartile";
        public static const COMPLETE:String = "complete";
        public static const MUTE:String = "mute";
        public static const UNMUTE:String = "unmute";
        public static const PAUSE:String = "pause";
        public static const REPLAY:String = "replay";
        public static const FULLSCREEN:String = "fullscreen";
        public static const REWIND:String = "rewind";
        public static const EXPAND:String = "expand";
        public static const COLLAPSE:String = "collapse";
        public static const CLOSE:String = "close";
        public static const ACCEPTINVITATION:String = "acceptInvitation";
        public static const CREATIVEVIEW:String = "creativeView";
        public static const _Str_21110:Number = 5000;

        private var _urls:Array;
        private var _eventType:String;
        private var _lastFired:Number = -1;
        private var _alwaysFire:Boolean = false;

        public function TrackingEvent(k:String=null, _arg_2:NetworkResource=null, _arg_3:Boolean=false)
        {
            this._urls = new Array();
            super();
            this._eventType = k;
            this._alwaysFire = _arg_3;
            if (_arg_2 != null)
            {
                this._Str_9951(_arg_2);
            }
        }

        public function unload():void
        {
            var k:int;
            if (this._urls != null)
            {
                k = 0;
                while (k < this._urls.length)
                {
                    this.urls[k].close();
                    k++;
                }
            }
        }

        public function set urls(k:Array):void
        {
            this._urls = k;
        }

        public function get urls():Array
        {
            return this._urls;
        }

        public function getURLList():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this._urls != null)
            {
                _local_2 = 0;
                while (_local_2 < this._urls.length)
                {
                    k.push(NetworkResource(this._urls[_local_2]).url);
                    _local_2++;
                }
            }
            return k;
        }

        public function _Str_9951(k:NetworkResource):void
        {
            this._urls.push(k);
        }

        public function set eventType(k:String):void
        {
            this._eventType = k;
        }

        public function get eventType():String
        {
            return this._eventType;
        }

        public function execute():void
        {
            var k:int;
            while (k < this._urls.length)
            {
                this.urls[k].call();
                k++;
            }
        }

        public function clone():TrackingEvent
        {
            var k:TrackingEvent = new TrackingEvent(this._eventType, null, this._alwaysFire);
            k.urls = this._urls;
            return k;
        }

        override public function toJSObject():Object
        {
            var k:Object = new Object();
            k = {
                "uid":_Str_2995,
                "eventType":this._eventType,
                "urls":ArrayUtils._Str_6975(this._urls),
                "alwaysFire":this._alwaysFire
            }
            return k;
        }
    }
}
