package deng.fzip
{
    import flash.events.Event;

    public class _Str_897 extends Event 
    {
        public static const PARSEERROR:String = "parseError";

        public var text:String;

        public function _Str_897(k:String, _arg_2:String="", _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            this.text = _arg_2;
            super(k, _arg_3, _arg_4);
        }

        override public function clone():Event
        {
            return new _Str_897(type, this.text, bubbles, cancelable);
        }
    }
}
