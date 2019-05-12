package org.openvideoads.vast.server.request.injected
{
    import org.openvideoads.vast.server.request.AdServerRequest;

    public class _Str_9148 extends AdServerRequest 
    {
        public function _Str_9148(k:_Str_6762=null)
        {
            super(((k != null) ? k : new _Str_6762()));
        }

        override public function formRequest(k:Array=null):String
        {
            if (_Str_2297 != null)
            {
                _Str_4164 = unescape(_Str_2297.tag);
            }
            else
            {
                _Str_4164 = '<?xml version="1.0" encoding="UTF-8" ?><VAST version="2.0"></VAST>';
            }
            return _Str_4164;
        }
    }
}
