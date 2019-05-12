package deng.fzip
{
    import flash.events.Event;

    public class _Str_661 extends Event 
    {
        public static const FILELOADED:String = "fileLoaded";

        public var file:FZipFile;

        public function _Str_661(k:String, _arg_2:FZipFile=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            this.file = _arg_2;
            super(k, _arg_3, _arg_4);
        }

        override public function clone():Event
        {
            return new _Str_661(type, this.file, bubbles, cancelable);
        }

        override public function toString():String
        {
            return ((((((((('[FZipEvent type="' + type) + '" filename="') + this.file.filename) + '" bubbles=') + bubbles) + " cancelable=") + cancelable) + " eventPhase=") + eventPhase) + "]";
        }
    }
}
