package com.sulake.habbo.communication.messages.parser.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ThumbnailStatusMessageParser implements IMessageParser 
    {
        private var _ok:Boolean = true;
        private var _renderLimitHit:Boolean = false;


        public function isOk():Boolean
        {
            return this._ok;
        }

        public function isRenderLimitHit():Boolean
        {
            return this._renderLimitHit;
        }

        public function flush():Boolean
        {
            this._ok = true;
            this._renderLimitHit = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k.bytesAvailable)
            {
                this._ok = k.readBoolean();
                this._renderLimitHit = k.readBoolean();
            }
            return true;
        }
    }
}
