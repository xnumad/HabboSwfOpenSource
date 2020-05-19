package com.sulake.habbo.communication.messages.incoming.camera
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera.CameraPurchaseOKMessageParser;

    public class CameraPurchaseOKMessageEvent extends MessageEvent 
    {
        public function CameraPurchaseOKMessageEvent(k:Function)
        {
            super(k, CameraPurchaseOKMessageParser);
        }

        public function getParser():CameraPurchaseOKMessageParser
        {
            return this._parser as CameraPurchaseOKMessageParser;
        }
    }
}
