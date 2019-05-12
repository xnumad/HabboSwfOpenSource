package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.events.ErrorEvent;
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequest;
    import com.sulake.core.runtime.exceptions.Exception;
    import flash.display.LoaderInfo;
    import flash.display.Bitmap;

    public class FurnitureDynamicThumbnailVisualization extends FurnitureThumbnailVisualization 
    {
        private var _Str_6145:String = null;


        private static function _Str_19697(k:ErrorEvent):void
        {
            Logger.log(("External Image thumbnail download error: " + k.toString()));
        }


        override protected function updateModel(k:Number):Boolean
        {
            var _local_2:String;
            var _local_3:Loader;
            var _local_4:LoaderContext;
            if (object != null)
            {
                _local_2 = this.getThumbnailURL();
                if (this._Str_6145 != _local_2)
                {
                    this._Str_6145 = _local_2;
                    if (((!(this._Str_6145 == null)) && (!(this._Str_6145 == ""))))
                    {
                        _local_3 = new Loader();
                        _local_3.name = _local_2;
                        _local_3.contentLoaderInfo.addEventListener(Event.COMPLETE, this._Str_25282);
                        _local_3.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _Str_19697);
                        _local_3.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _Str_19697);
                        _local_4 = new LoaderContext(true);
                        _local_4.checkPolicyFile = true;
                        _local_3.load(new URLRequest(_local_2), _local_4);
                    }
                    else
                    {
                        _Str_6645(null);
                    }
                }
            }
            return super.updateModel(k);
        }

        protected function getThumbnailURL():String
        {
            throw (new Exception("This method must be overridden!"));
        }

        private function _Str_25282(k:Event):void
        {
            var _local_2:LoaderInfo = (k.target as LoaderInfo);
            var _local_3:Bitmap = (_local_2.content as Bitmap);
            if (_local_3 != null)
            {
                _Str_6645(_local_3.bitmapData);
            }
            else
            {
                _Str_6645(null);
            }
        }
    }
}
