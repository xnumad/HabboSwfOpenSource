package com.sulake.habbo.communication.messages.incoming._Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.CameraPurchaseOKMessageParser;

    public class _Str_7027 extends MessageEvent 
    {
        public function _Str_7027(k:Function)
        {
            super(k, CameraPurchaseOKMessageParser);
        }

        public function getParser():CameraPurchaseOKMessageParser
        {
            return this._parser as CameraPurchaseOKMessageParser;
        }
    }
}
