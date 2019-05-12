package com.sulake.core.runtime.events
{
    import flash.events.ProgressEvent;

    public class LibraryProgressEvent extends ProgressEvent 
    {
        private var _elapsedTime:int = 0;
        private var _fileName:String = "";

        public function LibraryProgressEvent(fileName:String, bytesLoaded:uint=0, bytesTotal:uint=0, elapsedTime:int=0)
        {
            this._fileName = fileName;
            this._elapsedTime = elapsedTime;
            super(ProgressEvent.PROGRESS, false, false, bytesLoaded, bytesTotal);
        }

        public function get elapsedTime():int
        {
            return this._elapsedTime;
        }

        public function get fileName():String
        {
            return this._fileName;
        }
    }
}
