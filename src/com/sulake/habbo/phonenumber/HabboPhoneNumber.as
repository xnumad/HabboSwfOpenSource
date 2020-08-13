package com.sulake.habbo.phonenumber
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.gifts.PhoneCollectionStateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.gifts.TryPhoneNumberResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.gifts.TryVerificationCodeResultMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.gifts.TryPhoneNumberMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.gifts.VerifyCodeMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.gifts.SetPhoneNumberVerificationStatusMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.gifts.ResetPhoneNumberStateMessageComposer;
    import flash.utils.getTimer;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;

    public class HabboPhoneNumber extends Component 
    {
        protected var _communicationManager:IHabboCommunicationManager;
        protected var _localizationManager:IHabboLocalizationManager;
        protected var _sessionDataManager:ISessionDataManager;
        protected var _Str_2290:IHabboToolbar;
        protected var _windowManager:IHabboWindowManager;
        private var _connection:IConnection;
        private var _Str_9469:PhoneNumberCollectView;
        private var _Str_7950:PhoneNumberCollectMinimizedView;
        private var _Str_9578:VerificationCodeInputView;
        private var _Str_8160:VerificationCodeInputMinimizedView;
        private var _Str_15062:int;

        public function HabboPhoneNumber(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _Str_2290 = k;
            })]));
        }

        override protected function initComponent():void
        {
            if (getBoolean("sms.identity.verification.enabled"))
            {
                this._connection = this._communicationManager.connection;
                this._connection.addMessageEvent(new PhoneCollectionStateMessageEvent(this._Str_24899));
                this._connection.addMessageEvent(new TryPhoneNumberResultMessageEvent(this._Str_23318));
                this._connection.addMessageEvent(new TryVerificationCodeResultMessageEvent(this._Str_22688));
            }
        }

        public function _Str_22965(k:String, _arg_2:String):void
        {
            this._connection.send(new TryPhoneNumberMessageComposer(k, _arg_2));
        }

        public function _Str_24369(k:String):void
        {
            if (!k)
            {
                return;
            }
            k = k.toUpperCase();
            this._connection.send(new VerifyCodeMessageComposer(k));
        }

        public function _Str_23711():void
        {
            this._connection.send(new SetPhoneNumberVerificationStatusMessageComposer(ClientPhoneVerificationStatusEnum.NEVER_AGAIN));
            this._Str_7383();
        }

        public function _Str_17799(k:Boolean):void
        {
            if (k)
            {
                this._Str_7383();
                this._Str_25774();
            }
            else
            {
                this._Str_21501();
                this._Str_16750();
            }
        }

        public function _Str_16951(k:Boolean):void
        {
            if (k)
            {
                this._Str_9778();
                this._Str_19391();
            }
            else
            {
                this._Str_20335();
                this._Str_13939();
            }
        }

        public function _Str_24068():void
        {
            this._Str_9778();
            this._connection.send(new ResetPhoneNumberStateMessageComposer());
        }

        private function _Str_23318(k:TryPhoneNumberResultMessageEvent):void
        {
            switch (k.getParser().resultCode)
            {
                case PhoneNumberStatusEnum.VERIFIED:
                    this._Str_7383();
                    return;
                case PhoneNumberStatusEnum.OK:
                case PhoneNumberStatusEnum.NON_VERIFIED:
                case PhoneNumberStatusEnum.TOKEN_SENT:
                    this._Str_7383();
                    this._Str_15062 = (k.getParser().millisToAllowProcessReset + getTimer());
                    this._Str_13939();
                    return;
                case PhoneNumberStatusEnum.ERROR:
                case PhoneNumberStatusEnum.RATE_LIMIT:
                case PhoneNumberStatusEnum.NUMBER_MISTYPED:
                case PhoneNumberStatusEnum.NUMBER_ALREADY_VERIFIED:
                    if (((!(this._Str_7950)) && (!(this._Str_9469))))
                    {
                        this._Str_16750();
                    }
                    else
                    {
                        if (this._Str_7950)
                        {
                            this._Str_17799(false);
                        }
                    }
                    this._windowManager.alert("${generic.alert.title}", (("${phone.number.collect.error." + k.getParser().resultCode) + "}"), 0, null);
                    this._Str_9469._Str_16661(k.getParser().resultCode);
                    return;
            }
        }

        private function _Str_22688(k:TryVerificationCodeResultMessageEvent):void
        {
            switch (k.getParser().resultCode)
            {
                case PhoneNumberStatusEnum.VERIFIED:
                case PhoneNumberStatusEnum.OK:
                    this._Str_9778();
                    return;
                case PhoneNumberStatusEnum.ERROR:
                    if (((!(this._Str_8160)) && (!(this._Str_9578))))
                    {
                        this._Str_15062 = (getTimer() + k.getParser().millisecondsToAllowProcessReset);
                        this._Str_13939();
                    }
                    else
                    {
                        if (this._Str_8160)
                        {
                            this._Str_16951(false);
                        }
                    }
                    this._Str_9578._Str_16661(k.getParser().resultCode);
                    return;
            }
        }

        private function _Str_24899(k:PhoneCollectionStateMessageEvent):void
        {
            var _local_2:int = k.getParser().collectionStatusCode;
            var _local_3:int = k.getParser().phoneStatusCode;
            context.configuration.setProperty("phone.collection.status", _local_2.toString());
            context.configuration.setProperty("phone.verification.status", _local_3.toString());
            if (_local_2 == ClientPhoneVerificationStatusEnum.NEVER_AGAIN)
            {
                return;
            }
            if (((_local_2 == ClientPhoneVerificationStatusEnum.TOKEN_INPUT) && ((_local_3 == PhoneNumberStatusEnum.NON_VERIFIED) || (_local_3 == PhoneNumberStatusEnum.TOKEN_SENT))))
            {
                this._Str_7383();
                if (_local_2 == ClientPhoneVerificationStatusEnum.MINIMIZED)
                {
                    this._Str_19391();
                }
                else
                {
                    this._Str_15062 = (k.getParser().millisecondsToAllowProcessReset + getTimer());
                    this._Str_13939();
                }
                return;
            }
            switch (_local_3)
            {
                case PhoneNumberStatusEnum.NON_EXISTING:
                case PhoneNumberStatusEnum.NON_VERIFIED:
                    this._Str_16750();
                    return;
                case PhoneNumberStatusEnum.VERIFIED:
                case PhoneNumberStatusEnum.OK:
                    this._Str_7383();
                    this._Str_9778();
                    return;
                case PhoneNumberStatusEnum.ERROR:
                case PhoneNumberStatusEnum.RATE_LIMIT:
                case PhoneNumberStatusEnum.NUMBER_MISTYPED:
                    Logger.log("INVALID STATE!! Phone number / verify errors should not be handled here!");
                    return;
            }
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get _Str_20480():int
        {
            return this._Str_15062;
        }

        private function _Str_16750():void
        {
            this._Str_7383();
            var k:String = context.configuration.getProperty("phone.number.preferred.countries");
            var _local_2:Array = k.split(",");
            this._Str_9469 = new PhoneNumberCollectView(this, _local_2);
        }

        private function _Str_13939():void
        {
            this._Str_9778();
            this._Str_9578 = new VerificationCodeInputView(this);
        }

        private function _Str_25774():void
        {
            this._Str_21501();
            this._Str_7950 = new PhoneNumberCollectMinimizedView(this);
            this._Str_2290.extensionView.attachExtension(ToolbarDisplayExtensionIds.PHONE_NUMBER, this._Str_7950.window, ExtensionFixedSlotsEnum._Str_13012);
        }

        private function _Str_19391():void
        {
            this._Str_20335();
            this._Str_8160 = new VerificationCodeInputMinimizedView(this);
            this._Str_2290.extensionView.attachExtension(ToolbarDisplayExtensionIds.VERIFICATION_CODE, this._Str_8160.window, ExtensionFixedSlotsEnum._Str_13012);
        }

        private function _Str_7383():void
        {
            if (this._Str_9469)
            {
                this._Str_9469.dispose();
                this._Str_9469 = null;
            }
        }

        private function _Str_9778():void
        {
            if (this._Str_9578)
            {
                this._Str_9578.dispose();
                this._Str_9578 = null;
            }
        }

        private function _Str_21501():void
        {
            this._Str_2290.extensionView.detachExtension(ToolbarDisplayExtensionIds.PHONE_NUMBER);
            if (this._Str_7950)
            {
                this._Str_7950.dispose();
                this._Str_7950 = null;
            }
        }

        private function _Str_20335():void
        {
            this._Str_2290.extensionView.detachExtension(ToolbarDisplayExtensionIds.VERIFICATION_CODE);
            if (this._Str_8160)
            {
                this._Str_8160.dispose();
                this._Str_8160 = null;
            }
        }
    }
}
