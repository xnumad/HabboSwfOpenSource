package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;
    import com.sulake.habbo.communication.enum.ClientPlatform;
    import com.sulake.habbo.communication.enum.ClientDeviceCategory;

    public class _Str_10198 implements IMessageComposer, IPreEncryptionMessage 
    {
        private var _Str_24809:String = "FLASH";


        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:String = "PRODUCTION-201611291003-338511768";
            return new Array(k, this._Str_24809, ClientPlatform.FLASH, ClientDeviceCategory.UNKNOWN);
        }
    }
}
